/* ************************************************************************** */
/** BMS Error LED State Machine

  @Company
    UPMRacing - Adrián Pérez López - LV

  @File Name
    fsm_error_leds.c

  @Summary
    Finite State Machine used to display BMS error codes using four LEDs.

  @Description
    This module implements a finite state machine (FSM) responsible for
    displaying active Battery Management System (BMS) error flags through
    a 4-bit binary code using diagnostic LEDs.

    The error flags are stored in a 32-bit register (bms_error_flags),
    where each bit represents a specific system fault. The FSM cycles
    through all active error bits and displays their corresponding code
    sequentially.

    Error codes are represented in binary using four LEDs, allowing up
    to 16 distinct visual patterns. If multiple errors are active, the
    system periodically cycles through them.

    The timing between error displays is controlled using the FreeRTOS
    tick counter, ensuring deterministic behaviour within the RTOS
    environment.

    FSM States:
        - IDLE
            No error flags are active. All LEDs remain off.

        - DISPLAY_ERROR
            The current error code is displayed on the LEDs.

        - WAIT
            A delay period between consecutive error displays.

    Key features:
        - Supports up to 32 BMS error flags
        - Cycles through all active errors automatically
        - Minimal RAM usage (no dynamic memory allocation)
        - RTOS-friendly timing using FreeRTOS ticks
        - Deterministic execution suitable for embedded systems

 */
/* ************************************************************************** */
#include <stddef.h>
#include "definitions.h"
#include "fsm.h"
#include "bms_flags.h"
#include "fsm_error_leds.h"

#include "FreeRTOS.h"
#include "task.h"

// Blinking error leds TIME 
#define ERROR_LED_DELAY pdMS_TO_TICKS(1500)


static TickType_t wait_start_tick = 0;
static uint8_t error_index = 0;

// Definition of the states
enum error_leds_state {
  IDLE,
  DISPLAY_ERROR,
  WAIT
};
/*
            IDLE
             ? error
             ?
        DISPLAY_ERROR ??timeout??? WAIT
              ?                      ?
              ?                      ?
              ????? error ????????????
 */

/////////////////////////////////////////////////////////////////////////
///		AUX FUNCTIONS
/////////////////////////////////////////////////////////////////////////

static uint8_t get_next_error(void)
{
    for(uint8_t i = 0; i < 32; i++)
    {
        uint8_t idx = (error_index + i) & 31;

        if (BMS_CHECK_FLAG(bms_error_flags, (1UL << idx)))
        {
            error_index = idx;
            return idx + 1;
        }
    }

    return 0;
}


/////////////////////////////////////////////////////////////////////////
///		CHECKED FUNCTIONS FOR TRANSITIONS
/////////////////////////////////////////////////////////////////////////
///     NOT ACTIONS JUST CHECKS VALUES!!!!!
/////////////////////////////////////////////////////////////////////////

static int is_Error (fsm_t* this)
  {
    return BMS_HAS_ERROR();
  }

static int no_Error (fsm_t* this)
  {
    return !BMS_HAS_ERROR();
  }

static int display_timeout (fsm_t* this)
{
    return (xTaskGetTickCount() - wait_start_tick) >= ERROR_LED_DELAY;
}

/////////////////////////////////////////////////////////////////////////
///		ACTION FUNCTIONS WHEN TRANSITIONS
/////////////////////////////////////////////////////////////////////////

static void error_code (fsm_t* this)
{
    uint8_t code = get_next_error();

    if(code == 0)
        return;

    if (code & (1U << 0)) ERR_Led_1_Set();
    else ERR_Led_1_Clear();

    if (code & (1U << 1)) ERR_Led_2_Set();
    else ERR_Led_2_Clear();

    if (code & (1U << 2)) ERR_Led_3_Set();
    else ERR_Led_3_Clear();

    if (code & (1U << 3)) ERR_Led_4_Set();
    else ERR_Led_4_Clear();
}

// Clears all leds state
static void clear_error_code (fsm_t* this)
{
    ERR_Led_1_Clear();
    ERR_Led_2_Clear();
    ERR_Led_3_Clear();
    ERR_Led_4_Clear();
    
    error_index = 0;
} 

static void start_wait (fsm_t* this)
{
    ERR_Led_1_Clear();
    ERR_Led_2_Clear();
    ERR_Led_3_Clear();
    ERR_Led_4_Clear();

    wait_start_tick = xTaskGetTickCount();

    error_index = (error_index + 1) & 31;
}
// Explicit FSM description
// {INITIAL_STATE,	CHECKED_FUNCTION, 	NEXT_STATE, 	TRANSITION_FUNCTION}
// This FSM cycles through all active error codes
fsm_trans_t fsm_error_leds_tt[] = {
  { IDLE,          is_Error,        DISPLAY_ERROR,  error_code        },
  { DISPLAY_ERROR, display_timeout, WAIT,           start_wait        },
  { WAIT,          is_Error,        DISPLAY_ERROR,  error_code        },
  { DISPLAY_ERROR, no_Error,        IDLE,           clear_error_code  },
  { WAIT,          no_Error,        IDLE,           clear_error_code  },
  { -1,            NULL,            -1,             NULL              }
};

fsm_t* fsm_system_error_led_new(void) {
  return fsm_new(fsm_error_leds_tt);
}

/*
 * Modificar si se quiere usar, es solo plantilla
 void fsm_error_led_task(void* arguments) {

	fsm_t* fs = fsm_system_error_led_new();
    uint32_t period = 4; // ms ? 100 Hz
    uint32_t last_wake = osKernelGetTickCount();

	for (;;) {
		fsm_fire(fs);
        osDelayUntil(last_wake + period);
        last_wake += period;
		//uint32_t next_period = osKernelGetTickCount() + 1;

		//osDelayUntil(next_period);
		//osDelay(3);
	}
}
 */