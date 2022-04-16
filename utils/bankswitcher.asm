;Bank Switcher
; written by Ast A. Moore on Spectrum Computing
;runs from 32768-32793

;;attention new

org 32768       ;
memory_to_change:
	defb 0

org 32770       ;
	ld a, (memory_to_change)
	ld b, a
	ld A, (#5B5C)   ; in 5B5C is the current memory page

	and $F8
	or b

	ld ($5B5C), A   ; you have to preserve it, or BASIC goes crazy

	ld BC, $7FFD

	di              ;condom on
	ld (23388),a	;write new value back to sys. var
	out (c),a       ;and to port
	ei              ;condom off
ret                 ;we should be back in BASIC now


;reset = 7
;23388 = 7 = 0000 0111

;and 1111 1000 = 248
