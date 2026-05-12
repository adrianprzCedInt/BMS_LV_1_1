#ifndef BMS_ADBMS6830_H
#define BMS_ADBMS6830_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>

#define BMS_TOTAL_CELLS    10u

typedef enum
{
    BMS_ERR_NONE = 0,
    BMS_ERR_SPI_TIMEOUT,
    BMS_ERR_ADCV_CMD,
    BMS_ERR_READ_PEC,

    /* NUEVOS */
    BMS_ERR_RDCVA_PEC,
    BMS_ERR_RDCVB_PEC,
    BMS_ERR_RDCVC_PEC,
    BMS_ERR_RDCVD_PEC

} BMS_Error_t;

/* API */
void BMS_SpiTestTask(void *pvParameters);
BMS_Error_t BMS_ReadAllCells(float *cell_voltage, uint16_t *cell_raw);
void BMS_WakeupIC(void);

#ifdef __cplusplus
}
#endif

#endif