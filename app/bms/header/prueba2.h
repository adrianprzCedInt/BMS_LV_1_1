#ifndef BMS_ADBMS6830_H
#define BMS_ADBMS6830_H

#ifdef __cplusplus
extern "C" {
#endif

/* ============================================================================ */
/* INCLUDES */
/* ============================================================================ */

#include <stdint.h>
#include <stdbool.h>

/* ============================================================================ */
/* DEFINES */
/* ============================================================================ */

#define BMS_TOTAL_CELLS   10u
#define BMS_CFGA_SIZE     6u

/* ============================================================================ */
/* TIPOS */
/* ============================================================================ */

/**
 * @brief Códigos de error del BMS
 */
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

/**
 * @brief Resultado de test / debug
 */
typedef struct
{
    bool spi_timeout;
    bool pec_ok;
    bool wrcfga_rdcfga_ok;
    uint8_t cmd_counter;
    uint8_t rx_cfga[BMS_CFGA_SIZE];
} BMS_TestResult_t;

/* ============================================================================ */
/* API PÚBLICA */
/* ============================================================================ */

/**
 * @brief Tarea FreeRTOS principal del BMS
 */
void BMS_SpiTestTask(void *pvParameters);

/**
 * @brief Lectura completa de celdas
 *
 * @param cell_voltage Array de tamaño BMS_TOTAL_CELLS
 * @param cell_raw     Array de tamaño BMS_TOTAL_CELLS
 *
 * @return Código de error
 */
BMS_Error_t BMS_ReadAllCells(float *cell_voltage, uint16_t *cell_raw);

/**
 * @brief Obtener estructura de debug (solo lectura)
 */
const BMS_TestResult_t *BMS_GetTestResult(void);

/**
 * @brief Wakeup del ADBMS6830
 */
void BMS_WakeupIC(void);

#ifdef __cplusplus
}
#endif

#endif /* BMS_ADBMS6830_H */