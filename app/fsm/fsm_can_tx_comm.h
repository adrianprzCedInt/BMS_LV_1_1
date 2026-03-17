#ifndef FSM_CAN_TX_COMM_H
#define FSM_CAN_TX_COMM_H

#include "fsm.h"
#include "definitions.h"
#include "BMS_conf.h"
#include "FreeRTOS.h"
#include "task.h"

#define CAN_TX_PERIOD pdMS_TO_TICKS(100U)
#define CAN_TX_FIFO   0U

enum can_tx_comm_state
{
    WAIT_PERIOD = 0,
    SEND_FRAME
};

fsm_t* fsm_can_tx_comm_new(void);

#endif
