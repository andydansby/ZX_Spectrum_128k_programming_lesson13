// using sccz80 1.99c

// assembly files are in ram0Z.asm as
// indicated by ramMain.lst

// this has been pushed to zpragma.inc
//#pragma output CRT_ORG_CODE = 49152

//be sure to bank to this slot if you
//plan on using other banks

//we are just putting functions here

//PLACE ASSEMBLY VARIABLES HERE
//HAVE AT LEAST ONE VARIABLE DEFINED AS AN ASM VARIABLE

//if this is before any custom headers
//it will set everything below it to be
//in the correct memory slot


static void naked_placement_in_RAM0(void) __naked
{
__asm
    SECTION BANK_00
__endasm
}



#include "externs.h"
#include "variables.h"
#include "ram0.h"

// do not have main() here at all since
// we are just compiling to object files
// you will get a RET inserted automatically



//must have blank line at end
