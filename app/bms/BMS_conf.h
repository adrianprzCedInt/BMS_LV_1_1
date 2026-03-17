/* ************************************************************************** */
/** BMS Configuration and Data Structure Definition

  @Company
    UPMRacing - Adrián Pérez López - LV

  @Summary
    Global configuration parameters and shared data structure for the
    Battery Management System (BMS).

  @Description
    This file defines the fundamental configuration parameters and the main
    data structure used by the Battery Management System firmware.

    The file provides:

        - Global configuration constants for the battery pack
        - The main BMS data structure used to store runtime measurements
        - A globally accessible instance of the BMS data

    The main structure `bms_data_t` aggregates all relevant battery information
    required by different firmware modules, including:

        ? Individual cell voltages
        ? Individual cell temperatures
        ? Pack current measurement
        ? Current BMS operating mode
        ? Error flags
        ? Warning flags
        ? System status flags

    The global variable `bms` is declared as `volatile` to ensure that the
    compiler does not optimize accesses to this structure, since it may be
    modified by multiple RTOS tasks or interrupt service routines.

    This centralized data model allows different tasks to access the battery 
    state without tight coupling between modules, improving code modularity 
    and maintainability.

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
