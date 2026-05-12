#ifndef PRUEBA_H
#define PRUEBA_H

#include <stdbool.h>
#include <stdint.h>

/* ============================================================================
 * ESTRUCTURA DE RESULTADO
 * Agrega "g_result" en Window -> Debugging -> Watches para inspeccionarla
 * en tiempo real desde el debugger de MPLAB X sin necesitar UART.
 * ============================================================================ */

typedef struct
{
    bool    wrcfga_rdcfga_ok;
    bool    pec_ok;
    bool    spi_timeout;
    uint8_t rx_cfga[6];
    uint8_t cmd_counter;
    float   cell_voltage_V[3];
} BMS_TestResult_t;

void BMS_SpiTestTask(void *pvParameters);
BMS_TestResult_t *BMS_GetTestResult(void);

#endif