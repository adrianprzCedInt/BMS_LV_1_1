/*******************************************************************************
 * @file    adbms6830b.c
 * @brief   Driver ADBMS6830B - PIC32MX795F512L + MPLAB Harmony + FreeRTOS
 *
 * Cambios principales:
 *  - Lee las 16 celdas con RDCVALL en una sola transaccion.
 *  - Opcionalmente lee las 16 medias con RDACALL en una sola transaccion.
 *  - Conversion correcta de CxV/ACxV: int16_t * 150 uV + 1.5 V.
 *  - PEC10 generico para paquetes de 6, 32 o 64 bytes.
 *  - CRC15/CRC10 calculados por bit, sin tablas.
 *
 * IMPORTANTE:
 *  - En prueba_claude.h, BMS_TestResult_t debe tener arrays de 16:
 *      uint16_t cell_raw[16];
 *      float    cell_voltage[16];
 *    Si quieres guardar tambien medias:
 *      uint16_t cell_avg_raw[16];
 *      float    cell_avg_voltage[16];
 ******************************************************************************/

#include <stdbool.h>
#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include <stdio.h>

#include "prueba_claude.h"
#include "definitions.h"

#include "FreeRTOS.h"
#include "task.h"

/* ============================================================================
 * PINES CS
 * ============================================================================ */
#define BMS_CS_DESELECT()   BMS_CS_Set()    /* CSB = HIGH, inactivo */
#define BMS_CS_SELECT()     BMS_CS_Clear()  /* CSB = LOW, activo   */

/* ============================================================================
 * CONFIG
 * ============================================================================ */
#define SPI_TIMEOUT_MS          10u
#define BMS_CELL_COUNT          16u
#define BMS_ALL_CELL_DATA_LEN   32u
#define BMS_ALL_CELL_FRAME_LEN  38u    /* 4 comando + 32 datos + 2 PEC */

/* ============================================================================
 * COMANDOS ADBMS6830B
 * ============================================================================ */
static const uint8_t CMD_WRCFGA[2]  = { 0x00u, 0x01u };
static const uint8_t CMD_RDCFGA[2]  = { 0x00u, 0x02u };

/*
 * ADCV:
 * RD=0, CONT=0, DCP=0, RSTF=0, OW=00
 * CC[10:0] = 0b010_0110_0000 = 0x260
 */
static const uint8_t CMD_ADCV[2]    = { 0x02u, 0x60u };

/*
 * Read All Cell Results:
 * RDCVALL: lee Cell Voltage Register Groups A..F.
 * 32 bytes de datos + 2 bytes de PEC.
 */
static const uint8_t CMD_RDCVALL[2] = { 0x00u, 0x0Cu };

/*
 * Read All Averaged Cell Results:
 * RDACALL: lee Averaged Cell Voltage Register Groups A..F.
 * 32 bytes de datos + 2 bytes de PEC.
 */
static const uint8_t CMD_RDACALL[2] = { 0x00u, 0x4Cu };

/* Opcionales de depuracion */
static const uint8_t CMD_CLRCELL[2] = { 0x07u, 0x21u };
static const uint8_t CMD_RSTCC[2]   = { 0x00u, 0x2Eu };

/* ============================================================================
 * TIPOS PRIVADOS
 * ============================================================================ */
typedef enum
{
    BMS_ERR_NONE = 0,
    BMS_ERR_SPI_TIMEOUT,
    BMS_ERR_CFG_WRITE,
    BMS_ERR_CFG_READ,
    BMS_ERR_CFG_PEC,
    BMS_ERR_CFG_REFON,
    BMS_ERR_ADCV_CMD,
    BMS_ERR_RDCVALL_READ,
    BMS_ERR_RDCVALL_PEC,
    BMS_ERR_RDACALL_READ,
    BMS_ERR_RDACALL_PEC
} BMS_Error_t;

/* ============================================================================
 * VARIABLE GLOBAL DE RESULTADO
 * ============================================================================ */
static BMS_TestResult_t g_result;

/* ============================================================================
 * CRC / PEC
 * ============================================================================ */

/*
 * PEC15 de comando.
 *
 * Polinomio:
 *   x^15 + x^14 + x^10 + x^8 + x^7 + x^4 + x^3 + 1
 *
 * Representacion usada comunmente:
 *   0x4599
 *
 * Valor inicial:
 *   0x0010
 *
 * El resultado transmitido va alineado a la izquierda, por eso se devuelve rem << 1.
 */
static uint16_t PEC15_calc(uint8_t len, const uint8_t *data)
{
    uint16_t rem = 16u;

    for (uint8_t i = 0u; i < len; i++)
    {
        rem ^= ((uint16_t)data[i] << 7u);

        for (uint8_t bit = 0u; bit < 8u; bit++)
        {
            if ((rem & 0x4000u) != 0u)
            {
                rem = (uint16_t)((rem << 1u) ^ 0x4599u);
            }
            else
            {
                rem = (uint16_t)(rem << 1u);
            }
        }
    }

    return (uint16_t)((rem << 1u) & 0xFFFFu);
}

/*
 * PEC10 de datos.
 *
 * Polinomio:
 *   x^10 + x^7 + x^3 + x^2 + x + 1
 *
 * Representacion:
 *   0x08F
 *
 * Valor inicial:
 *   0x010
 *
 * Para lecturas:
 *   - El PEC cubre todos los bytes de datos.
 *   - Tambien incluye CCNT[5:0].
 *
 * Para escrituras:
 *   - Usar ccnt = 0.
 *
 * Formato de lectura:
 *   PEC0[7:2] = CCNT[5:0]
 *   PEC0[1:0] = PEC[9:8]
 *   PEC1[7:0] = PEC[7:0]
 *
 * Formato de escritura:
 *   PEC0[7:2] = 0
 *   PEC0[1:0] = PEC[9:8]
 *   PEC1[7:0] = PEC[7:0]
 */
static uint16_t PEC10_calc_bytes(const uint8_t *data, uint16_t len, uint8_t ccnt)
{
    uint16_t rem = 16u;

    for (uint16_t i = 0u; i < len; i++)
    {
        rem ^= ((uint16_t)data[i] << 2u);

        for (uint8_t bit = 0u; bit < 8u; bit++)
        {
            if ((rem & 0x200u) != 0u)
            {
                rem = (uint16_t)((rem << 1u) ^ 0x08Fu);
            }
            else
            {
                rem = (uint16_t)(rem << 1u);
            }

            rem &= 0x3FFu;
        }
    }

    /*
     * Incorpora CCNT como si fuesen los 6 bits superiores del byte PEC0.
     * Equivale a procesar CCNT[5:0] seguido de los dos bits PEC[9:8].
     */
    rem ^= ((uint16_t)(ccnt & 0x3Fu) << 4u);

    for (uint8_t bit = 0u; bit < 6u; bit++)
    {
        if ((rem & 0x200u) != 0u)
        {
            rem = (uint16_t)((rem << 1u) ^ 0x08Fu);
        }
        else
        {
            rem = (uint16_t)(rem << 1u);
        }

        rem &= 0x3FFu;
    }

    return (uint16_t)(rem & 0x3FFu);
}

/* ============================================================================
 * CONVERSION RESULTADO -> VOLTAJE
 * ============================================================================ */

/*
 * El registro CxV/ACxV/FCxV es de 16 bits con representacion firmada.
 *
 * Formula:
 *   V = CxV * 150 uV + 1.5 V
 *
 * Ejemplos:
 *   raw_u16 = 0x0000 -> raw_s16 =      0 -> 1.5000 V
 *   raw_u16 = 0x4000 -> raw_s16 =  16384 -> 3.9576 V
 *   raw_u16 = 0x8000 -> raw_s16 = -32768 -> -3.4152 V, valor de reset/clear
 */
static float BMS_CellRawToVoltage(uint16_t raw_u16)
{
    int16_t raw_s16 = (int16_t)raw_u16;
    return ((float)raw_s16 * 150e-6f) + 1.5f;
}

/* ============================================================================
 * SPI WRAPPER
 * ============================================================================ */

static bool BMS_SPI_Transfer(const uint8_t *tx_buf,
                             size_t tx_size,
                             uint8_t *rx_buf,
                             size_t rx_size)
{
    uint32_t ms = 0u;

    while (SPI2_IsBusy() && (ms < SPI_TIMEOUT_MS))
    {
        taskYIELD();
        vTaskDelay(pdMS_TO_TICKS(1u));
        ms++;
    }

    if (ms >= SPI_TIMEOUT_MS)
    {
        g_result.spi_timeout = true;
        return false;
    }

    if (!SPI2_WriteRead((void *)tx_buf, tx_size, rx_buf, rx_size))
    {
        g_result.spi_timeout = true;
        return false;
    }

    ms = 0u;
    while (SPI2_IsBusy() && (ms < SPI_TIMEOUT_MS))
    {
        taskYIELD();
        vTaskDelay(pdMS_TO_TICKS(1u));
        ms++;
    }

    if (ms >= SPI_TIMEOUT_MS)
    {
        g_result.spi_timeout = true;
        return false;
    }

    return true;
}

/* ============================================================================
 * WAKEUP
 * ============================================================================ */

void BMS_WakeupIC(void)
{
    BMS_CS_SELECT();
    vTaskDelay(pdMS_TO_TICKS(1u));
    BMS_CS_DESELECT();
    vTaskDelay(pdMS_TO_TICKS(2u));
}

/* ============================================================================
 * COMANDOS BASICOS
 * ============================================================================ */

static bool BMS_SendCmd(const uint8_t cmd[2])
{
    uint8_t tx[4];
    uint8_t rx[4];

    uint16_t pec = PEC15_calc(2u, cmd);

    tx[0] = cmd[0];
    tx[1] = cmd[1];
    tx[2] = (uint8_t)(pec >> 8u);
    tx[3] = (uint8_t)(pec & 0xFFu);

    BMS_CS_SELECT();
    bool ok = BMS_SPI_Transfer(tx, sizeof(tx), rx, sizeof(rx));
    BMS_CS_DESELECT();

    return ok;
}

/*
 * Escritura de registro de 6 bytes:
 *   CMD0 CMD1 CPEC0 CPEC1 D0..D5 DPEC0 DPEC1
 */
static bool BMS_WriteRegister6(const uint8_t cmd[2], const uint8_t data[6])
{
    uint8_t tx[12];
    uint8_t rx[12];

    uint16_t cmd_pec = PEC15_calc(2u, cmd);
    uint16_t data_pec = PEC10_calc_bytes(data, 6u, 0u);

    tx[0] = cmd[0];
    tx[1] = cmd[1];
    tx[2] = (uint8_t)(cmd_pec >> 8u);
    tx[3] = (uint8_t)(cmd_pec & 0xFFu);

    for (uint8_t i = 0u; i < 6u; i++)
    {
        tx[4u + i] = data[i];
    }

    tx[10] = (uint8_t)((data_pec >> 8u) & 0x03u);
    tx[11] = (uint8_t)(data_pec & 0xFFu);

    BMS_CS_SELECT();
    bool ok = BMS_SPI_Transfer(tx, sizeof(tx), rx, sizeof(rx));
    BMS_CS_DESELECT();

    return ok;
}

/*
 * Lectura de registro normal de 6 bytes + PEC.
 */
static bool BMS_ReadRegister6(const uint8_t cmd[2],
                              uint8_t data_out[6],
                              bool *pec_ok_out,
                              uint8_t *cmd_cnt_out)
{
    uint8_t tx[12];
    uint8_t rx[12];

    uint16_t cmd_pec = PEC15_calc(2u, cmd);

    memset(tx, 0xFFu, sizeof(tx));
    memset(rx, 0x00u, sizeof(rx));

    tx[0] = cmd[0];
    tx[1] = cmd[1];
    tx[2] = (uint8_t)(cmd_pec >> 8u);
    tx[3] = (uint8_t)(cmd_pec & 0xFFu);

    BMS_CS_SELECT();
    bool ok = BMS_SPI_Transfer(tx, sizeof(tx), rx, sizeof(rx));
    BMS_CS_DESELECT();

    if (!ok)
    {
        if (pec_ok_out != NULL)  *pec_ok_out = false;
        if (cmd_cnt_out != NULL) *cmd_cnt_out = 0u;
        return false;
    }

    uint8_t *resp = &rx[4u];

    for (uint8_t i = 0u; i < 6u; i++)
    {
        data_out[i] = resp[i];
    }

    uint8_t ccnt = (uint8_t)((resp[6u] >> 2u) & 0x3Fu);

    uint16_t rx_pec = (uint16_t)((((uint16_t)resp[6u] & 0x03u) << 8u)
                                | ((uint16_t)resp[7u]));

    uint16_t calc_pec = PEC10_calc_bytes(resp, 6u, ccnt);
    bool pec_ok = (rx_pec == calc_pec);

    if (pec_ok_out != NULL)  *pec_ok_out = pec_ok;
    if (cmd_cnt_out != NULL) *cmd_cnt_out = ccnt;

    return true;
}

/*
 * Lectura tipo "ALL" de 16 resultados de celda:
 *   RDCVALL  -> Cell Voltage A..F
 *   RDACALL  -> Average Cell Voltage A..F
 *
 * Transaccion total:
 *   TX: CMD0 CMD1 CPEC0 CPEC1 FF...FF
 *   RX: xxxx xxxx xxxx xxxx D0..D31 PEC0 PEC1
 */
static bool BMS_ReadAllCellLikeRegister(const uint8_t cmd[2],
                                        uint16_t raw_out[BMS_CELL_COUNT],
                                        float voltage_out[BMS_CELL_COUNT],
                                        bool *pec_ok_out,
                                        uint8_t *cmd_cnt_out)
{
    uint8_t tx[BMS_ALL_CELL_FRAME_LEN];
    uint8_t rx[BMS_ALL_CELL_FRAME_LEN];

    uint16_t cmd_pec = PEC15_calc(2u, cmd);

    memset(tx, 0xFFu, sizeof(tx));
    memset(rx, 0x00u, sizeof(rx));

    tx[0] = cmd[0];
    tx[1] = cmd[1];
    tx[2] = (uint8_t)(cmd_pec >> 8u);
    tx[3] = (uint8_t)(cmd_pec & 0xFFu);

    BMS_CS_SELECT();
    bool ok = BMS_SPI_Transfer(tx, sizeof(tx), rx, sizeof(rx));
    BMS_CS_DESELECT();

    if (!ok)
    {
        if (pec_ok_out != NULL)  *pec_ok_out = false;
        if (cmd_cnt_out != NULL) *cmd_cnt_out = 0u;
        return false;
    }

    const uint8_t *data = &rx[4u];

    uint8_t pec0 = rx[36u];
    uint8_t pec1 = rx[37u];

    uint8_t ccnt = (uint8_t)((pec0 >> 2u) & 0x3Fu);

    uint16_t rx_pec = (uint16_t)((((uint16_t)pec0 & 0x03u) << 8u)
                                | ((uint16_t)pec1));

    uint16_t calc_pec = PEC10_calc_bytes(data, BMS_ALL_CELL_DATA_LEN, ccnt);

    bool pec_ok = (rx_pec == calc_pec);

    if (pec_ok_out != NULL)  *pec_ok_out = pec_ok;
    if (cmd_cnt_out != NULL) *cmd_cnt_out = ccnt;

    if (!pec_ok)
    {
        return true; /* SPI OK, pero datos no validos */
    }

    for (uint8_t i = 0u; i < BMS_CELL_COUNT; i++)
    {
        uint16_t raw = (uint16_t)data[2u * i]
                     | ((uint16_t)data[(2u * i) + 1u] << 8u);

        raw_out[i] = raw;

        if (voltage_out != NULL)
        {
            voltage_out[i] = BMS_CellRawToVoltage(raw);
        }
    }

    return true;
}

static bool BMS_ReadAllCells(uint16_t raw_out[BMS_CELL_COUNT],
                             float voltage_out[BMS_CELL_COUNT],
                             bool *pec_ok_out,
                             uint8_t *cmd_cnt_out)
{
    return BMS_ReadAllCellLikeRegister(CMD_RDCVALL,
                                       raw_out,
                                       voltage_out,
                                       pec_ok_out,
                                       cmd_cnt_out);
}

static bool BMS_ReadAllAveragedCells(uint16_t raw_out[BMS_CELL_COUNT],
                                     float voltage_out[BMS_CELL_COUNT],
                                     bool *pec_ok_out,
                                     uint8_t *cmd_cnt_out)
{
    return BMS_ReadAllCellLikeRegister(CMD_RDACALL,
                                       raw_out,
                                       voltage_out,
                                       pec_ok_out,
                                       cmd_cnt_out);
}

/* ============================================================================
 * UART
 * ============================================================================ */

static void UART_Print(const char *msg)
{
    while (UART1_WriteIsBusy())
    {
        taskYIELD();
    }

    UART1_Write((void *)msg, strlen(msg));

    while (!UART1_TransmitComplete())
    {
        taskYIELD();
    }
}

/* ============================================================================
 * TAREA PRINCIPAL
 * ============================================================================ */

void BMS_SpiTestTask(void *pvParameters)
{
    (void)pvParameters;

    char buffer[520];

    BMS_Error_t err = BMS_ERR_NONE;

    bool write_ok = false;
    bool read_ok = false;
    bool pec_ok = false;

    uint8_t cmd_cnt = 0u;

    uint8_t cfga_read[6] = {0u};
    uint8_t cfga_write[6] = {0u};

    memset(&g_result, 0, sizeof(g_result));

    /*
     * Power-up delay.
     */
    BMS_CS_DESELECT();
    vTaskDelay(pdMS_TO_TICKS(100u));

    /*
     * Wakeup repetido.
     */
    for (uint8_t i = 0u; i < 5u; i++)
    {
        BMS_WakeupIC();
        vTaskDelay(pdMS_TO_TICKS(3u));
    }

    /*
     * Opcional: reset del command counter y limpiar registros de celda.
     * Si no lo quieres, comenta estas dos lineas.
     */
    BMS_WakeupIC();
    (void)BMS_SendCmd(CMD_RSTCC);

    BMS_WakeupIC();
    (void)BMS_SendCmd(CMD_CLRCELL);

    vTaskDelay(pdMS_TO_TICKS(2u));

    /*
     * WRCFGA: REFON = 1.
     *
     * CFGAR0 bit 7 = REFON.
     * Ojo: en el datasheet CFGAR0[7] es REFON.
     * Por eso aqui debe ser 0x80, no 0x01.
     */
    memset(cfga_write, 0x00u, sizeof(cfga_write));
    cfga_write[0] = 0x80u;  /* REFON = 1 */

    BMS_WakeupIC();
    write_ok = BMS_WriteRegister6(CMD_WRCFGA, cfga_write);

    if (!write_ok)
    {
        err = g_result.spi_timeout ? BMS_ERR_SPI_TIMEOUT : BMS_ERR_CFG_WRITE;
        goto report_loop;
    }

    vTaskDelay(pdMS_TO_TICKS(5u));

    /*
     * RDCFGA: verificar REFON y PEC.
     */
    BMS_WakeupIC();
    read_ok = BMS_ReadRegister6(CMD_RDCFGA, cfga_read, &pec_ok, &cmd_cnt);

    if (!read_ok)
    {
        err = g_result.spi_timeout ? BMS_ERR_SPI_TIMEOUT : BMS_ERR_CFG_READ;
        goto report_loop;
    }

    if (!pec_ok)
    {
        err = BMS_ERR_CFG_PEC;
        goto report_loop;
    }

    if ((cfga_read[0] & 0x80u) == 0u)
    {
        err = BMS_ERR_CFG_REFON;
        goto report_loop;
    }

    memcpy(g_result.rx_cfga, cfga_read, 6u);
    g_result.pec_ok = true;
    g_result.cmd_counter = cmd_cnt;
    g_result.wrcfga_rdcfga_ok = true;

    /*
     * ADCV: lanzar conversion single-shot.
     */
    BMS_WakeupIC();

    if (!BMS_SendCmd(CMD_ADCV))
    {
        err = g_result.spi_timeout ? BMS_ERR_SPI_TIMEOUT : BMS_ERR_ADCV_CMD;
        goto report_loop;
    }

    /*
     * Espera conservadora:
     * tREFUP max 4.4 ms + conversion + margen.
     */
    vTaskDelay(pdMS_TO_TICKS(10u));

    /*
     * Leer las 16 celdas con una sola transaccion RDCVALL.
     */
    BMS_WakeupIC();

    read_ok = BMS_ReadAllCells(g_result.cell_raw,
                               g_result.cell_voltage,
                               &pec_ok,
                               &cmd_cnt);

    if (!read_ok)
    {
        err = g_result.spi_timeout ? BMS_ERR_SPI_TIMEOUT : BMS_ERR_RDCVALL_READ;
        goto report_loop;
    }

    if (!pec_ok)
    {
        err = BMS_ERR_RDCVALL_PEC;
        goto report_loop;
    }

    g_result.pec_ok = true;
    g_result.cmd_counter = cmd_cnt;

#if 0
    /*
     * Opcional: leer tambien las 16 medias con RDACALL.
     * Para usarlo, anade estos campos a BMS_TestResult_t:
     *   uint16_t cell_avg_raw[16];
     *   float    cell_avg_voltage[16];
     */
    BMS_WakeupIC();

    read_ok = BMS_ReadAllAveragedCells(g_result.cell_avg_raw,
                                       g_result.cell_avg_voltage,
                                       &pec_ok,
                                       &cmd_cnt);

    if (!read_ok)
    {
        err = g_result.spi_timeout ? BMS_ERR_SPI_TIMEOUT : BMS_ERR_RDACALL_READ;
        goto report_loop;
    }

    if (!pec_ok)
    {
        err = BMS_ERR_RDACALL_PEC;
        goto report_loop;
    }
#endif

    err = BMS_ERR_NONE;

report_loop:
    for (;;)
    {
snprintf(buffer, sizeof(buffer),
         "err:%u ok:%u pec:%u cnt:%u | "
         "RAWhex:%04X %04X %04X %04X %04X %04X %04X %04X %04X %04X %04X %04X %04X %04X %04X %04X | "
         "V:%.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f\r\n",
         (unsigned)err,
         (unsigned)g_result.wrcfga_rdcfga_ok,
         (unsigned)g_result.pec_ok,
         (unsigned)g_result.cmd_counter,

         g_result.cell_raw[0], g_result.cell_raw[1],
         g_result.cell_raw[2], g_result.cell_raw[3],
         g_result.cell_raw[4], g_result.cell_raw[5],
         g_result.cell_raw[6], g_result.cell_raw[7],
         g_result.cell_raw[8], g_result.cell_raw[9],
         g_result.cell_raw[10], g_result.cell_raw[11],
         g_result.cell_raw[12], g_result.cell_raw[13],
         g_result.cell_raw[14], g_result.cell_raw[15],

         g_result.cell_voltage[0], g_result.cell_voltage[1],
         g_result.cell_voltage[2], g_result.cell_voltage[3],
         g_result.cell_voltage[4], g_result.cell_voltage[5],
         g_result.cell_voltage[6], g_result.cell_voltage[7],
         g_result.cell_voltage[8], g_result.cell_voltage[9],
         g_result.cell_voltage[10], g_result.cell_voltage[11],
         g_result.cell_voltage[12], g_result.cell_voltage[13],
         g_result.cell_voltage[14], g_result.cell_voltage[15]);

        UART_Print(buffer);

        if (err == BMS_ERR_NONE)
        {
            ERR_Led_1_Toggle();
        }
        else
        {
            ERR_Led_2_Toggle();
            ERR_Led_3_Toggle();
            ERR_Led_4_Toggle();
        }

        vTaskDelay(pdMS_TO_TICKS(500u));
    }
}

/* ============================================================================
 * ACCESO AL RESULTADO
 * ============================================================================ */

BMS_TestResult_t *BMS_GetTestResult(void)
{
    return &g_result;
}
