/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.c

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#include <stddef.h>
#include "fsm.h"


// Definition of the states
enum semp_state {
  UNO,
  DOS,
  TRES,
};

// Transitions functions, NOT ACTIONS JUST CHECK VALUES

static int cuenta (fsm_t* this)
  {
    return 1;
  }



//Actions in transitions
static void func_uno (fsm_t* this)
{
  printf("Estoy en 1\n");
} 




// Explicit FSM description
static fsm_trans_t semp[] = {
  { UNO,     cuenta,    DOS,   func_uno  },
  { UNO,     cuenta,    UNO,   func_uno  },
  { DOS,     cuenta,    TRES,  func_uno  },
  { TRES,    cuenta,    UNO,   func_uno  },
  { -1,      NULL,      -1,    NULL      },
  };
