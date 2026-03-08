
/* ************************************************************************** */
/** BMS UART Command Line Interface State Machine

  @Company
    UPMRacing - Adrián Pérez López - LV

  @File Name
    fsm_serial_cli.c

  @Summary
    Finite State Machine implementing a UART command line interface for the BMS.

  @Description
    This module implements a finite state machine (FSM) that provides a
    lightweight command line interface (CLI) for interacting with the
    Battery Management System (BMS) through the UART serial port.

    The CLI receives characters from the UART peripheral, assembles them
    into commands and executes the corresponding actions when a complete
    command is detected. Commands are terminated by a newline or carriage
    return character.

    The received command is compared against a predefined command table
    containing the supported CLI instructions. When a match is found, the
    associated handler function is executed.

    The CLI provides a simple diagnostic and debugging interface that allows
    developers to inspect the internal state of the BMS during development
    and testing. Currently implemented commands allow reading the system
    status, warning flags and error flags stored in the global BMS flag
    registers.

    The module is designed to run periodically within a FreeRTOS task,
    ensuring non-blocking execution and compatibility with the real-time
    architecture of the firmware.

    FSM States:
        - WAIT_COMMAND
            The system waits for incoming characters from the UART interface
            and stores them in an internal command buffer.

        - PROCESS_COMMAND
            Once a complete command has been received, the command is parsed
            and the corresponding handler function is executed.

    Key features:
        - UART-based debugging interface
        - Table-driven command parser
        - Minimal RAM usage with fixed command buffer
        - Non-blocking operation suitable for RTOS environments
        - Easily extendable command set

 */
/* ************************************************************************** */

#include <string.h>
#include <stdint.h>
#include <stdio.h>

#include "fsm.h"
#include "fsm_serial_cli.h"
#include "fsm_bms_mode.h"
#include "bms_flags.h"
#include "definitions.h"

#define CMD_BUFFER_SIZE 64

/////////////////////////////////////////////////////////////////////////
//// TYPES
/////////////////////////////////////////////////////////////////////////

typedef void (*cli_cmd_func_t)(void);

typedef struct
{
    const char *cmd;
    cli_cmd_func_t func;
} cli_cmd_t;

/////////////////////////////////////////////////////////////////////////
//// FORWARD DECLARATIONS
/////////////////////////////////////////////////////////////////////////

static void cmd_help(void);
static void cmd_errors(void);
static void cmd_warnings(void);
static void cmd_status(void);

/////////////////////////////////////////////////////////////////////////
//// SPECIAL COMMANDS TO DEBUG
/////////////////////////////////////////////////////////////////////////
static void cmd_charge(void);
static void cmd_discharge(void);
static void cmd_idle(void);
static void cmd_error(void);
static void cmd_clear(void);
static void cmd_mode(void);

static void execute_command(const char *cmd);
static void cli_trim(char *s);

/////////////////////////////////////////////////////////////////////////
//// COMMAND TABLE
/////////////////////////////////////////////////////////////////////////

static const cli_cmd_t cli_table[] =
{
    { "help",      cmd_help     },
    { "get errors",       cmd_errors   },
    { "get warnings",      cmd_warnings },
    { "get status",    cmd_status   },
    { "set mode idle",      cmd_idle     },
    { "set mode discharge", cmd_discharge},
    { "set mode charge",    cmd_charge   },
    { "set mode error",     cmd_error    },
    { "clear errors",     cmd_clear    },
    { "mode",      cmd_mode     }
};

#define CLI_CMD_COUNT (sizeof(cli_table)/sizeof(cli_cmd_t))

/////////////////////////////////////////////////////////////////////////
//// BUFFER
/////////////////////////////////////////////////////////////////////////

static char cmd_buffer[CMD_BUFFER_SIZE];
static uint8_t cmd_index = 0;

/////////////////////////////////////////////////////////////////////////
//// FSM STATES
/////////////////////////////////////////////////////////////////////////

enum serial_state
{
    WAIT_COMMAND,
    PROCESS_COMMAND
};

/////////////////////////////////////////////////////////////////////////
//// UART PRINT
/////////////////////////////////////////////////////////////////////////

static void cli_print(const char *msg)
{
    while(UART1_WriteIsBusy());
    UART1_Write((void*)msg, strlen(msg));
    while(!UART1_TransmitComplete());
}

static void cli_print_hex(const char *label, uint32_t value)
{
    char buffer[64];

    snprintf(buffer,sizeof(buffer),"%s: 0x%08lX\r\n",label,value);

    cli_print(buffer);
}

static void cli_flush_uart(void)
{
    while(U1STAbits.URXDA)
    {
        volatile char dummy = U1RXREG;
        (void)dummy;
    }
}
/////////////////////////////////////////////////////////////////////////
//// CLI COMMANDS
/////////////////////////////////////////////////////////////////////////

static void cmd_help(void)
{
    cli_print("\r\n");
    cli_print("=========================================\r\n");
    cli_print("      BMS LV DEBUG COMMAND INTERFACE     \r\n");
    cli_print("=========================================\r\n");

    cli_print("\r\nGET COMMANDS\r\n");
    cli_print("-----------------------------------------\r\n");
    cli_print("  get errors        -> Show error flags\r\n");
    cli_print("  get warnings      -> Show warning flags\r\n");
    cli_print("  get status        -> Show status flags\r\n");
    cli_print("  mode              -> Show current BMS mode\r\n");

    cli_print("\r\nSET COMMANDS\r\n");
    cli_print("-----------------------------------------\r\n");
    cli_print("  set mode idle       -> Set BMS to IDLE\r\n");
    cli_print("  set mode charge     -> Set BMS to CHARGE\r\n");
    cli_print("  set mode discharge  -> Set BMS to DISCHARGE\r\n");
    cli_print("  set mode error      -> Force ERROR state\r\n");

    cli_print("\r\nSYSTEM COMMANDS\r\n");
    cli_print("-----------------------------------------\r\n");
    cli_print("  clear errors      -> Clear error flags\r\n");
    cli_print("  help              -> Show this menu\r\n");

    cli_print("\r\n");
}

static void cmd_errors(void)
{
    cli_print_hex("Error flags", bms_error_flags);
}

static void cmd_warnings(void)
{
    cli_print_hex("Warning flags", bms_warning_flags);
}

static void cmd_status(void)
{
    cli_print_hex("Status flags", bms_status_flags);
}

static void cmd_idle(void)
{
    BMS_SET_IDLE();
    cli_print("Idle mode\r\n");
}
static void cmd_discharge(void)
{
    BMS_SET_DISCHARGING();
    cli_print("Discharge requested\r\n");
}

static void cmd_charge(void)
{
    BMS_SET_CHARGING();
    cli_print("Charge requested\r\n");
}

static void cmd_error(void)
{
    bms_error_flags |= (1 << 0);
    cli_print("Error triggered\r\n");
}

static void cmd_clear(void)
{
    BMS_CLEAR_ALL_FLAGS(bms_error_flags);
    cli_print("Errors cleared\r\n");
}

static void cmd_mode(void)
{
    cli_print("\r\nBMS MODE\r\n");
    cli_print("---------------------\r\n");

    switch(bms_mode_get_state())
    {
        case BMS_IDLE:
            cli_print("State : IDLE\r\n");
            break;
        
        case BMS_DISCHARGE:
            cli_print("State : DISCHARGE\r\n");
            break;
        case BMS_CHARGE:
            cli_print("State : CHARGE\r\n");
            break;
        
        //TODO
        case BMS_BALANCING:
            cli_print("State : BALANCING\r\n");
            break;

        case BMS_ERROR:
            cli_print("State : ERROR\r\n");
            break;
    }

    cli_print_hex("Status flags", bms_status_flags);
    cli_print_hex("Error flags", bms_error_flags);
}
/////////////////////////////////////////////////////////////////////////
//// JUMP ALWAYS
/////////////////////////////////////////////////////////////////////////

static int always_true(fsm_t *this)
{
    return 1;
}

/////////////////////////////////////////////////////////////////////////
//// STRING CLEAN
/////////////////////////////////////////////////////////////////////////
static void cli_trim(char *s)
{
    while(*s)
    {
        if(*s == '\r' || *s == '\n')
        {
            *s = '\0';
            return;
        }
        s++;
    }
}

/////////////////////////////////////////////////////////////////////////
//// TRANSITION CONDITION
/////////////////////////////////////////////////////////////////////////

static int command_received(fsm_t *this)
{
    char c;
    bool command_ready = false;

    while(U1STAbits.URXDA)
    {
        c = U1RXREG;

        /* ignorar CR/LF iniciales */
        if(cmd_index == 0 && (c == '\r' || c == '\n'))
            continue;

        if(c == '\r' || c == '\n')
        {
            if(cmd_index > 0)
            {
                cmd_buffer[cmd_index] = '\0';
                command_ready = true;
            }
        }
        else
        {
            if(cmd_index < CMD_BUFFER_SIZE - 1)
            {
                cmd_buffer[cmd_index++] = c;
            }
        }
    }

    return command_ready;
}

/////////////////////////////////////////////////////////////////////////
//// COMMAND EXECUTION
/////////////////////////////////////////////////////////////////////////

static void execute_command(const char *cmd)
{
    // Debuf for string received
    /*
    char dbg[80];

    snprintf(dbg,sizeof(dbg),"CMD=[%s]\r\n",cmd);
    cli_print(dbg);
     
     */

    for(uint32_t i = 0; i < CLI_CMD_COUNT; i++)
    {
        if(strcmp(cmd, cli_table[i].cmd) == 0)
        {
            cli_table[i].func();
            return;
        }
    }

    cli_print("Unknown command\r\n");
}

static void process_command(fsm_t *this)
{
    char command[CMD_BUFFER_SIZE];

    /* copiar comando */
    memcpy(command, cmd_buffer, CMD_BUFFER_SIZE);

    /* limpiar buffer inmediatamente */
    memset(cmd_buffer,0,sizeof(cmd_buffer));
    cmd_index = 0;

    cli_trim(command);

    execute_command(command);

    cli_print("\r\nBMS> ");
}
/////////////////////////////////////////////////////////////////////////
//// FSM TABLE
/////////////////////////////////////////////////////////////////////////

fsm_trans_t serial_cli_tt[] =
{
    {WAIT_COMMAND,      command_received,   PROCESS_COMMAND,    process_command},
    {PROCESS_COMMAND,   always_true,        WAIT_COMMAND,       NULL           },
    {-1,                NULL,               -1,                 NULL           }
};

/////////////////////////////////////////////////////////////////////////
//// FSM CREATION
/////////////////////////////////////////////////////////////////////////

fsm_t* fsm_serial_cli_new(void)
{
    memset(cmd_buffer,0,sizeof(cmd_buffer));
    cmd_index = 0;

    cli_flush_uart();

    cli_print("\r\n");
    cli_print("============================================\r\n");
    cli_print("   UPMRacing Low Voltage BMS Debug Console  \r\n");
    cli_print("============================================\r\n");
    cli_print("Firmware v1.1 | PIC32MX | FreeRTOS\r\n");
    cli_print("Firmware initialized successfully\r\n");
    cli_print("Diagnostic interface ready\r\n");
    cli_print("Type 'help' to display available commands\r\n");
    cli_print("\r\nBMS> ");


    return fsm_new(serial_cli_tt);
}