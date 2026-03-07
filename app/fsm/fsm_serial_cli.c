#include <string.h>
#include <stdint.h>
#include <stdio.h>

#include "fsm.h"
#include "fsm_serial_cli.h"
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

static void execute_command(const char *cmd);
static void cli_trim(char *s);

/////////////////////////////////////////////////////////////////////////
//// COMMAND TABLE
/////////////////////////////////////////////////////////////////////////

static const cli_cmd_t cli_table[] =
{
    {"help",   cmd_help},
    {"err",    cmd_errors},
    {"warn",   cmd_warnings},
    {"status", cmd_status}
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
    cli_print("Commands:\r\n");
    cli_print("->help\r\n");
    cli_print("->err\r\n");
    cli_print("->warn\r\n");
    cli_print("->status\r\n");
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

/////////////////////////////////////////////////////////////////////////
//// JAMP ALWAYS
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
        if(*s == '\r' || *s == '\n' || *s == ' ')
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
    {WAIT_COMMAND, command_received, PROCESS_COMMAND, process_command},
    {PROCESS_COMMAND, always_true, WAIT_COMMAND, NULL},
    {-1, NULL, -1, NULL}
};

/////////////////////////////////////////////////////////////////////////
//// FSM CREATION
/////////////////////////////////////////////////////////////////////////

fsm_t* fsm_serial_cli_new(void)
{
    memset(cmd_buffer,0,sizeof(cmd_buffer));
    cmd_index = 0;

    cli_flush_uart();

    cli_print("\r\nBMS CLI Ready\r\nBMS> ");

    return fsm_new(serial_cli_tt);
}