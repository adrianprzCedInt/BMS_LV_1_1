#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include "definitions.h"
#include "FreeRTOS.h"
#include "task.h"
#include "../prueba3.h"

/* ===================== HARDWARE ===================== */
#define BMS_CS_SELECT()     BMS_CS_Clear()
#define BMS_CS_DESELECT()   BMS_CS_Set()

#define SPI_TIMEOUT_MS      5u

/* ===================== COMANDOS ===================== */
static const uint8_t CMD_WRCFGA[2] = {0x00u, 0x01u};
static const uint8_t CMD_RDCFGA[2] = {0x00u, 0x02u};
// Registro Tensiones sin filtrar
static const uint8_t CMD_RDCVA[2]  = {0x00u, 0x04u};
static const uint8_t CMD_RDCVB[2]  = {0x00u, 0x06u};
static const uint8_t CMD_RDCVC[2]  = {0x00u, 0x08u};
static const uint8_t CMD_RDCVD[2]  = {0x00u, 0x0Au};

// Registro Tensiones Registros S
static const uint8_t CMD_RDSVA[2]  = {0x00u, 0x03u};
static const uint8_t CMD_RDSVB[2]  = {0x00u, 0x05u};
static const uint8_t CMD_RDSVC[2]  = {0x00u, 0x07u};
static const uint8_t CMD_RDSVD[2]  = {0x00u, 0x0Cu};

// Registro Tensiones filtradas
static const uint8_t CMD_RDFCA[2]  = {0x00u, 0x12u};
static const uint8_t CMD_RDFCB[2]  = {0x00u, 0x13u};
static const uint8_t CMD_RDFCC[2]  = {0x00u, 0x14u};
static const uint8_t CMD_RDFCD[2]  = {0x00u, 0x15u};


static const uint8_t CMD_ADCV[2]   = {0x03u, 0x60u};

/*
 16-bit ADC measurement value of V+ to V? = 25 × (VPV × 150 ?V + 1.5 V). Reset to 0x8000 after power-up,
sleep, or clear command (CLRAUX).
 */


/*
 * ===================== CONVERSION RAW -> VOLTIOS =====================
 *
 * Tu banco actual NO es una batería real, sino una fuente + divisor resistivo.
 * Con ese montaje, la conversión teórica del datasheet no te está cuadrando.
 *
 * Por eso dejo dos modos:
 *
 * 1) EMPIRICO: usa la recta ajustada a tus ensayos actuales
 * 2) TEORICO : para cuando pruebes con batería real / hardware final
 *
 * Cambia este define según lo que estés usando.
 */
#define BMS_USE_EMPIRICAL_CAL   1

/* Ajuste empírico a partir de tus medidas */
#define BMS_CAL_GAIN            0.0002338f
#define BMS_CAL_OFFSET         -11.786f

/* Conversión teórica alternativa */
#define BMS_THEO_GAIN           0.000100f

/* ===================== CRC TABLES ===================== */
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

/* ===================== CRC ===================== */
static uint16_t PEC15_calc(uint8_t len, const uint8_t *data)
{
    uint16_t rem = 16u;

    for (uint8_t i = 0u; i < len; i++)
    {
        uint16_t addr = (uint16_t)(((rem >> 7u) ^ data[i]) & 0xFFu);
        rem = (uint16_t)((rem << 8u) ^ CRC15_TABLE[addr]);
    }

    return (uint16_t)(rem << 1u);
}

static uint16_t PEC10_calc(const uint8_t *resp)
{
    uint16_t rem = 16u;

    for (uint8_t i = 0u; i < 6u; i++)
    {
        uint16_t addr = (uint16_t)(((rem >> 2u) ^ resp[i]) & 0xFFu);
        rem = (uint16_t)((rem << 8u) ^ CRC10_TABLE[addr]);
    }

    rem ^= (uint16_t)(((uint16_t)(resp[6u] & 0xFCu)) << 2u);

    for (uint8_t bit = 6u; bit > 0u; bit--)
    {
        if ((rem & 0x200u) != 0u)
        {
            rem = (uint16_t)((rem << 1u) ^ 0x8Fu);
        }
        else
        {
            rem = (uint16_t)(rem << 1u);
        }
    }

    return (uint16_t)(rem & 0x3FFu);
}

/* ===================== UART DEBUG ===================== */
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

/* ===================== SPI ===================== */
static bool BMS_SPI_Transfer(uint8_t *tx, size_t tx_size,
                             uint8_t *rx, size_t rx_size)
{
    uint32_t t = 0u;

    while (SPI2_IsBusy() && (t < SPI_TIMEOUT_MS))
    {
        vTaskDelay(pdMS_TO_TICKS(1u));
        t++;
    }

    if (t >= SPI_TIMEOUT_MS)
    {
        return false;
    }

    if (!SPI2_WriteRead(tx, tx_size, rx, rx_size))
    {
        return false;
    }

    t = 0u;
    while (SPI2_IsBusy() && (t < SPI_TIMEOUT_MS))
    {
        vTaskDelay(pdMS_TO_TICKS(1u));
        t++;
    }

    return (t < SPI_TIMEOUT_MS);
}

/* ===================== WAKEUP ===================== */
void BMS_WakeupIC(void)
{
    BMS_CS_SELECT();
    vTaskDelay(pdMS_TO_TICKS(1u));
    BMS_CS_DESELECT();
    vTaskDelay(pdMS_TO_TICKS(1u));
}

/* ===================== SEND CMD ===================== */
static bool BMS_SendCmd(const uint8_t cmd[2])
{
    uint8_t tx[4];
    uint16_t pec = PEC15_calc(2u, cmd);

    tx[0] = cmd[0];
    tx[1] = cmd[1];
    tx[2] = (uint8_t)(pec >> 8u);
    tx[3] = (uint8_t)(pec & 0xFFu);

    BMS_CS_SELECT();
    bool ok = BMS_SPI_Transfer(tx, sizeof(tx), NULL, 0u);
    BMS_CS_DESELECT();

    return ok;
}

/* ===================== WRITE CFG ===================== */
static bool BMS_WriteRegister(const uint8_t cmd[2], const uint8_t data[6])
{
    uint8_t tx[12];
    uint16_t pec_cmd  = PEC15_calc(2u, cmd);
    uint16_t pec_data = PEC15_calc(6u, data);

    tx[0]  = cmd[0];
    tx[1]  = cmd[1];
    tx[2]  = (uint8_t)(pec_cmd >> 8u);
    tx[3]  = (uint8_t)(pec_cmd & 0xFFu);
    tx[4]  = data[0];
    tx[5]  = data[1];
    tx[6]  = data[2];
    tx[7]  = data[3];
    tx[8]  = data[4];
    tx[9]  = data[5];
    tx[10] = (uint8_t)(pec_data >> 8u);
    tx[11] = (uint8_t)(pec_data & 0xFFu);

    BMS_CS_SELECT();
    bool ok = BMS_SPI_Transfer(tx, sizeof(tx), NULL, 0u);
    BMS_CS_DESELECT();

    return ok;
}

/* ===================== READ REGISTER ===================== */
static bool BMS_ReadRegister(const uint8_t cmd[2],
                             uint8_t data_out[6],
                             bool *pec_ok)
{
    uint8_t tx[12];
    uint8_t rx[12];
    uint16_t pec = PEC15_calc(2u, cmd);

    memset(tx, 0xFFu, sizeof(tx));
    memset(rx, 0x00u, sizeof(rx));

    tx[0] = cmd[0];
    tx[1] = cmd[1];
    tx[2] = (uint8_t)(pec >> 8u);
    tx[3] = (uint8_t)(pec & 0xFFu);

    BMS_WakeupIC();

    BMS_CS_SELECT();
    bool ok = BMS_SPI_Transfer(tx, sizeof(tx), rx, sizeof(rx));
    BMS_CS_DESELECT();

    if (!ok)
    {
        if (pec_ok != NULL)
        {
            *pec_ok = false;
        }
        return false;
    }

    uint8_t *resp = &rx[4];

    memcpy(data_out, resp, 6u);

    uint16_t rx_pec   = (uint16_t)(((uint16_t)(resp[6] & 0x03u) << 8u) | resp[7]);
    uint16_t calc_pec = PEC10_calc(resp);

    if (pec_ok != NULL)
    {
        *pec_ok = (rx_pec == calc_pec);
    }

    return true;
}

/* ===================== RAW -> VOLTS ===================== */
static float BMS_RawToVoltage(uint16_t raw)
{
#if BMS_USE_EMPIRICAL_CAL
    return ((float)raw * BMS_CAL_GAIN) + BMS_CAL_OFFSET;
#else
    return (float)raw * BMS_THEO_GAIN;
#endif
}

/* ===================== READ ALL CELLS ===================== */
BMS_Error_t BMS_ReadAllCells(float *v, uint16_t *raw)
{
    uint8_t data[6];
    bool pec_ok = false;

    BMS_WakeupIC();

    if (!BMS_SendCmd(CMD_ADCV))
    {
        return BMS_ERR_ADCV_CMD;
    }

    vTaskDelay(pdMS_TO_TICKS(20u));

    if (!BMS_ReadRegister(CMD_RDCVA, data, &pec_ok) || !pec_ok)
    {
        return BMS_ERR_RDCVA_PEC;
    }

    for (int i = 0; i < 3; i++)
    {
        raw[i] = (uint16_t)data[2*i] | ((uint16_t)data[2*i + 1] << 8u);
    }

    if (!BMS_ReadRegister(CMD_RDCVB, data, &pec_ok) || !pec_ok)
    {
        return BMS_ERR_RDCVB_PEC;
    }

    for (int i = 0; i < 3; i++)
    {
        raw[i + 3] = (uint16_t)data[2*i] | ((uint16_t)data[2*i + 1] << 8u);
    }

    if (!BMS_ReadRegister(CMD_RDCVC, data, &pec_ok) || !pec_ok)
    {
        return BMS_ERR_RDCVC_PEC;
    }

    for (int i = 0; i < 3; i++)
    {
        raw[i + 6] = (uint16_t)data[2*i] | ((uint16_t)data[2*i + 1] << 8u);
    }

    if (!BMS_ReadRegister(CMD_RDCVD, data, &pec_ok) || !pec_ok)
    {
        return BMS_ERR_RDCVD_PEC;
    }

    raw[9] = (uint16_t)data[0] | ((uint16_t)data[1] << 8u);

    for (int i = 0; i < 10; i++)
    {
        v[i] = BMS_RawToVoltage(raw[i]);
    }

    return BMS_ERR_NONE;
}

/* ===================== TASK ===================== */
void BMS_SpiTestTask(void *pvParameters)
{
    (void)pvParameters;

    float v[BMS_TOTAL_CELLS] = {0.0f};
    uint16_t raw[BMS_TOTAL_CELLS] = {0u};
    char buffer[256];

    BMS_CS_DESELECT();
    vTaskDelay(pdMS_TO_TICKS(100u));

    for (int i = 0; i < 3; i++)
    {
        BMS_WakeupIC();
        vTaskDelay(pdMS_TO_TICKS(2u));
    }

    {
        uint8_t cfga[6] = {0u};
        uint8_t cfga_read[6] = {0u};
        bool pec_ok = false;

        cfga[0] = 0x80u; /* REFON = 1 */

        if (!BMS_WriteRegister(CMD_WRCFGA, cfga))
        {
            UART_DebugPrint("CFG WRITE FAIL\r\n");
        }

        vTaskDelay(pdMS_TO_TICKS(5u));

        if (!BMS_ReadRegister(CMD_RDCFGA, cfga_read, &pec_ok) || !pec_ok)
        {
            UART_DebugPrint("CFG READ FAIL\r\n");
        }
        else
        {
            snprintf(buffer, sizeof(buffer),
                     "CFGA READ: %02X %02X %02X %02X %02X %02X\r\n",
                     cfga_read[0], cfga_read[1], cfga_read[2],
                     cfga_read[3], cfga_read[4], cfga_read[5]);
            UART_DebugPrint(buffer);
        }
    }

    vTaskDelay(pdMS_TO_TICKS(5u));

    for (;;)
    {
        BMS_Error_t err = BMS_ReadAllCells(v, raw);

        snprintf(buffer, sizeof(buffer),
                 "err:%u | RAW: %u %u %u %u %u %u %u %u %u %u | "
                 "V: %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f\r\n",
                 (unsigned)err,
                 raw[0], raw[1], raw[2], raw[3], raw[4],
                 raw[5], raw[6], raw[7], raw[8], raw[9],
                 v[0], v[1], v[2], v[3], v[4],
                 v[5], v[6], v[7], v[8], v[9]);

        UART_DebugPrint(buffer);

        vTaskDelay(pdMS_TO_TICKS(2000u));
    }
}