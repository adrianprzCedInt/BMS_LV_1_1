#ifndef FSM_BMS_MODE_H
#define FSM_BMS_MODE_H

#include "fsm.h"

typedef enum
{
    BMS_IDLE,
    BMS_DISCHARGE,
    BMS_CHARGE,
    BMS_BALANCING, //TODO
    BMS_ERROR
} bms_state_t;

fsm_t* fsm_bms_mode_new(void);

bms_state_t bms_mode_get_state(void);

#endif