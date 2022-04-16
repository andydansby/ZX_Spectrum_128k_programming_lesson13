;10 cls
;20 clear 33152					$8180
;30 load "" code 33153			$8181
;40 randomize usr 33155			#8183

;set breakpoint @ $819A		call setup
;set breakpoint @ $81AA		call play
;set breakpoint @ $81BE		setup
;set breakpoint @ $8283		play

;	ORG #8000
ORG 0x8181

	;Dummy interrupt service routine.
	ei
ret

START:					;$8183
	di
    ld hl, 0x8000	;attention
    ld a,h
    ld i,a
    im 2
    inc a

Im2FillLut:				;$818D
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
MainLoop:				;$819E
	halt
;Waits for the electron beam to be in the upper border.
	djnz $
	djnz $

;Changes the border color to white.
	ld bc, $fe
	ld a,7
	out (c),a

;Plays one frame of the music.
	call PLY_AKG_Play
        
;Changes the border color to black.
	ld bc, $fe
	xor a
	out (c),a
        
jr MainLoop

Player:
	;Selects the hardware. Mandatory, as Amstrad CPC is default.
	;PLY_AKG_HARDWARE_SPECTRUM = 1


SECTION PLAYER
	ORG $c000
	include "1PlayerAkg.asm"; attention, going to eventually place player in seperate ASM file

SECTION MUSIC
	;ORG PLAYER + 0B90
Music:
	;What music to play?
	;include "music.asm"
	;include "music1.asm"
	include "music3.asm"