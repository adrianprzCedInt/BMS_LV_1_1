/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef _BMS_CONFIG_H_    /* Guard against multiple inclusion */
#define _BMS_CONFIG_H_
    #include "fsm_bms_mode.h"
    #include "bms_flags.h"

    /* Number of cells in the battery pack */
    #define NUM_CELLS   10

    // TODO revisar tipo de dato
    /* BMS STRUCT DECLARATION*/
    typedef struct
    {
        uint16_t cell_voltage[NUM_CELLS];       /* Cell voltages (mV) */
        int16_t cell_temperature[NUM_CELLS];    /* Cell temperatures (°C * 10 for precision) */
        int32_t battery_current;                /* Battery current (mA) */
        bms_state_t mode;                       /* Current BMS mode */
        BMS_Flags_t bms_error_flags;            /* Current BMS ERROR FLAGS status */
        BMS_Flags_t bms_warning_flags;          /* Current BMS WARNINGS FLAGS status */
        BMS_Flags_t bms_status_flags;           /* Current BMS STATUS FLAGS status */
    } bms_data_t;

    /* Global BMS data structure */

    extern volatile bms_data_t bms;



#endif 

/* *****************************************************************************
 End of File
 */
