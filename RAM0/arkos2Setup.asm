extern _BUFFER_UNCOMP
extern _TABLA_SONG_CMP
extern _PLY_AKG_Start
extern _PLY_AKG_Init
extern _akg_song
extern _endBuffer

; --------------------------------------------
; ZX0 decoder by Einar Saukas & Urusergi
; "Standard" version (68 bytes only)
; --------------------------------------------
; Parameters:
;   HL: source address (compressed data)
;   DE: destination address (decompressing)
; --------------------------------------------
;$cb90
dzx0_standard:
        ld      bc, $ffff               ; preserve default offset 1
        push    bc
        inc     bc
        ld      a, $80
dzx0s_literals:
        call    dzx0s_elias             ; obtain length
        ldir                            ; copy literals
        add     a, a                    ; copy from last offset or new offset?
        jr      c, dzx0s_new_offset
        call    dzx0s_elias             ; obtain length
dzx0s_copy:
        ex      (sp), hl                ; preserve source, restore offset
        push    hl                      ; preserve offset
        add     hl, de                  ; calculate destination - offset
        ldir                            ; copy from offset
        pop     hl                      ; restore offset
        ex      (sp), hl                ; preserve offset, restore source
        add     a, a                    ; copy from literals or new offset?
        jr      nc, dzx0s_literals
dzx0s_new_offset:
        pop     bc                      ; discard last offset
        ld      c, $fe                  ; prepare negative offset
        call    dzx0s_elias_loop        ; obtain offset MSB
        inc     c
        ret     z                       ; check end marker
        ld      b, c
        ld      c, (hl)                 ; obtain offset LSB
        inc     hl
        rr      b                       ; last offset bit becomes first length bit
        rr      c
        push    bc                      ; preserve new offset
        ld      bc, 1                   ; obtain length
        call    nc, dzx0s_elias_backtrack
        inc     bc
        jr      dzx0s_copy
dzx0s_elias:
        inc     c                       ; interlaced Elias gamma coding
dzx0s_elias_loop:
        add     a, a
        jr      nz, dzx0s_elias_skip
        ld      a, (hl)                 ; load another group of 8 bits
        inc     hl
        rla
dzx0s_elias_skip:
        ret     c
dzx0s_elias_backtrack:
        add     a, a
        rl      c
        rl      b
        jr      dzx0s_elias_loop
; --------------------------------------------
zx0_end:


; --------------------------------------------
;EXTRACT A WORD FROM A TABLE
;IN:(HL)=ADDRESS TABLE
;   (A)= POSITION
;OUT(HL)=WORD
; --------------------------------------------
;$CBD4
EXT_WORD:
    LD D,0
	RLCA
	LD E,A
	ADD HL,DE
	LD E,(HL)
	INC HL
	LD D,(HL)
	EX DE,HL
RET
; --------------------------------------------

;$CBDE
PUBLIC _UNCOMP_SONG
_UNCOMP_SONG:

;_BUFFER_UNCOMP = $CBFD = where song is decompressed to
;song0      =   $E0C6
    ;input HL for the song number 0 - x
    ld hl, _TABLA_SONG_CMP

	;which song to play
	;song number index starts at 0
	;ld a, 0    ld a, 1

;   EXT_WORD
;IN:(HL)=ADDRESS TABLE
;   (A)= POSITION
;OUT(HL)=WORD
	ld a, (_akg_song)
	call EXT_WORD

	;returns HL of where song is located in memory


;   ZX0
;   HL: source address (compressed data)
;   DE: destination address (decompressing)
; --------------------------------------------
	ld de, _BUFFER_UNCOMP

	;at this point we should see
	;a  = song number = 0 , 1
	;hl = zx0 compressed source = $E0C6 , $E519
	;de = buffer address = $CBFD

	call dzx0_standard
	;seems to decompress OK
ret

; --------------------------------------------
;$CBEE
PUBLIC _ARKOS2_Setup
_ARKOS2_Setup:

    push de
    push hl
    push bc
    push af

    call _UNCOMP_SONG

    ;   Initialize player
	;   Input:
	;   DE = song data address
	ld HL, _BUFFER_UNCOMP

    ld bc, $7FFD
    ;ld de, $0012
    xor a


    CALL _PLY_AKG_Init

    ;we need to reset some registers
    pop af
    pop bc
    pop hl
    pop de
ret


end_of_setup:

; player + decompressor + index = 3064 bytes
