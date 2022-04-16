#ifndef EXTERNS_H
#define EXTERNS_H
//UNCONTENDED RAM


//VARIABLES
extern unsigned char Variable_in_contended;//found in ramlow.asm
extern unsigned char ada;//found in IM2.asm




//FUNCTIONS
/*
__fastcall__
 Fastcall linkage allows one parameter
 to be passed by register in a subset of DEHL.
 So if the parameter is 8-bit, the value will
 be in L.  If the parameter is 16-bit,
 the value is in HL and if it is
 32-bit the value is in DEHL.
*/

//found in ramlow > routines.h
extern unsigned char add_two_numbers (unsigned char a, unsigned char b);

//found in uncontended_section.asm
extern void __FASTCALL__ border_Change_uncontended(unsigned char color);

//attention new change how we call banks
//found in IM2.asm
extern void __FASTCALL__ bank_switch(unsigned char ramBank);
//__FASTCALL__ sends variable as HL


//found in RAM 0
//attention new
extern void __FASTCALL__ ARKOS2_Setup (void);
extern void __FASTCALL__ PLY_AKG_Init (void);
extern void __FASTCALL__ PLY_AKG_Play (void);
extern void __FASTCALL__ PLY_AKG_STOP (void);
extern unsigned char akg_song;//song number
//attention new




//found in RAM 1
extern unsigned char screen1[];
extern unsigned char screen2[];
extern unsigned char screen3[];
extern unsigned char screen4[];
//found in RAM 3
extern unsigned char screen5[];
//found in RAM 4
extern unsigned char screen6[];
//found in RAM 6
extern unsigned char screen7[];

//found in uncontended.asm
// hl = source
// de = destination
extern void __FASTCALL__ dzx0_turbo(void);
extern unsigned int zx0_source;
extern unsigned int zx0_destination;





;//attention new
//////////////////////////////////////////

//found in im2.asm
extern void __FASTCALL__ SETUP_IM2 (void);







#endif
