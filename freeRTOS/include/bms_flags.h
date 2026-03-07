/* ************************************************************************** */
/** Error Flags Module
  @Company
    UPMRacing - Adrián Pérez López - LV
  @Summary
    Definition and manipulation of BMS flags.
*/
/* ************************************************************************** */

#ifndef _BMS_FLAGS_H_
#define _BMS_FLAGS_H_
#include <stdint.h>
    

    /* Flag type definition */
    typedef uint32_t BMS_Flags_t;

    /* Global flag registers */
    extern volatile BMS_Flags_t bms_error_flags;
    extern volatile BMS_Flags_t bms_warning_flags;
    extern volatile BMS_Flags_t bms_status_flags;
        
    /* Definition of error flags (up to 32 flags) */
    #define BMS_ERR_OVERVOLTAGE      (1U << 0)
    #define BMS_ERR_UNDERVOLTAGE     (1U << 1)
    #define BMS_ERR_OVERTEMP         (1U << 2)
    #define BMS_ERR_UNDERTEMP        (1U << 3)
    #define BMS_ERR_CAN_TIMEOUT      (1U << 4)
    #define BMS_ERR_ADC_FAIL         (1U << 5)
    
    /* Definition of warning flags (up to 32 flags) */
    #define BMS_WARN_CELL_IMBALANCE  (1U << 0)
    #define BMS_WARN_HIGH_CURRENT    (1U << 1)
    #define BMS_WARN_TEMP_RISING     (1U << 2)
    #define BMS_WARN_LOW_SOC         (1U << 3)
    
    /* Definition of status flags (up to 32 flags)*/
    #define BMS_STATUS_CHARGING      (1U << 0)
    #define BMS_STATUS_DISCHARGING   (1U << 1)
    #define BMS_STATUS_BALANCING     (1U << 2)
    #define BMS_STATUS_IDLE          (1U << 3)
    #define BMS_STATUS_READY         (1U << 4)
    

    /* Macros to set, clear and check flags */
    #define BMS_SET_FLAG(REG, FLAG)        ((REG) |= (FLAG))
    #define BMS_CLEAR_FLAG(REG, FLAG)      ((REG) &= ~(FLAG))
    #define BMS_CHECK_FLAG(REG, FLAG)      (((REG) & (FLAG)) != 0U)
    /* Mainly for debugging */
    #define BMS_TOGGLE_FLAG(REG, FLAG) ((REG) ^= (FLAG))
    
    /* Macro to clear all flags */
    #define BMS_CLEAR_ALL_FLAGS(REG)       ((REG) = 0U)
    /* Macro to detect any error*/
    #define BMS_HAS_ERROR()        (bms_error_flags != 0U)
    /* Macro to detect any warning*/
    #define BMS_HAS_WARNING()      (bms_warning_flags != 0U)

    /* Macro to detect system status */
    #define BMS_IS_CHARGING()      (BMS_CHECK_FLAG(bms_status_flags, BMS_STATUS_CHARGING))
    #define BMS_IS_DISCHARGING()   (BMS_CHECK_FLAG(bms_status_flags, BMS_STATUS_DISCHARGING))

#endif /* _BMS_FLAGS_H_ */

/* *****************************************************************************
 End of File
 */