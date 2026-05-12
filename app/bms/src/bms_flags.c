/* ************************************************************************** */
/** BMS System Flags Management

  @Company
    UPMRacing - Adrián Pérez López - LV

  @File Name
    bms_flags.c

  @Summary
    Module responsible for managing BMS error, warning and status flags.

  @Description
    This module implements the management of the internal status registers
    used by the Battery Management System (BMS) firmware.

    The BMS uses three global 32-bit registers to represent the system state:

        - bms_error_flags
        - bms_warning_flags
        - bms_status_flags

    Each bit within these registers represents a specific condition detected
    by the system, such as protection faults, warning states or operational
    information.

    These flags are used throughout the firmware to communicate the system
    state between different modules. For example, protection mechanisms,
    monitoring tasks and diagnostic interfaces can read or modify these
    registers to react accordingly.

    The module provides a centralized mechanism for setting, clearing and
    querying flags, improving code readability and ensuring consistent flag
    handling across the firmware.

    The flag registers are also used by other modules such as the diagnostic
    LED state machine and the UART command line interface to provide real-time
    debugging information.

    Key features:
        - Centralized system state representation
        - Lightweight implementation using bitwise operations
        - Supports up to 32 flags per register
        - Efficient communication between firmware modules
        - Suitable for real-time embedded environments

 */
/* ************************************************************************** */

#include "bms_flags.h"

volatile BMS_Flags_t bms_error_flags = 0;
volatile BMS_Flags_t bms_warning_flags = 0;
volatile BMS_Flags_t bms_status_flags = 0;
    