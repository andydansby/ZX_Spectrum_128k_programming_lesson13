// using sccz80 1.99c

// assembly files are in ramlow.asm as
// indicated by ramlow.lst
//#pragma output CRT_ORG_CODE = 24000

//CONTENDED RAM

//You can also place ASSEMBLY VARIABLES in this area
// and force every thing below to be in that SECTION

//if __naked is before any custom headers
//it will set everything below it to be
//in the correct memory SECTION

static void naked_contendedRam() __naked
{
__asm
    SECTION CONTENDED
__endasm;
}

//we are just putting functions here
#include "variables.h"
#include "externs.h"
#include "routines.h"



// do not have main() here at all since we are just compiling to object files
//we are just putting functions here

//IMPORTANT need to have blank line at very end
