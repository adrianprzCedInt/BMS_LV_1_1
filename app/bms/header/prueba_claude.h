/*******************************************************************************
 * @file    adbms6830b.h
 * @brief   API pública del driver ADBMS6830B
 *
 * Incluye este header en cualquier módulo que necesite:
 *   - Lanzar la tarea FreeRTOS de medición (BMS_SpiTestTask)
 *   - Acceder a los resultados en tiempo real (BMS_GetTestResult)
 *   - Consultar el struct de estado (BMS_TestResult_t)
 *******************************************************************************/
 
#ifndef ADBMS6830B_H
#define ADBMS6830B_H
 
#include <stdint.h>
#include <stdbool.h>
 
#ifdef __cplusplus
extern "C" {
#endif
 
/* ============================================================================
 * STRUCT DE RESULTADO
 * Accesible desde otras tareas vía BMS_GetTestResult().
 * Inspeccionable en MPLAB X -> Window -> Debugging -> Watches -> g_result
 * ============================================================================ */
typedef struct
{
    /* Resultado de la verificación WRCFGA/RDCFGA */
    bool    wrcfga_rdcfga_ok;   /* true  = escritura + lectura + PEC OK        */
    bool    pec_ok;             /* true  = último PEC de datos correcto         */
    bool    spi_timeout;        /* true  = alguna transferencia SPI agotó el timeout */
    uint8_t cmd_counter;        /* Valor del command counter devuelto por el IC */
 
    /* Contenido del registro CFGRA leído */
    uint8_t rx_cfga[6];
 
    /* Voltajes de celda (índice 0 = celda 1, ... índice 9 = celda 10) */
    float   cell_voltage[16];   /* En voltios: raw * 150 µV + 1.5 V            */
    uint16_t cell_raw[16];      /* Valor ADC crudo de 16 bits                  */
 
} BMS_TestResult_t;
 
/* ============================================================================
 * API PÚBLICA
 * ============================================================================ */
 
/**
 * @brief  Tarea FreeRTOS principal del driver ADBMS6830B.
 *
 * Realiza la secuencia de inicialización (wakeup ? WRCFGA ? RDCFGA ? ADCV ?
 * lectura de celdas) y luego entra en un bucle que imprime los resultados
 * por UART1 cada 500 ms.
 *
 * Registro en main.c:
 *   xTaskCreate(BMS_SpiTestTask, "BMS_Test", 1024, NULL, 2, NULL);
 *
 * @param  pvParameters  No utilizado (pasa NULL).
 */
void BMS_SpiTestTask(void *pvParameters);
 
/**
 * @brief  Devuelve un puntero al struct de resultado global.
 *
 * El struct se actualiza en cada ciclo de medición. Accede a él desde
 * otras tareas con las debidas precauciones de concurrencia si es necesario.
 *
 * @return Puntero a BMS_TestResult_t (nunca NULL).
 */
BMS_TestResult_t *BMS_GetTestResult(void);
 
/**
 * @brief  Genera el pulso de wakeup hacia el ADBMS6830B.
 *
 * Función pública por si otros módulos necesitan despertar el IC antes
 * de una transacción SPI manual (por ejemplo, desde una tarea de calibración).
 * En uso normal no es necesario llamarla directamente.
 */
void BMS_WakeupIC(void);
 
#ifdef __cplusplus
}
#endif
 
#endif /* ADBMS6830B_H */