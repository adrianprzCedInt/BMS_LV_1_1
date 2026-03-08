/** Error Flags Module

  @Company
    UPMRacing - Adrián Pérez López - LV

  @Summary
    Definition and manipulation of BMS status, warning and error flags.

  @Description
    This module defines the global flag registers used by the Battery
    Management System (BMS) to communicate system state across different
    firmware modules.

    Three independent 32-bit registers are used:

        bms_error_flags
            Stores critical faults that require immediate action.

        bms_warning_flags
            Stores non-critical conditions that should be monitored.

        bms_status_flags
            Represents the current operating mode of the BMS.

    Access to these registers is performed through macros to ensure
    safe and readable manipulation of individual bits.

    This design allows multiple modules (FSMs, diagnostics, CLI,
    communication stacks, etc.) to interact with the BMS state
    without tight coupling between components.
*/
#ifndef _BMS_FLAGS_H_
#define _BMS_FLAGS_H_
#include <stdint.h>
    

    /* Type used for all BMS flag registers (32-bit bitfield) */
    typedef uint32_t BMS_Flags_t;
    
    /* Global BMS flag registers.
       Declared as volatile because they may be modified by different
       modules or RTOS tasks. */
    extern volatile BMS_Flags_t bms_error_flags;
    extern volatile BMS_Flags_t bms_warning_flags;
    extern volatile BMS_Flags_t bms_status_flags;
    
    /* Definition of error flags */
    #define BMS_ERR_OVERVOLTAGE      (1U << 0)
    #define BMS_ERR_UNDERVOLTAGE     (1U << 1)
    #define BMS_ERR_OVERTEMP         (1U << 2)  
    #define BMS_ERR_UNDERTEMP        (1U << 3)
    #define BMS_ERR_CAN_TIMEOUT      (1U << 4)
    #define BMS_ERR_ADC_FAIL         (1U << 5)
    
    /* Definition of warning flags */
    #define BMS_WARN_CELL_IMBALANCE  (1U << 0)
    #define BMS_WARN_HIGH_CURRENT    (1U << 1)
    #define BMS_WARN_TEMP_RISING     (1U << 2)
    #define BMS_WARN_LOW_SOC         (1U << 3)
    
    /* Definition of BMS operating modes (mutually exclusive states) */
    #define BMS_STATUS_IDLE        (1U << 0)   // 0x01
    #define BMS_STATUS_DISCHARGING (1U << 1)   // 0x02
    #define BMS_STATUS_CHARGING    (1U << 2)   // 0x04
    #define BMS_STATUS_BALANCING   (1U << 3)   // 0x08
    #define BMS_STATUS_ERROR       (1U << 4)   // 0x10  

    /* Generic macros for bit manipulation of flag registers */
    /* Macros to set, clear and check flags */
    #define BMS_SET_FLAG(REG, FLAG)        do { (REG) |= (FLAG); } while(0)
    #define BMS_CLEAR_FLAG(REG, FLAG)      do { (REG) &= ~(FLAG); } while(0)
    #define BMS_TOGGLE_FLAG(REG, FLAG)     do { (REG) ^= (FLAG); } while(0)
    #define BMS_CHECK_FLAG(REG, FLAG)      (((REG) & (FLAG)) != 0U)

    
    /* Macro to clear all flags */
    #define BMS_CLEAR_ALL_FLAGS(REG)       ((REG) = 0U)
    /* Macro to detect any error*/
    #define BMS_HAS_ERROR()        (bms_error_flags != 0U)
    /* Macro to detect any warning*/
    #define BMS_HAS_WARNING()      (bms_warning_flags != 0U)

    
    /* -------------------------------------------------------------------------- */
    /* ERROR / WARNING FLAG HELPERS                                               */
    /* -------------------------------------------------------------------------- */
    #define BMS_SET_ERROR_FLAG(FLAG)     BMS_SET_FLAG(bms_error_flags, FLAG)
    #define BMS_CLEAR_ERROR_FLAG(FLAG)   BMS_CLEAR_FLAG(bms_error_flags, FLAG)

    #define BMS_SET_WARNING_FLAG(FLAG)   BMS_SET_FLAG(bms_warning_flags, FLAG)
    #define BMS_CLEAR_WARNING_FLAG(FLAG) BMS_CLEAR_FLAG(bms_warning_flags, FLAG)
    
    /* -------------------------------------------------------------------------- */
    /* STATUS FLAG HELPERS                                                        */
    /* -------------------------------------------------------------------------- */   
    
    /* Clears the current BMS operating state.
       Only one status flag should be active at any time. */
    #define BMS_CLEAR_STATUS()      (bms_status_flags = 0U)
    /* Macro to detect system status */
    #define BMS_IS_IDLE()          (BMS_CHECK_FLAG(bms_status_flags, BMS_STATUS_IDLE))
    #define BMS_IS_DISCHARGING()   (BMS_CHECK_FLAG(bms_status_flags, BMS_STATUS_DISCHARGING))
    #define BMS_IS_CHARGING()      (BMS_CHECK_FLAG(bms_status_flags, BMS_STATUS_CHARGING))
    #define BMS_IS_BALANCING()     (BMS_CHECK_FLAG(bms_status_flags, BMS_STATUS_BALANCING))
    #define BMS_IS_ERROR()         (BMS_CHECK_FLAG(bms_status_flags, BMS_STATUS_ERROR))
    
    /* Macros to change BMS status flags*/
    #define BMS_SET_IDLE()        do { BMS_CLEAR_STATUS(); BMS_SET_FLAG(bms_status_flags, BMS_STATUS_IDLE); } while(0)
    #define BMS_SET_DISCHARGING() do { BMS_CLEAR_STATUS(); BMS_SET_FLAG(bms_status_flags, BMS_STATUS_DISCHARGING); } while(0)
    #define BMS_SET_CHARGING()    do { BMS_CLEAR_STATUS(); BMS_SET_FLAG(bms_status_flags, BMS_STATUS_CHARGING); } while(0)
    #define BMS_SET_BALANCING()   do { BMS_CLEAR_STATUS(); BMS_SET_FLAG(bms_status_flags, BMS_STATUS_BALANCING); } while(0)
    #define BMS_SET_ERROR()       do { BMS_CLEAR_STATUS(); BMS_SET_FLAG(bms_status_flags, BMS_STATUS_ERROR); } while(0)
#endif /* _BMS_FLAGS_H_ */

/* *****************************************************************************
 End of File
 */