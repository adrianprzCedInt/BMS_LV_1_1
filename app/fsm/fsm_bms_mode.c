/* ************************************************************************** */
/** BMS Operating Mode State Machine

  @Company
    UPMRacing - Adrián Pérez López - LV

  @File Name
    fsm_bms_mode.c

  @Summary
    Finite State Machine responsible for managing the global operating mode
    of the Battery Management System (BMS).

  @Description
    This module implements a finite state machine (FSM) that controls the
    high-level operating mode of the Battery Management System. The FSM
    determines whether the system is currently idle, charging, discharging,
    balancing, or in an error condition.

    The operating mode is stored internally using the variable
    "current_state", while the public system state is reflected through the
    global BMS status flag register (bms_status_flags). These flags allow
    other firmware modules such as diagnostics, communication interfaces,
    and monitoring systems to determine the current behaviour of the BMS
    without direct coupling to this module.

    Transitions between states are determined by evaluating system
    conditions such as charge requests, discharge requests, or the
    presence of critical error flags. Error conditions have the highest
    priority and force the system into the ERROR state.

    The FSM updates the global BMS status flags through dedicated macros,
    ensuring that only one operating mode is active at any time.

    FSM States:
        - IDLE
            Default system state when no charge or discharge operation
            is requested.

        - CHARGE
            The system is operating in charging mode.

        - DISCHARGE
            The system is delivering power to the load.

        - BALANCING
            Cell balancing process is active. This state will be used when
            the cell monitoring IC (ADBMS6830) balancing functionality is
            integrated.

        - ERROR
            A critical fault has been detected. The system remains in this
            state until a reset or recovery mechanism is implemented.

    State transitions are evaluated periodically by the scheduler task
    responsible for executing this FSM.

    Key features:
        - Centralized control of BMS operating modes
        - Integration with global BMS status flags
        - Priority-based fault handling
        - Compatible with FreeRTOS task scheduling
        - Designed for modular integration with other FSM-based modules

             +-------+
             | IDLE  |
             +-------+
              |   |
    charge    |   | discharge
              v   v
         +--------+--------+
         |                 |
     +-------+        +---------+
     |CHARGE |        |DISCHARGE|
     +-------+        +---------+

          ^               ^
          |               |
          +-------+-------+
                  |
               error
                  v
              +-------+
              | ERROR |
              +-------+


 *  */
/* ************************************************************************** */


#include <stddef.h>
#include "fsm.h"
#include "fsm_bms_mode.h"
#include "bms_flags.h"

static bms_state_t current_state = BMS_IDLE;

/* Getter function for debugging */
bms_state_t bms_mode_get_state(void)
{
    return current_state;
}

////////////////////////////////////////////////////////////
//// CONDITIONS
////////////////////////////////////////////////////////////

/* Idle Requested */
static int idle_requested(fsm_t *this)
{
    return BMS_IS_IDLE();
}

/* Detect any system error */
static int error_detected(fsm_t *this)
{
    return BMS_HAS_ERROR();
}

/* Discharging requested */
static int discharge_requested(fsm_t *this)
{
    return BMS_IS_DISCHARGING();
}

/* Charging requested */
static int charge_requested(fsm_t *this)
{
    return BMS_IS_CHARGING();
}

/* Always true */
static int always_true(fsm_t *this)
{
    return 1;
}



////////////////////////////////////////////////////////////
//// ACTIONS
////////////////////////////////////////////////////////////

static void enter_idle(fsm_t *this)
{
    current_state = BMS_IDLE;
    BMS_SET_IDLE();
}

static void enter_discharge(fsm_t *this)
{
    current_state = BMS_DISCHARGE;
    BMS_SET_DISCHARGING();
}

static void enter_charge(fsm_t *this)
{
    current_state = BMS_CHARGE;
    BMS_SET_CHARGING();
}

// TODO
static void enter_balancing(fsm_t *this)
{
    current_state = BMS_BALANCING;
    BMS_SET_BALANCING();
}

static void enter_error(fsm_t *this)
{
    current_state = BMS_ERROR;
    BMS_SET_ERROR();
}

////////////////////////////////////////////////////////////
//// TRANSITION TABLE
////////////////////////////////////////////////////////////

/* NOTE:
   Balancing transitions are not implemented yet.
   They will be added when integrating the ADBMS6830 measurement
   and balancing control FSM.
*/

fsm_trans_t bms_mode_tt[] =
{
    { BMS_IDLE,       charge_requested,     BMS_CHARGE,     enter_charge    },
    { BMS_IDLE,       discharge_requested,  BMS_DISCHARGE,  enter_discharge },

    { BMS_DISCHARGE,  error_detected,       BMS_ERROR,      enter_error     },
    { BMS_DISCHARGE,  idle_requested,       BMS_IDLE,       enter_idle      },

    { BMS_CHARGE,     error_detected,       BMS_ERROR,      enter_error     },
    { BMS_CHARGE,     idle_requested,       BMS_IDLE,       enter_idle      },

    { BMS_ERROR,      always_true,          BMS_ERROR,      NULL            },

    { -1,             NULL,                 -1,             NULL            }
};

////////////////////////////////////////////////////////////
//// CREATION
////////////////////////////////////////////////////////////

fsm_t* fsm_bms_mode_new(void)
{
    return fsm_new(bms_mode_tt);
}