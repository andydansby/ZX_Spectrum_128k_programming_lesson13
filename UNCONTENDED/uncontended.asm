;; UNCONTENDED

;SECTION UNCONTENDED

;;uncontended memory from 32768 to 49151
;; 16383 bytes total

;;__fastcall__ fastcall
;; Fastcall linkage allows one parameter
;; to be passed by register in a subset of DEHL.
;; So if the parameter is 8-bit, the value will
;; be in L.  If the parameter is 16-bit,
;; the value is in HL and if it is
;; 32-bit the value is in DEHL.

SECTION code_user
; assign read-only executable code to this section


; -------------------------
; ZX0 decoder by Einar Saukas & introspec
; "Turbo" version (128 bytes, 21% faster)
; VERSION 2
; -------------------------
; Parameters:
;   HL: source address (compressed data)
;   DE: destination address (decompressing)
; -------------------------
;attention new
PUBLIC _dzx0_turbo
_dzx0_turbo:
    ld hl, (_zx0_source)
    ld de, (_zx0_destination)
        ld      bc, $ffff               ; preserve default offset 1
        ld      (dzx0t_last_offset+1), bc
        inc     bc
        ld      a, $80
        jr      dzx0t_literals
dzx0t_new_offset:
        ld      c, $fe                  ; prepare negative offset
        add     a, a
        jp      nz, dzx0t_new_offset_skip
        ld      a, (hl)                 ; load another group of 8 bits
        inc     hl
        rla
dzx0t_new_offset_skip:
        call    nc, dzx0t_elias         ; obtain offset MSB
        inc     c
        ret     z                       ; check end marker
        ld      b, c
        ld      c, (hl)                 ; obtain offset LSB
        inc     hl
        rr      b                       ; last offset bit becomes first length bit
        rr      c
        ld      (dzx0t_last_offset+1), bc ; preserve new offset
        ld      bc, 1                   ; obtain length
        call    nc, dzx0t_elias
        inc     bc
dzx0t_copy:
        push    hl                      ; preserve source
dzx0t_last_offset:
        ld      hl, 0                   ; restore offset
        add     hl, de                  ; calculate destination - offset
        ldir                            ; copy from offset
        pop     hl                      ; restore source
        add     a, a                    ; copy from literals or new offset?
        jr      c, dzx0t_new_offset
dzx0t_literals:
        inc     c                       ; obtain length
        add     a, a
        jp      nz, dzx0t_literals_skip
        ld      a, (hl)                 ; load another group of 8 bits
        inc     hl
        rla
dzx0t_literals_skip:
        call    nc, dzx0t_elias
        ldir                            ; copy literals
        add     a, a                    ; copy from last offset or new offset?
        jr      c, dzx0t_new_offset
        inc     c                       ; obtain length
        add     a, a
        jp      nz, dzx0t_last_offset_skip
        ld      a, (hl)                 ; load another group of 8 bits
        inc     hl
        rla
dzx0t_last_offset_skip:
        call    nc, dzx0t_elias
        jp      dzx0t_copy
dzx0t_elias:
        add     a, a                    ; interlaced Elias gamma coding
        rl      c
        add     a, a
        jr      nc, dzx0t_elias
        ret     nz
        ld      a, (hl)                 ; load another group of 8 bits
        inc     hl
        rla
        ret     c
        add     a, a
        rl      c
        add     a, a
        ret     c
        add     a, a
        rl      c
        add     a, a
        ret     c
        add     a, a
        rl      c
        add     a, a
        ret     c
dzx0t_elias_loop:
        add     a, a
        rl      c
        rl      b
        add     a, a
        jr      nc, dzx0t_elias_loop
        ret     nz
        ld      a, (hl)                 ; load another group of 8 bits
        inc     hl
        rla
        jr      nc, dzx0t_elias_loop
ret
;----------------------------------

PUBLIC _border_Change_IM2
_border_Change_IM2:
    ld hl, (_ada)   ; loads L of HL with the variable ada
    ld a, l         ;
    and 7           ; mask with 0000 0111
    out ($FE),a
    ;;;
    inc a           ;; increment value
    ld (_ada), a    ; and update variable _ada
ret


;----------------------------------
PUBLIC _border_Change_uncontended
_border_Change_uncontended:
    ld a, l     ;contents of l are loaded into a
    out (254), a
ret
;----------------------------------


SECTION rodata_user
; assign read-only data to this section
;; Variables
;; define C variables here to force placement in memory
PUBLIC _xyzzy2
_xyzzy2:
    defb 254
;----------------------------------

SECTION smc_user
; assign self-modifying code to this section
;----------------------------------

SECTION data_user
; assign non-zero initial data to this section
;----------------------------------

SECTION bss_user
; assign zero initial data to this section
;----------------------------------
PUBLIC _zx0_source      ;attention new
    _zx0_source:
    defw 0

PUBLIC _zx0_destination ;attention new
    _zx0_destination:
    defw 0


PUBLIC _ada
    _ada:
    defb 0
;;;;;;;;
