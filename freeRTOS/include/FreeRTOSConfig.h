#ifndef FREERTOS_CONFIG_H
#define FREERTOS_CONFIG_H

#include <xc.h>

/*-----------------------------------------------------------
Clock
-----------------------------------------------------------*/

#define configCPU_CLOCK_HZ              (80000000UL)
#define configPERIPHERAL_CLOCK_HZ       (80000000UL)

/*-----------------------------------------------------------
Scheduler
-----------------------------------------------------------*/

#define configTICK_RATE_HZ              (1000) // 1 tick -> 1 ms
#define configMAX_PRIORITIES            (5) // 0 Idle, 4 Highest
#define configMINIMAL_STACK_SIZE        (128)
#define configTOTAL_HEAP_SIZE           (20 * 1024) // 20KB de Heap 128KB de PIC32MX
#define configMAX_TASK_NAME_LEN         (16)

#define configUSE_PREEMPTION            1
#define configUSE_TIME_SLICING          1

/*-----------------------------------------------------------
Interrupt priorities (REQUIRED FOR PIC32)
-----------------------------------------------------------*/

#define configKERNEL_INTERRUPT_PRIORITY         1
#define configMAX_SYSCALL_INTERRUPT_PRIORITY    3

/*-----------------------------------------------------------
Tick type
-----------------------------------------------------------*/

#define configTICK_TYPE_WIDTH_IN_BITS   TICK_TYPE_WIDTH_32_BITS

/*-----------------------------------------------------------
Hooks
-----------------------------------------------------------*/

#define configUSE_IDLE_HOOK             0
#define configUSE_TICK_HOOK             0

/*-----------------------------------------------------------
Software timers
-----------------------------------------------------------*/

#define configUSE_TIMERS                1
#define configTIMER_TASK_PRIORITY       (configMAX_PRIORITIES - 1)
#define configTIMER_QUEUE_LENGTH        10
#define configTIMER_TASK_STACK_DEPTH    256

/*-----------------------------------------------------------
ISR stack
-----------------------------------------------------------*/

#define configISR_STACK_SIZE            512

/*-----------------------------------------------------------
API inclusion
-----------------------------------------------------------*/

#define INCLUDE_vTaskDelay              1
#define INCLUDE_vTaskDelayUntil         1
#define INCLUDE_vTaskDelete             1

/*-----------------------------------------------------------
PIC32 interrupt mapping
-----------------------------------------------------------*/

#define vPortTickInterruptHandler       vPortCoreTimerHandler
#define vPortYieldISR                   vPortYield

#endif