/* ************************************************************************** */
/** BMS Error LED State Machine

  @Company
    UPMRacing - Adrián Pérez López - LV

  @File Name
    fsm_error_leds.h

  @Summary
    Finite State Machine used to display BMS error codes using four LEDs.
 * 
 */
/* ************************************************************************** */

#ifndef _ERROR_LEDS_H_    /* Guard against multiple inclusion */
#define _ERROR_LEDS_H_

    //======================================
    // External variables
    //======================================
    extern fsm_trans_t fsm_error_leds_tt[];
    fsm_t* fsm_system_error_led_new(void);
    //void fsm_error_led_task(void* arguments)

    
#endif /* _EXAMPLE_FILE_NAME_H */

/* *****************************************************************************
 End of File
 */
