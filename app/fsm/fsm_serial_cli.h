#ifndef FSM_SERIAL_CLI_H
#define FSM_SERIAL_CLI_H

#include "fsm.h"

/**
 * @brief Creates the Serial CLI FSM instance.
 *
 * This FSM handles UART command parsing and execution,
 * allowing interaction with the BMS through a serial terminal.
 *
 * @return Pointer to the FSM instance.
 */

fsm_t* fsm_serial_cli_new(void);

#endif
