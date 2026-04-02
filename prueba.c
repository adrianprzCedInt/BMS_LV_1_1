/*******************************************************************************
 * @file    adbms6830_spi_test.c
 * @brief   Test minimo de comunicacion SPI con ADBMS6830
 *          Plataforma: PIC32MX795F512L + MPLAB Harmony + FreeRTOS
 *          Driver SPI: plib_spi2_master (interrupt-driven, generado por Harmony)
 *
 * DESCRIPCION:
 *   Verifica que el enlace SPI entre el PIC32MX795F512L y el ADBMS6830
 *   funciona correctamente mediante el ciclo:
 *     1. Wakeup del IC (pulso en CS)
 *     2. WRCFGA  -> escribe 6 bytes en el registro de configuracion A
 *     3. RDCFGA  -> lee de vuelta esos 6 bytes
 *     4. Verifica PEC10 de la respuesta y compara datos escritos vs leidos
 *
 * PROTOCOLO SPI del ADBMS6830:
 *   - Modo: CPOL=1, CPHA=0  (CKP=1, CKE=0 en registros PIC32)
 *             -> SCLK idle HIGH, datos capturados en flanco de bajada
 *             -> Esto coincide con SPI2_CON_CKP=1 y SPI2_CON_CKE=0
 *                que ya tiene tu plib_spi2_master.c  <-- ya correcto
 *   - Frame:  8 bits  (MODE16=0, MODE32=0)           <-- ya correcto
 *   - SPI2BRG = 39  -> ~500 kHz con Fpb = 40 MHz     <-- ya correcto
 *   - Cada COMANDO = [CMD0][CMD1][PEC15_H][PEC15_L]          = 4 bytes TX
 *   - Cada RESPUESTA (1 IC) = [D0..D5][PEC10_H][PEC10_L]    = 8 bytes RX
 *
 * SOBRE EL DRIVER SPI2 (interrupt-driven):
 *   SPI2_WriteRead() es NO bloqueante: lanza la transferencia y retorna
 *   de inmediato. La ISR (SPI2_RX_InterruptHandler / SPI2_TX_InterruptHandler)
 *   completa la transferencia y pone spi2Obj.transferIsBusy = false.
 *   Por eso BMS_SPI_Transfer() espera con timeout usando SPI2_IsBusy().
 *
 * WIRING:
 *   PIC32 SDO2  -> ADBMS6830 SDI
 *   PIC32 SDI2  -> ADBMS6830 SDO
 *   PIC32 SCK2  -> ADBMS6830 SCLK
 *   GPIO output -> ADBMS6830 CSB   (nombre "BMS_CS" en el Pin Manager)
 *   GND         -> GND
 *
 * USO EN app.c:
 *   #include "adbms6830_spi_test.h"
 *   xTaskCreate(BMS_SpiTestTask, "BMS_Test", 512, NULL, 2, NULL);
 *
 *******************************************************************************/

#include <stdbool.h>
#include <stdint.h>
#include <string.h>

#include "../prueba.h"
#include "definitions.h"          /* Macros GPIO BMS_CS_Set/Clear y SPI2_xxx */
#include "FreeRTOS.h"
#include "task.h"
//#include "../src/config/default/peripheral/spi/spi_master/plib_spi2_master.h" /* SPI2_WriteRead, SPI2_Write, SPI2_IsBusy */

/* ============================================================================
 * PINES CS
 * Ajusta el nombre segun lo que hayas puesto en el Pin Manager de Harmony.
 * Harmony genera BMS_CS_Set() y BMS_CS_Clear() a partir del nombre "BMS_CS".
 * ============================================================================ */
#define BMS_CS_DESELECT()   BMS_CS_Set()      /* CS = HIGH (inactivo) */
#define BMS_CS_SELECT()     BMS_CS_Clear()    /* CS = LOW  (activo)   */

/* ============================================================================
 * TIMEOUT SPI
 * A ~500 kHz transferir 12 bytes tarda ~192 us.
 * 5 ms de timeout da margen mas que suficiente.
 * ============================================================================ */
#define SPI_TIMEOUT_MS   5u

/* ============================================================================
 * COMANDOS ADBMS6830
 * ============================================================================ */
static const uint8_t CMD_WRCFGA[2] = { 0x00u, 0x01u };  /* Write Config A   */
static const uint8_t CMD_RDCFGA[2] = { 0x00u, 0x02u };  /* Read  Config A   */
static const uint8_t CMD_ADCV[2]   = { 0x02u, 0x60u };  /* Start ADC conv   */

static const uint8_t CMD_RDCVA[2] = { 0x00u, 0x04u };
static const uint8_t CMD_RDCVB[2] = { 0x00u, 0x06u }; /* Read Cell Volt B */
static const uint8_t CMD_RDCVC[2] = { 0x00u, 0x08u };
static const uint8_t CMD_RDCVD[2] = { 0x00u, 0x0Au };

typedef enum
{
    BMS_ERR_NONE = 0,
    BMS_ERR_SPI_TIMEOUT,
    BMS_ERR_CFG_WRITE,
    BMS_ERR_CFG_READ,
    BMS_ERR_CFG_PEC,
    BMS_ERR_CFG_REFON,
    BMS_ERR_ADCV_CMD,
    BMS_ERR_RDCVA_PEC,
    BMS_ERR_RDCVB_PEC,
    BMS_ERR_RDCVC_PEC,
    BMS_ERR_RDCVD_PEC
} BMS_Error_t;

/* ============================================================================
 * TABLAS CRC PRECALCULADAS
 * ============================================================================ */
static const uint16_t CRC15_TABLE[256] =
{
    0x0000u,0xc599u,0xceabu,0x0b32u,0xd8cfu,0x1d56u,0x1664u,0xd3fdu,
    0xf407u,0x319eu,0x3aacu,0xff35u,0x2cc8u,0xe951u,0xe263u,0x27fau,
    0xad97u,0x680eu,0x633cu,0xa6a5u,0x7558u,0xb0c1u,0xbbf3u,0x7e6au,
    0x5990u,0x9c09u,0x973bu,0x52a2u,0x815fu,0x44c6u,0x4ff4u,0x8a6du,
    0x5b2eu,0x9eb7u,0x9585u,0x501cu,0x83e1u,0x4678u,0x4d4au,0x88d3u,
    0xaf29u,0x6ab0u,0x6182u,0xa41bu,0x77e6u,0xb27fu,0xb94du,0x7cd4u,
    0xf6b9u,0x3320u,0x3812u,0xfd8bu,0x2e76u,0xebefu,0xe0ddu,0x2544u,
    0x02beu,0xc727u,0xcc15u,0x098cu,0xda71u,0x1fe8u,0x14dau,0xd143u,
    0xf3c5u,0x365cu,0x3d6eu,0xf8f7u,0x2b0au,0xee93u,0xe5a1u,0x2038u,
    0x07c2u,0xc25bu,0xc969u,0x0cf0u,0xdf0du,0x1a94u,0x11a6u,0xd43fu,
    0x5e52u,0x9bcbu,0x90f9u,0x5560u,0x869du,0x4304u,0x4836u,0x8dafu,
    0xaa55u,0x6fccu,0x64feu,0xa167u,0x729au,0xb703u,0xbc31u,0x79a8u,
    0xa8ebu,0x6d72u,0x6640u,0xa3d9u,0x7024u,0xb5bdu,0xbe8fu,0x7b16u,
    0x5cecu,0x9975u,0x9247u,0x57deu,0x8423u,0x41bau,0x4a88u,0x8f11u,
    0x057cu,0xc0e5u,0xcbd7u,0x0e4eu,0xddb3u,0x182au,0x1318u,0xd681u,
    0xf17bu,0x34e2u,0x3fd0u,0xfa49u,0x29b4u,0xec2du,0xe71fu,0x2286u,
    0xa213u,0x678au,0x6cb8u,0xa921u,0x7adcu,0xbf45u,0xb477u,0x71eeu,
    0x5614u,0x938du,0x98bfu,0x5d26u,0x8edbu,0x4b42u,0x4070u,0x85e9u,
    0x0f84u,0xca1du,0xc12fu,0x04b6u,0xd74bu,0x12d2u,0x19e0u,0xdc79u,
    0xfb83u,0x3e1au,0x3528u,0xf0b1u,0x234cu,0xe6d5u,0xede7u,0x287eu,
    0xf93du,0x3ca4u,0x3796u,0xf20fu,0x21f2u,0xe46bu,0xef59u,0x2ac0u,
    0x0d3au,0xc8a3u,0xc391u,0x0608u,0xd5f5u,0x106cu,0x1b5eu,0xdec7u,
    0x54aau,0x9133u,0x9a01u,0x5f98u,0x8c65u,0x49fcu,0x42ceu,0x8757u,
    0xa0adu,0x6534u,0x6e06u,0xab9fu,0x7862u,0xbdfbu,0xb6c9u,0x7350u,
    0x51d6u,0x944fu,0x9f7du,0x5ae4u,0x8919u,0x4c80u,0x47b2u,0x822bu,
    0xa5d1u,0x6048u,0x6b7au,0xaee3u,0x7d1eu,0xb887u,0xb3b5u,0x762cu,
    0xfc41u,0x39d8u,0x32eau,0xf773u,0x248eu,0xe117u,0xea25u,0x2fbcu,
    0x0846u,0xcddfu,0xc6edu,0x0374u,0xd089u,0x1510u,0x1e22u,0xdbbbu,
    0x0af8u,0xcf61u,0xc453u,0x01cau,0xd237u,0x17aeu,0x1c9cu,0xd905u,
    0xfeffu,0x3b66u,0x3054u,0xf5cdu,0x2630u,0xe3a9u,0xe89bu,0x2d02u,
    0xa76fu,0x62f6u,0x69c4u,0xac5du,0x7fa0u,0xba39u,0xb10bu,0x7492u,
    0x5368u,0x96f1u,0x9dc3u,0x585au,0x8ba7u,0x4e3eu,0x450cu,0x8095u
};

static const uint16_t CRC10_TABLE[256] =
{
    0x000u,0x08fu,0x11eu,0x191u,0x23cu,0x2b3u,0x322u,0x3adu,
    0x0f7u,0x078u,0x1e9u,0x166u,0x2cbu,0x244u,0x3d5u,0x35au,
    0x1eeu,0x161u,0x0f0u,0x07fu,0x3d2u,0x35du,0x2ccu,0x243u,
    0x119u,0x196u,0x007u,0x088u,0x325u,0x3aau,0x23bu,0x2b4u,
    0x3dcu,0x353u,0x2c2u,0x24du,0x1e0u,0x16fu,0x0feu,0x071u,
    0x32bu,0x3a4u,0x235u,0x2bau,0x117u,0x198u,0x009u,0x086u,
    0x232u,0x2bdu,0x32cu,0x3a3u,0x00eu,0x081u,0x110u,0x19fu,
    0x2c5u,0x24au,0x3dbu,0x354u,0x0f9u,0x076u,0x1e7u,0x168u,
    0x337u,0x3b8u,0x229u,0x2a6u,0x10bu,0x184u,0x015u,0x09au,
    0x3c0u,0x34fu,0x2deu,0x251u,0x1fcu,0x173u,0x0e2u,0x06du,
    0x2d9u,0x256u,0x3c7u,0x348u,0x0e5u,0x06au,0x1fbu,0x174u,
    0x22eu,0x2a1u,0x330u,0x3bfu,0x012u,0x09du,0x10cu,0x183u,
    0x0ebu,0x064u,0x1f5u,0x17au,0x2d7u,0x258u,0x3c9u,0x346u,
    0x01cu,0x093u,0x102u,0x18du,0x220u,0x2afu,0x33eu,0x3b1u,
    0x105u,0x18au,0x01bu,0x094u,0x339u,0x3b6u,0x227u,0x2a8u,
    0x1f2u,0x17du,0x0ecu,0x063u,0x3ceu,0x341u,0x2d0u,0x25fu,
    0x2e1u,0x26eu,0x3ffu,0x370u,0x0ddu,0x052u,0x1c3u,0x14cu,
    0x216u,0x299u,0x308u,0x387u,0x02au,0x0a5u,0x134u,0x1bbu,
    0x30fu,0x380u,0x211u,0x29eu,0x133u,0x1bcu,0x02du,0x0a2u,
    0x3f8u,0x377u,0x2e6u,0x269u,0x1c4u,0x14bu,0x0dau,0x055u,
    0x13du,0x1b2u,0x023u,0x0acu,0x301u,0x38eu,0x21fu,0x290u,
    0x1cau,0x145u,0x0d4u,0x05bu,0x3f6u,0x379u,0x2e8u,0x267u,
    0x0d3u,0x05cu,0x1cdu,0x142u,0x2efu,0x260u,0x3f1u,0x37eu,
    0x024u,0x0abu,0x13au,0x1b5u,0x218u,0x297u,0x306u,0x389u,
    0x1d6u,0x159u,0x0c8u,0x047u,0x3eau,0x365u,0x2f4u,0x27bu,
    0x121u,0x1aeu,0x03fu,0x0b0u,0x31du,0x392u,0x203u,0x28cu,
    0x038u,0x0b7u,0x126u,0x1a9u,0x204u,0x28bu,0x31au,0x395u,
    0x0cfu,0x040u,0x1d1u,0x15eu,0x2f3u,0x27cu,0x3edu,0x362u,
    0x20au,0x285u,0x314u,0x39bu,0x036u,0x0b9u,0x128u,0x1a7u,
    0x2fdu,0x272u,0x3e3u,0x36cu,0x0c1u,0x04eu,0x1dfu,0x150u,
    0x3e4u,0x36bu,0x2fau,0x275u,0x1d8u,0x157u,0x0c6u,0x049u,
    0x313u,0x39cu,0x20du,0x282u,0x12fu,0x1a0u,0x031u,0x0beu
};


static BMS_TestResult_t g_result;  /* Variable global, visible en Watch Window */

/* ============================================================================
 * CRC
 * ============================================================================ */

/* PEC15: CRC de los bytes de COMANDO enviados al IC */
static uint16_t PEC15_calc(uint8_t len, const uint8_t *data)
{
    uint16_t rem = 16u;
    for (uint8_t i = 0u; i < len; i++)
    {
        uint16_t addr = (uint16_t)(((rem >> 7u) ^ data[i]) & 0xFFu);
        rem = (uint16_t)((rem << 8u) ^ CRC15_TABLE[addr]);
    }
    return (uint16_t)(rem * 2u);
}

/*
 * PEC10: CRC de la RESPUESTA del IC
 *
 * El IC responde con 8 bytes por registro leido:
 *   resp[0..5] = datos utiles (D0..D5)
 *   resp[6]    = PEC_H: bits[9:2] del PEC10  (bits[1:0] = parte del cmd_cnt)
 *   resp[7]    = PEC_L: bits[7:6] = bits[1:0] del PEC10
 *                        bits[5:0] = command_counter (incrementa cada CMD)
 *
 * PEC10 recibido = ((resp[6] & 0x03) << 8) | resp[7]
 * El calculo del PEC10 incluye el command_counter igual que lo hace el IC.
 *
 * @param resp  Puntero a los 8 bytes de respuesta completos (resp[0..7])
 */
static uint16_t PEC10_calc(const uint8_t *resp)
{
    uint16_t rem = 16u;

    /* Procesa los 6 bytes de datos */
    for (uint8_t i = 0u; i < 6u; i++)
    {
        uint16_t addr = (uint16_t)(((rem >> 2u) ^ resp[i]) & 0xFFu);
        rem = (uint16_t)((rem << 8u) ^ CRC10_TABLE[addr]);
    }

    /* Incluye el command counter (bits[7:2] de resp[6] son bits[5:0] del counter) */
    rem ^= (uint16_t)(((uint16_t)(resp[6u] & 0xFCu)) << 2u);

    /* 6 rondas finales de division modulo-2 */
    for (uint8_t bit = 6u; bit > 0u; bit--)
    {
        if ((rem & 0x200u) != 0u)
            rem = (uint16_t)((rem << 1u) ^ 0x8Fu);
        else
            rem = (uint16_t)(rem << 1u);
    }

    return (uint16_t)(rem & 0x3FFu);
}

/* ============================================================================
 * CAPA SPI CON TIMEOUT PARA DRIVER INTERRUPT-DRIVEN
 *
 * SPI2_WriteRead() de tu PLIB es NO bloqueante:
 *   - Llena el primer byte en SPI2BUF y habilita las interrupciones TX/RX
 *   - Retorna true/false al instante
 *   - La ISR transfiere el resto y al terminar pone transferIsBusy = false
 *
 * BMS_SPI_Transfer() espera el fin con un bucle de timeout que cede el CPU
 * a FreeRTOS (taskYIELD + vTaskDelay) para no bloquear otras tareas.
 * ============================================================================ */
static bool BMS_SPI_Transfer(uint8_t *tx_buf, size_t tx_size,
                              uint8_t *rx_buf, size_t rx_size)
{
    uint32_t ms = 0u;

    /* Espera si hay transferencia previa pendiente */
    while (SPI2_IsBusy() && (ms < SPI_TIMEOUT_MS))
    {
        taskYIELD();
        vTaskDelay(pdMS_TO_TICKS(1u));
        ms++;
    }
    if (ms >= SPI_TIMEOUT_MS) { g_result.spi_timeout = true; return false; }

    /* Lanza la transferencia (retorna inmediatamente) */
    if (!SPI2_WriteRead(tx_buf, tx_size, rx_buf, rx_size))
    {
        /*
         * SPI2_WriteRead retorna false si transferIsBusy == true.
         * No deberia llegar aqui porque ya esperamos arriba, pero
         * lo tratamos como error por si acaso.
         */
        g_result.spi_timeout = true;
        return false;
    }

    /* Espera fin de transferencia (ISR baja el flag) */
    ms = 0u;
    while (SPI2_IsBusy() && (ms < SPI_TIMEOUT_MS))
    {
        taskYIELD();
        vTaskDelay(pdMS_TO_TICKS(1u));
        ms++;
    }
    if (ms >= SPI_TIMEOUT_MS) { g_result.spi_timeout = true; return false; }

    return true;
}

/* ============================================================================
 * WAKEUP DEL IC
 *
 * El ADBMS6830 entra en SLEEP si no recibe actividad SPI.
 * Para despertarlo: pulso LOW en CS >= t_wake (400 us maximo segun datasheet).
 * Usamos 1 ms para asegurar margen con vTaskDelay.
 * ============================================================================ */

//static void BMS_WakeupIC(void)
//{
 //   BMS_CS_SELECT();
   // vTaskDelay(pdMS_TO_TICKS(1u));   /* 1 ms > t_wake_max (400 us) */
   // BMS_CS_DESELECT();
   // vTaskDelay(pdMS_TO_TICKS(1u));   /* Pausa antes del primer CMD  */
//}
void BMS_WakeupIC(void)
{
    uint8_t dummy = 0xFF;

    BMS_CS_SELECT();
    vTaskDelay(pdMS_TO_TICKS(1));

    /* generar clocks */
    for (int i = 0; i < 2; i++)
    {
        BMS_SPI_Transfer(&dummy, 1, NULL, 0);
    }

    BMS_CS_DESELECT();

    vTaskDelay(pdMS_TO_TICKS(1));
}

/* ============================================================================
 * PRIMITIVAS BMS
 * ============================================================================ */

/*
 * BMS_SendCmd: envia solo un comando de 4 bytes (sin payload de datos).
 * Usado para: ADCV, ADSV, ADAX, CLRCELL, PLADC, DIAGN, etc.
 *
 * Frame TX (4 bytes):
 *   [CMD0][CMD1][PEC15_H][PEC15_L]
 */
static bool BMS_SendCmd(const uint8_t cmd[2])
{
    uint8_t tx[4];
    uint16_t pec = PEC15_calc(2u, cmd);
    tx[0] = cmd[0];
    tx[1] = cmd[1];
    tx[2] = (uint8_t)(pec >> 8u);
    tx[3] = (uint8_t)(pec & 0xFFu);

    BMS_CS_SELECT();
    bool ok = BMS_SPI_Transfer(tx, 4u, NULL, 0u);
    BMS_CS_DESELECT();
    return ok;
}

/*
 * BMS_WriteRegister: envia comando + 6 bytes de datos (escritura de registro).
 * Usado para: WRCFGA, WRCFGB, WRPWM1, WRPWM2, WRCOMM, etc.
 *
 * Frame TX (10 bytes para 1 IC):
 *   [CMD0][CMD1][PEC15_H][PEC15_L][D0][D1][D2][D3][D4][D5]
 *
 * En escritura el IC NO requiere PEC de los datos (a diferencia de la lectura).
 */
static bool BMS_WriteRegister(const uint8_t cmd[2], const uint8_t data[6])
{
    uint8_t tx[10];
    uint16_t pec = PEC15_calc(2u, cmd);
    tx[0] = cmd[0];
    tx[1] = cmd[1];
    tx[2] = (uint8_t)(pec >> 8u);
    tx[3] = (uint8_t)(pec & 0xFFu);
    tx[4] = data[0];
    tx[5] = data[1];
    tx[6] = data[2];
    tx[7] = data[3];
    tx[8] = data[4];
    tx[9] = data[5];

    BMS_CS_SELECT();
    bool ok = BMS_SPI_Transfer(tx, 10u, NULL, 0u);
    BMS_CS_DESELECT();
    return ok;
}

/*
 * BMS_ReadRegister: envia comando de lectura y recibe la respuesta del IC.
 *
 * El PIC32 en SPI full-duplex siempre envia y recibe simultaneamente.
 * Mandamos 12 bytes en total: 4 de comando + 8 de dummy (0x00).
 * El IC devuelve tambien 12 bytes: 4 de eco del CMD + 8 de datos reales.
 *
 * Layout del buffer RX de 12 bytes:
 *   rx_buf[0..3]  = eco del comando enviado  (se ignoran)
 *   rx_buf[4..9]  = D0..D5 (datos del registro)
 *   rx_buf[10]    = PEC_H  (bits[9:2] del PEC10; bits[1:0] son del cmd_cnt)
 *   rx_buf[11]    = PEC_L  (bits[7:6] = bits[1:0] del PEC10;
 *                            bits[5:0] = command_counter)
 *
 * PEC10 recibido = ((rx_buf[10] & 0x03) << 8) | rx_buf[11]
 */
static bool BMS_ReadRegister(const uint8_t cmd[2],
                              uint8_t data_out[6],
                              bool *pec_ok,
                              uint8_t *cmd_cnt)
{
    uint8_t tx_buf[12u];
    uint8_t rx_buf[12u];
    memset(tx_buf, 0x00u, sizeof(tx_buf));
    memset(rx_buf, 0x00u, sizeof(rx_buf));

    /* Llena el comando en los primeros 4 bytes de TX */
    uint16_t pec = PEC15_calc(2u, cmd);
    tx_buf[0] = cmd[0];
    tx_buf[1] = cmd[1];
    tx_buf[2] = (uint8_t)(pec >> 8u);
    tx_buf[3] = (uint8_t)(pec & 0xFFu);
    /* tx_buf[4..11] = 0x00  (dummy bytes para generar el clock durante RX) */

    BMS_CS_SELECT();
    bool ok = BMS_SPI_Transfer(tx_buf, 12u, rx_buf, 12u);
    BMS_CS_DESELECT();

    if (!ok)
    {
        if (pec_ok  != NULL) { *pec_ok  = false; }
        if (cmd_cnt != NULL) { *cmd_cnt = 0u; }
        return false;
    }

    /* Puntero a la respuesta util (a partir del byte 4 del RX) */
    uint8_t *resp = &rx_buf[4u];

    /* Extrae los 6 bytes de datos del registro */
    memcpy(data_out, resp, 6u);

    /* Extrae el command counter */
    if (cmd_cnt != NULL)
    {
        *cmd_cnt = (resp[7u] >> 2u);
    }

    /* PEC10 recibido desde el IC */
    uint16_t rx_pec   = (uint16_t)(((uint16_t)(resp[6u] & 0x03u) << 8u) | resp[7u]);

    /* PEC10 calculado localmente */
    uint16_t calc_pec = PEC10_calc(resp);

    if (pec_ok != NULL)
    {
        *pec_ok = (rx_pec == calc_pec);
    }

    return true;
}

/* ============================================================================
 * TAREA FREERTOS
 * ============================================================================ */

/**
 * @brief Tarea FreeRTOS de prueba de comunicacion SPI con ADBMS6830
 *
 * Registra en app.c (o donde crees tus tareas FreeRTOS):
 *   xTaskCreate(BMS_SpiTestTask, "BMS_Test", 512, NULL, 2, NULL);
 *
 * Para inspeccionar resultados sin UART:
 *   MPLAB X -> Window -> Debugging -> Watches -> añade: g_result
 */
#if 0
void BMS_SpiTestTask(void *pvParameters)
{
    memset(&g_result, 0, sizeof(g_result));

    uint8_t dummy[8] = {0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF};

    BMS_CS_DESELECT();

    /* Esperar power-up */
    vTaskDelay(pdMS_TO_TICKS(10+00));

    /* Limpiar bus */
    BMS_SPI_Transfer(dummy, 8, NULL, 0);

    /* ? SECUENCIA CRÍTICA */
    for (int i = 0; i < 5; i++)
    {
        BMS_WakeupIC();
        vTaskDelay(pdMS_TO_TICKS(2));
    }

    /* ------------------------------------------------------------------
     * PASO 2: Escribir CFGRA
     *
     * Byte 0: bit0 = REFON=1 (mantiene la referencia encendida)
     * Bytes 1-5: 0x00 (configuracion por defecto)
     * ------------------------------------------------------------------ */
    uint8_t cfga_write[6u];
    memset(cfga_write, 0x00u, sizeof(cfga_write));
    cfga_write[0] = 0x01u;   /* REFON = 1 */

    BMS_WakeupIC();
    bool write_ok = BMS_WriteRegister(CMD_WRCFGA, cfga_write);

    vTaskDelay(pdMS_TO_TICKS(2u));   /* Pausa para que el IC procese */

    /* ------------------------------------------------------------------
     * PASO 3: Leer CFGRA y verificar
     * ------------------------------------------------------------------ */
    uint8_t cfga_read[6u];
    bool    pec_ok  = false;
    uint8_t cmd_cnt = 0u;

    BMS_WakeupIC();
    bool read_ok = BMS_ReadRegister(CMD_RDCFGA, cfga_read, &pec_ok, &cmd_cnt);

    /* Guarda resultados en la estructura global */
    memcpy(g_result.rx_cfga, cfga_read, 6u);
    g_result.pec_ok           = pec_ok;
    g_result.cmd_counter      = cmd_cnt;
    g_result.wrcfga_rdcfga_ok = write_ok && read_ok && pec_ok &&
                            ((cfga_read[0] & 0x01u) == 0x01u);

    /* ------------------------------------------------------------------
     * PASO 4 (opcional): ADCV + RDCVB
     * Descomenta cuando el Paso 3 sea exitoso (wrcfga_rdcfga_ok == true)
     * ------------------------------------------------------------------ */
#if 1
    float cell_voltage[10] = {0};

    BMS_WakeupIC();
    BMS_SendCmd(CMD_ADCV);
    vTaskDelay(pdMS_TO_TICKS(5));   /* margen extra */

    uint8_t data[6];
    bool pec;

    /* --------- CELDAS 1?3 --------- */
    BMS_WakeupIC();
    BMS_ReadRegister(CMD_RDCVA, data, &pec, NULL);
    if (pec)
    {
        for (int i = 0; i < 3; i++)
        {
            int16_t raw = (int16_t)((uint16_t)data[2*i] | ((uint16_t)data[2*i+1] << 8));
            cell_voltage[i] = raw * 100e-6f;
        }
    }

    /* --------- CELDAS 4?6 --------- */
    BMS_WakeupIC();
    BMS_ReadRegister(CMD_RDCVB, data, &pec, NULL);
    if (pec)
    {
        for (int i = 0; i < 3; i++)
        {
            int16_t raw = (int16_t)((uint16_t)data[2*i] | ((uint16_t)data[2*i+1] << 8));
            cell_voltage[i+3] = raw * 100e-6f;
        }
    }

    /* --------- CELDAS 7?9 --------- */
    BMS_WakeupIC();
    BMS_ReadRegister(CMD_RDCVC, data, &pec, NULL);
    if (pec)
    {
        for (int i = 0; i < 3; i++)
        {
            int16_t raw = (int16_t)((uint16_t)data[2*i] | ((uint16_t)data[2*i+1] << 8));
            cell_voltage[i+6] = raw * 100e-6f;
        }
    }

    /* --------- CELDA 10 --------- */
    BMS_WakeupIC();
    BMS_ReadRegister(CMD_RDCVD, data, &pec, NULL);
    if (pec)
    {
        int16_t raw = (int16_t)((uint16_t)data[0] | ((uint16_t)data[1] << 8));
        cell_voltage[9] = raw * 100e-6f;
    }
#endif

    /* ------------------------------------------------------------------
     * PASO 5: Loop de estado
     * Inspecciona g_result en el Watch Window para diagnostico detallado.
     * ------------------------------------------------------------------ */
    for (;;)
    {
        char buffer[100];

sprintf(buffer,
        "ok:%d pec:%d | C1:%.3f C2:%.3f C3:%.3f C4:%.3f C5:%.3f C6:%.3f C7:%.3f C8:%.3f C9:%.3f C10:%.3f\r\n",
        g_result.wrcfga_rdcfga_ok,
        g_result.pec_ok,
        cell_voltage[0], cell_voltage[1], cell_voltage[2],
        cell_voltage[3], cell_voltage[4], cell_voltage[5],
        cell_voltage[6], cell_voltage[7], cell_voltage[8],
        cell_voltage[9]);

        while(UART1_WriteIsBusy());
        UART1_Write((void*)buffer, strlen(buffer));
        while(!UART1_TransmitComplete());
        
       
        if (g_result.wrcfga_rdcfga_ok)
        {
            /* EXITO: SPI funciona, PEC correcto, datos coherentes */
            /* USER_LED_Toggle(); */
            ERR_Led_1_Toggle();
        }
        else
        {
            ERR_Led_2_Toggle();
            ERR_Led_3_Toggle();
            ERR_Led_4_Toggle();
            /* FALLO - diagnostico segun los campos de g_result:
             *
             * spi_timeout = true
             *   La ISR de SPI2 no esta disparando. Verifica:
             *   - Que SPI_2_InterruptHandler este registrado en el vector
             *     de interrupciones (interrupts.c generado por Harmony).
             *   - Que la prioridad de la ISR sea > configMAX_SYSCALL_INTERRUPT_PRIORITY
             *     de FreeRTOS (tipicamente prioridad 1 en PIC32).
             *   - Que IEC1 tenga los bits SPI2RXIE y SPI2TXIE habilitados.
             *
             * spi_timeout = false, pec_ok = false, rx_cfga = {0,0,0,0,0,0}
             *   El IC no responde. Verifica cableado:
             *   SDO2->SDI, SDI2->SDO, SCK2->SCLK, GPIO->CSB.
             *   Revisa que el IC este alimentado (VDD, VREG).
             *
             * spi_timeout = false, pec_ok = false, rx_cfga != {0,...}
             *   Hay datos pero el PEC falla. Verifica:
             *   - Modo SPI: CKP=1, CKE=0 (ya correcto en tu PLIB).
             *   - Baja la frecuencia: cambia SPI2BRG a 99 (~200 kHz).
             *   - Revisa si hay ruido en las lineas SPI con osciloscopio.
             *
             * spi_timeout = false, pec_ok = true, rx_cfga != cfga_write
             *   El IC responde bien pero con datos distintos.
             *   El IC entro en sleep entre WRCFGA y RDCFGA.
             *   Asegurate de llamar BMS_WakeupIC() antes de cada transaccion.
             *
             * cmd_counter = 0 siempre
             *   El IC no ejecuta los comandos. Verifica VREF y alimentacion.
             */
        }

        vTaskDelay(pdMS_TO_TICKS(500u));
    }
}
#endif












static void UART_DebugPrint(const char *msg)
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

static bool BMS_ReadCellGroup(const uint8_t cmd[2], float *dest3, bool *pec_ok_out)
{
    uint8_t data[6];
    bool pec_ok = false;

    BMS_WakeupIC();

    if (!BMS_ReadRegister(cmd, data, &pec_ok, NULL))
    {
        if (pec_ok_out != NULL)
        {
            *pec_ok_out = false;
        }
        return false;
    }

    if (!pec_ok)
    {
        if (pec_ok_out != NULL)
        {
            *pec_ok_out = false;
        }
        return false;
    }

    for (uint8_t i = 0u; i < 3u; i++)
    {
        uint16_t raw = (uint16_t)data[2u * i] |
                       ((uint16_t)data[(2u * i) + 1u] << 8u);

        /* 100 uV por LSB */
        dest3[i] = (float)raw * 100e-6f;
    }

    if (pec_ok_out != NULL)
    {
        *pec_ok_out = true;
    }

    return true;
}

#if 0
void BMS_SpiTestTask(void *pvParameters)
{
    (void)pvParameters;

    char buffer[256];
    uint8_t dummy[8] = {0xFFu, 0xFFu, 0xFFu, 0xFFu, 0xFFu, 0xFFu, 0xFFu, 0xFFu};

    float cell_voltage[10] = {0.0f};
    BMS_Error_t err = BMS_ERR_NONE;

    bool write_ok = false;
    bool read_ok = false;
    bool pec_ok = false;
    uint8_t cmd_cnt = 0u;
    uint8_t cfga_read[6] = {0};
    uint8_t cfga_write[6] = {0};

    memset(&g_result, 0, sizeof(g_result));

    /* -------------------- Power-up / wakeup -------------------- */
    BMS_CS_DESELECT();
    vTaskDelay(pdMS_TO_TICKS(100));

    BMS_SPI_Transfer(dummy, 8u, NULL, 0u);

    for (uint8_t i = 0u; i < 5u; i++)
    {
        BMS_WakeupIC();
        vTaskDelay(pdMS_TO_TICKS(2));
    }

    /* -------------------- CFGRA: REFON -------------------- */
    memset(cfga_write, 0x00u, sizeof(cfga_write));
    cfga_write[0] = 0x01u;   /* REFON = 1 */

    BMS_WakeupIC();
    write_ok = BMS_WriteRegister(CMD_WRCFGA, cfga_write);
    if (!write_ok)
    {
        err = g_result.spi_timeout ? BMS_ERR_SPI_TIMEOUT : BMS_ERR_CFG_WRITE;
        goto report_loop;
    }

    vTaskDelay(pdMS_TO_TICKS(2));

    BMS_WakeupIC();
    read_ok = BMS_ReadRegister(CMD_RDCFGA, cfga_read, &pec_ok, &cmd_cnt);
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

    if ((cfga_read[0] & 0x01u) == 0u)
    {
        err = BMS_ERR_CFG_REFON;
        goto report_loop;
    }

    memcpy(g_result.rx_cfga, cfga_read, 6u);
    g_result.pec_ok = pec_ok;
    g_result.cmd_counter = cmd_cnt;
    g_result.wrcfga_rdcfga_ok = true;

    /* -------------------- Conversión ADC -------------------- */
    BMS_WakeupIC();
    if (!BMS_SendCmd(CMD_ADCV))
    {
        err = g_result.spi_timeout ? BMS_ERR_SPI_TIMEOUT : BMS_ERR_ADCV_CMD;
        goto report_loop;
    }

    vTaskDelay(pdMS_TO_TICKS(5));

    /* -------------------- Lectura de celdas -------------------- */
    {
        bool group_ok = false;

        if (!BMS_ReadCellGroup(CMD_RDCVA, &cell_voltage[0], &group_ok) || !group_ok)
        {
            err = BMS_ERR_RDCVA_PEC;
            goto report_loop;
        }

        if (!BMS_ReadCellGroup(CMD_RDCVB, &cell_voltage[3], &group_ok) || !group_ok)
        {
            err = BMS_ERR_RDCVB_PEC;
            goto report_loop;
        }

        if (!BMS_ReadCellGroup(CMD_RDCVC, &cell_voltage[6], &group_ok) || !group_ok)
        {
            err = BMS_ERR_RDCVC_PEC;
            goto report_loop;
        }

        /* Grupo D: solo usamos la celda 10 */
        {
            uint8_t data[6];
            bool pec_d = false;

            BMS_WakeupIC();
            if (!BMS_ReadRegister(CMD_RDCVD, data, &pec_d, NULL) || !pec_d)
            {
                err = BMS_ERR_RDCVD_PEC;
                goto report_loop;
            }

            {
                uint16_t raw = (uint16_t)data[0] | ((uint16_t)data[1] << 8u);
                cell_voltage[9] = (float)raw * 100e-6f;
            }
        }
    }

    err = BMS_ERR_NONE;

report_loop:
    for (;;)
    {
        snprintf(buffer, sizeof(buffer),
                 "err:%u ok:%u pec:%u cmd:%u | "
                 "C1:%.3f C2:%.3f C3:%.3f C4:%.3f C5:%.3f "
                 "C6:%.3f C7:%.3f C8:%.3f C9:%.3f C10:%.3f\r\n",
                 (unsigned)err,
                 (unsigned)g_result.wrcfga_rdcfga_ok,
                 (unsigned)g_result.pec_ok,
                 (unsigned)g_result.cmd_counter,
                 cell_voltage[0], cell_voltage[1], cell_voltage[2],
                 cell_voltage[3], cell_voltage[4], cell_voltage[5],
                 cell_voltage[6], cell_voltage[7], cell_voltage[8],
                 cell_voltage[9]);

        UART_DebugPrint(buffer);

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

        vTaskDelay(pdMS_TO_TICKS(500));
    }
}
#endif // 2 try este lee las dos primeras celdas a 5V, el resto a 0V




void BMS_SpiTestTask(void *pvParameters)
{
    (void)pvParameters;

    char buffer[256];
    uint8_t dummy[8] = {0xFFu,0xFFu,0xFFu,0xFFu,0xFFu,0xFFu,0xFFu,0xFFu};

    float cell_voltage[10] = {0.0f};
    uint16_t cell_raw[10]  = {0};

    BMS_Error_t err = BMS_ERR_NONE;

    bool write_ok = false;
    bool read_ok  = false;
    bool pec_ok   = false;
    uint8_t cmd_cnt = 0u;

    uint8_t cfga_read[6]  = {0};
    uint8_t cfga_write[6] = {0};

    memset(&g_result, 0, sizeof(g_result));

    /* -------------------- Power-up / wakeup -------------------- */
    BMS_CS_DESELECT();
    vTaskDelay(pdMS_TO_TICKS(100));

    BMS_SPI_Transfer(dummy, 8u, NULL, 0u);

    for (uint8_t i = 0; i < 5; i++)
    {
        BMS_WakeupIC();
        vTaskDelay(pdMS_TO_TICKS(2));
    }

    /* -------------------- CFGRA -------------------- */
    memset(cfga_write, 0x00u, sizeof(cfga_write));
    cfga_write[0] = 0x01u; /* REFON */

    BMS_WakeupIC();
    write_ok = BMS_WriteRegister(CMD_WRCFGA, cfga_write);
    if (!write_ok)
    {
        err = g_result.spi_timeout ? BMS_ERR_SPI_TIMEOUT : BMS_ERR_CFG_WRITE;
        goto report_loop;
    }

    vTaskDelay(pdMS_TO_TICKS(2));

    BMS_WakeupIC();
    read_ok = BMS_ReadRegister(CMD_RDCFGA, cfga_read, &pec_ok, &cmd_cnt);
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

    if ((cfga_read[0] & 0x01u) == 0u)
    {
        err = BMS_ERR_CFG_REFON;
        goto report_loop;
    }

    g_result.wrcfga_rdcfga_ok = true;
    g_result.pec_ok = pec_ok;
    g_result.cmd_counter = cmd_cnt;

    /* -------------------- ADC Conversion -------------------- */
    BMS_WakeupIC();
    if (!BMS_SendCmd(CMD_ADCV))
    {
        err = BMS_ERR_ADCV_CMD;
        goto report_loop;
    }

    vTaskDelay(pdMS_TO_TICKS(5));

    /* -------------------- Read Cells -------------------- */
    uint8_t data[6];
    bool pec;

    /* ---- Grupo A (C1-3) ---- */
    BMS_WakeupIC();
    if (!BMS_ReadRegister(CMD_RDCVA, data, &pec, NULL) || !pec)
    {
        err = BMS_ERR_RDCVA_PEC;
        goto report_loop;
    }

    for (int i = 0; i < 3; i++)
    {
        cell_raw[i] = (uint16_t)data[2*i] | ((uint16_t)data[2*i+1] << 8);
        cell_voltage[i] = (float)cell_raw[i] * 100e-6f;
    }

    /* ---- Grupo B (C4-6) ---- */
    BMS_WakeupIC();
    if (!BMS_ReadRegister(CMD_RDCVB, data, &pec, NULL) || !pec)
    {
        err = BMS_ERR_RDCVB_PEC;
        goto report_loop;
    }

    for (int i = 0; i < 3; i++)
    {
        cell_raw[i+3] = (uint16_t)data[2*i] | ((uint16_t)data[2*i+1] << 8);
        cell_voltage[i+3] = (float)cell_raw[i+3] * 100e-6f;
    }

    /* ---- Grupo C (C7-9) ---- */
    BMS_WakeupIC();
    if (!BMS_ReadRegister(CMD_RDCVC, data, &pec, NULL) || !pec)
    {
        err = BMS_ERR_RDCVC_PEC;
        goto report_loop;
    }

    for (int i = 0; i < 3; i++)
    {
        cell_raw[i+6] = (uint16_t)data[2*i] | ((uint16_t)data[2*i+1] << 8);
        cell_voltage[i+6] = (float)cell_raw[i+6] * 100e-6f;
    }

    /* ---- Grupo D (C10) ---- */
    BMS_WakeupIC();
    if (!BMS_ReadRegister(CMD_RDCVD, data, &pec, NULL) || !pec)
    {
        err = BMS_ERR_RDCVD_PEC;
        goto report_loop;
    }

    cell_raw[9] = (uint16_t)data[0] | ((uint16_t)data[1] << 8);
    cell_voltage[9] = (float)cell_raw[9] * 100e-6f;

    err = BMS_ERR_NONE;

report_loop:
    for (;;)
    {
        snprintf(buffer, sizeof(buffer),
                 "err:%u ok:%u pec:%u cmd:%u | "
                 "RAW: %u %u %u %u %u %u %u %u %u %u | "
                 "V: %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f\r\n",
                 (unsigned)err,
                 (unsigned)g_result.wrcfga_rdcfga_ok,
                 (unsigned)g_result.pec_ok,
                 (unsigned)g_result.cmd_counter,
                 cell_raw[0], cell_raw[1], cell_raw[2],
                 cell_raw[3], cell_raw[4], cell_raw[5],
                 cell_raw[6], cell_raw[7], cell_raw[8],
                 cell_raw[9],
                 cell_voltage[0], cell_voltage[1], cell_voltage[2],
                 cell_voltage[3], cell_voltage[4], cell_voltage[5],
                 cell_voltage[6], cell_voltage[7], cell_voltage[8],
                 cell_voltage[9]);

        UART_DebugPrint(buffer);

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

        vTaskDelay(pdMS_TO_TICKS(500));
    }
}




















/* Acceso al resultado desde otras tareas o modulos */
BMS_TestResult_t *BMS_GetTestResult(void)
{
    return &g_result;
}
