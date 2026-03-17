#include "fsm_can_tx_comm.h"

/*************************************************************
 * INTERNAL VARIABLES
 *************************************************************/

static TickType_t wait_start_tick = 0;

/* Debe existir en otro módulo */
extern bms_data_t bms_data;

/*************************************************************
 * AUXILIARY FUNCTIONS
 *************************************************************/

static bool can_send(uint32_t id, uint8_t dlc, uint8_t *data)
{
    if (CAN1_TransmitFIFOIsFull(CAN_TX_FIFO))
    {
        return false;
    }

    return CAN1_MessageTransmit(id, dlc, data, CAN_TX_FIFO, CAN_MSG_TX_DATA_FRAME);
}

static void send_voltages(void)
{
    uint8_t data[8];
    uint8_t frame = 0;
    uint8_t cell = 0;

    while (cell < NUM_CELLS)
    {
        uint8_t byte_index = 0;

        while ((cell < NUM_CELLS) && (byte_index <= 6))
        {
            uint16_t v = bms_data.cell_voltage[cell];

            data[byte_index]     = (uint8_t)(v & 0xFFU);
            data[byte_index + 1] = (uint8_t)((v >> 8) & 0xFFU);

            byte_index += 2;
            cell++;
        }

        if (!can_send((uint32_t)(0x200U + frame), byte_index, data))
        {
            return;
        }

        frame++;
    }
}

static void send_temperatures(void)
{
    uint8_t data[8];
    uint8_t frame = 0;
    uint8_t cell = 0;

    while (cell < NUM_CELLS)
    {
        uint8_t byte_index = 0;

        while ((cell < NUM_CELLS) && (byte_index <= 6))
        {
            int16_t t = bms_data.cell_temperature[cell];

            data[byte_index]     = (uint8_t)(t & 0xFF);
            data[byte_index + 1] = (uint8_t)((t >> 8) & 0xFF);

            byte_index += 2;
            cell++;
        }

        if (!can_send((uint32_t)(0x210U + frame), byte_index, data))
        {
            return;
        }

        frame++;
    }
}

static void send_current_mode(void)
{
    uint8_t data[8];

    data[0] = (uint8_t)(bms_data.battery_current & 0xFF);
    data[1] = (uint8_t)((bms_data.battery_current >> 8) & 0xFF);
    data[2] = (uint8_t)((bms_data.battery_current >> 16) & 0xFF);
    data[3] = (uint8_t)((bms_data.battery_current >> 24) & 0xFF);
    data[4] = (uint8_t)bms_data.mode;

    (void)can_send(0x220U, 5U, data);
}

static void send_flags(void)
{
    uint8_t data[8];

    data[0] = (uint8_t)(bms_data.bms_error_flags & 0xFFU);
    data[1] = (uint8_t)(bms_data.bms_warning_flags & 0xFFU);
    data[2] = (uint8_t)(bms_data.bms_status_flags & 0xFFU);

    (void)can_send(0x221U, 3U, data);
}


/*************************************************************
 * CHECK FUNCTIONS
 *************************************************************/

static int telemetry_timeout(fsm_t *this)
{
    (void)this;
    return ((xTaskGetTickCount() - wait_start_tick) >= CAN_TX_PERIOD);
}

static int check_sended(fsm_t *this)
{
    (void)this;
    return 1;
}

/*************************************************************
 * ACTION FUNCTIONS
 *************************************************************/

static void send_frame(fsm_t *this)
{
    (void)this;

    send_voltages();
    send_temperatures();
    send_current_mode();
    send_flags();
}

static void reestart_cicle(fsm_t *this)
{
    (void)this;
    wait_start_tick = xTaskGetTickCount();
}

/*************************************************************
 * FSM TABLE
 *************************************************************/
fsm_trans_t fsm_can_tx_comm_tt[] =
{
    { WAIT_PERIOD, telemetry_timeout, SEND_FRAME,  send_frame      },
    { SEND_FRAME,  check_sended,      WAIT_PERIOD, reestart_cicle  },
    { -1,          NULL,              -1,          NULL            }
};

fsm_t* fsm_can_tx_comm_new(void)
{
    wait_start_tick = xTaskGetTickCount();
    return fsm_new(fsm_can_tx_comm_tt);
}

