
ORG 0x8181

	;Dummy interrupt service routine.
	ei
	ret

START:
	di
    ld hl, 0x8000	;attention
    ld a,h
    ld i,a
    im 2
    inc a

Im2FillLut:
	ld (hl),a	;Fills the IM2 LUT with #81.
	inc l		;All INT will jump to #8181.
	jr nz,Im2FillLut
	inc h
	ld (hl),a
	
	ld sp,$
        
	;Initializes the music.
	ld hl,Music
	xor a                                   ;Subsong 0.
	call PLY_AKG_Init
        
	ei

	;Waits for the ~50Hz interrupt.
MainLoop:
	halt

	;Waits for the electron beam to be in the upper border.
	djnz $
	djnz $

	;Changes the border color to white.
	ld bc,#fe
	ld a,7
	out (c),a

	;Plays one frame of the music.
	call PLY_AKG_Play
        
	;Changes the border color to black.
	ld bc,#fe
	xor a
	out (c),a
        
	jr MainLoop

Player:
	;Selects the hardware. Mandatory, as Amstrad CPC is default.
	PLY_AKG_HARDWARE_SPECTRUM = 1
        
	;Want a ROM player (a player without automodification)?
	;PLY_AKG_Rom = 1	;Must be set BEFORE the player is included.
	;PLY_AKG_ROM_Buffer = #4000; (or wherever).
	;PLY_AKG_ROM_Buffer must be used to store data 
	;for ROM version
	
	;;attention, I'm going to have to address ROM player at some point
	
	include "1PlayerAkg.asm"; attention, going to eventually place player in seperate ASM file
	
Music:
	;What music to play?
	include "music.asm"
	
	
	
	
	