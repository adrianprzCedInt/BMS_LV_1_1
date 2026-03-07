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
