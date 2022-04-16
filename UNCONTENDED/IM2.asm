;; MUST go in UNCONTENDED RAM
;;this is specifically for the IM2 operation


;;The ULA bug which causes snow when I is set to point
;;to contended memory still occurs, and also appears
;;to crash the machine shortly after I is set to point
;;to contended memory.
;;This means ISR CANNOT BE IN CONTENDED MEMORY!!

;; On the Spectrum 128, interrupt vectors may only
;; be placed between $80ff and $beff inclusive.
;; An interrupt routing itself must exist wholly
;; between 4000 and $BFFF.
;; This is because address $c000 to $ffff are pageabe
;; and should an interrupt occur while the
;; wrong 16k RAM is paged in, you will get a crash.

SECTION IM2_VECTOR_PLACEMENT;#BE00 to #BF01

;;attention new
;extern _VT_PLAY
extern _PLY_AKG_Play

;$BDBD
PUBLIC _IM2_PUSH_POP    ;this needs to be at $BDBD
_IM2_PUSH_POP:
    di
    push AF
    push BC
    push DE
    push HL
    push IX
    exx
    ex af, af
    push AF
    push BC
    push DE
    push HL
    push IY
        ;attention new
        call _PLY_AKG_Play
        ;attention new
    pop IY
    pop HL
    pop DE
    pop BC
    pop AF
    exx
    ex af, af
    pop IX
    pop HL
    pop DE
    pop BC
    pop AF
    ei
reti

;#BDDF
PUBLIC _SETUP_IM2
_SETUP_IM2:
    di
    ld HL, _IM2_VECTOR  ; loads the HL with the address of the IM2 Vector
    ld A, H             ; places that value in the A register
    ld I, A             ; now the I register has the vector address
    im 2                ; turn on the interrupt manager 2
    ei
ret

;$BDBD
PUBLIC NOP_OP
NOP_OP:
; series of NOP's to fill in until _IM2_VECTOR is $bebe
;NOTE   There are 22 bytes here available for
;variable placements, short routines, etc
;;Might be a nice Place to put
;;in some BANKSWITCHING CODE, hint hint
nop ;1
nop ;2
nop ;3
nop ;4
nop ;5
nop ;6


PUBLIC _bank_switch
_bank_switch:
    di
    ;ld  L, (_bank)
    ld  A,(0x5b5c)      ;Previous value of port
    and 0xf8

    ;unsigned char passed via __FASTCALL__ are pushed as L of HL
    or  L           ;or  _bank   Select bank

    ld BC,0x7ffd
    ld (0x5b5c),A
    out (C),A
    ;ei
ret


;;THIS is our IM2 Vector
PUBLIC _IM2_VECTOR;this needs to be at BE00
_IM2_VECTOR:
;;repeat 129 times
defw _IM2_PUSH_POP  ;1
defw _IM2_PUSH_POP  ;2
defw _IM2_PUSH_POP  ;3
defw _IM2_PUSH_POP  ;4
defw _IM2_PUSH_POP  ;5
defw _IM2_PUSH_POP  ;6
defw _IM2_PUSH_POP  ;7
defw _IM2_PUSH_POP  ;8
defw _IM2_PUSH_POP  ;9
defw _IM2_PUSH_POP  ;10
defw _IM2_PUSH_POP  ;11
defw _IM2_PUSH_POP  ;12
defw _IM2_PUSH_POP  ;13
defw _IM2_PUSH_POP  ;14
defw _IM2_PUSH_POP  ;15
defw _IM2_PUSH_POP  ;16
defw _IM2_PUSH_POP  ;17
defw _IM2_PUSH_POP  ;18
defw _IM2_PUSH_POP  ;19
defw _IM2_PUSH_POP  ;20
defw _IM2_PUSH_POP  ;21
defw _IM2_PUSH_POP  ;22
defw _IM2_PUSH_POP  ;23
defw _IM2_PUSH_POP  ;24
defw _IM2_PUSH_POP  ;25
defw _IM2_PUSH_POP  ;26
defw _IM2_PUSH_POP  ;27
defw _IM2_PUSH_POP  ;28
defw _IM2_PUSH_POP  ;29
defw _IM2_PUSH_POP  ;30
defw _IM2_PUSH_POP  ;31
defw _IM2_PUSH_POP  ;32
defw _IM2_PUSH_POP  ;33
defw _IM2_PUSH_POP  ;34
defw _IM2_PUSH_POP  ;35
defw _IM2_PUSH_POP  ;36
defw _IM2_PUSH_POP  ;37
defw _IM2_PUSH_POP  ;38
defw _IM2_PUSH_POP  ;39
defw _IM2_PUSH_POP  ;40
defw _IM2_PUSH_POP  ;41
defw _IM2_PUSH_POP  ;42
defw _IM2_PUSH_POP  ;43
defw _IM2_PUSH_POP  ;44
defw _IM2_PUSH_POP  ;45
defw _IM2_PUSH_POP  ;46
defw _IM2_PUSH_POP  ;47
defw _IM2_PUSH_POP  ;48
defw _IM2_PUSH_POP  ;49
defw _IM2_PUSH_POP  ;50
defw _IM2_PUSH_POP  ;51
defw _IM2_PUSH_POP  ;52
defw _IM2_PUSH_POP  ;53
defw _IM2_PUSH_POP  ;54
defw _IM2_PUSH_POP  ;55
defw _IM2_PUSH_POP  ;56
defw _IM2_PUSH_POP  ;57
defw _IM2_PUSH_POP  ;58
defw _IM2_PUSH_POP  ;59
defw _IM2_PUSH_POP  ;60
defw _IM2_PUSH_POP  ;61
defw _IM2_PUSH_POP  ;62
defw _IM2_PUSH_POP  ;63
defw _IM2_PUSH_POP  ;64
defw _IM2_PUSH_POP  ;65
defw _IM2_PUSH_POP  ;66
defw _IM2_PUSH_POP  ;67
defw _IM2_PUSH_POP  ;68
defw _IM2_PUSH_POP  ;69
defw _IM2_PUSH_POP  ;70
defw _IM2_PUSH_POP  ;71
defw _IM2_PUSH_POP  ;72
defw _IM2_PUSH_POP  ;73
defw _IM2_PUSH_POP  ;74
defw _IM2_PUSH_POP  ;75
defw _IM2_PUSH_POP  ;76
defw _IM2_PUSH_POP  ;77
defw _IM2_PUSH_POP  ;78
defw _IM2_PUSH_POP  ;79
defw _IM2_PUSH_POP  ;80
defw _IM2_PUSH_POP  ;81
defw _IM2_PUSH_POP  ;82
defw _IM2_PUSH_POP  ;83
defw _IM2_PUSH_POP  ;84
defw _IM2_PUSH_POP  ;85
defw _IM2_PUSH_POP  ;86
defw _IM2_PUSH_POP  ;87
defw _IM2_PUSH_POP  ;88
defw _IM2_PUSH_POP  ;89
defw _IM2_PUSH_POP  ;90
defw _IM2_PUSH_POP  ;91
defw _IM2_PUSH_POP  ;92
defw _IM2_PUSH_POP  ;93
defw _IM2_PUSH_POP  ;94
defw _IM2_PUSH_POP  ;95
defw _IM2_PUSH_POP  ;96
defw _IM2_PUSH_POP  ;97
defw _IM2_PUSH_POP  ;98
defw _IM2_PUSH_POP  ;99
defw _IM2_PUSH_POP  ;100
defw _IM2_PUSH_POP  ;101
defw _IM2_PUSH_POP  ;102
defw _IM2_PUSH_POP  ;103
defw _IM2_PUSH_POP  ;104
defw _IM2_PUSH_POP  ;105
defw _IM2_PUSH_POP  ;106
defw _IM2_PUSH_POP  ;107
defw _IM2_PUSH_POP  ;108
defw _IM2_PUSH_POP  ;109
defw _IM2_PUSH_POP  ;110
defw _IM2_PUSH_POP  ;111
defw _IM2_PUSH_POP  ;112
defw _IM2_PUSH_POP  ;113
defw _IM2_PUSH_POP  ;114
defw _IM2_PUSH_POP  ;115
defw _IM2_PUSH_POP  ;116
defw _IM2_PUSH_POP  ;117
defw _IM2_PUSH_POP  ;118
defw _IM2_PUSH_POP  ;119
defw _IM2_PUSH_POP  ;120
defw _IM2_PUSH_POP  ;121
defw _IM2_PUSH_POP  ;122
defw _IM2_PUSH_POP  ;123
defw _IM2_PUSH_POP  ;124
defw _IM2_PUSH_POP  ;125
defw _IM2_PUSH_POP  ;126
defw _IM2_PUSH_POP  ;127
defw _IM2_PUSH_POP  ;128
defw _IM2_PUSH_POP  ;129    defb

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;SECTION IM2_PUSH_POP_PLACEMENT
;; NO ROUTINES above this
; as they might eat into your STACK
; and BAD things will happen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; ATTENTION - NO MORE ASM AFTER THIS
;; WE NOW ONLY HAVE 253 BYTES (0xFD BYTES)
;; to the top of this memory section

; as it is programmed right now $BF0A to $BFFF
; FD (253) Bytes is stack size
; $BF0A - $BFFF is STACK
; 48895 - 49151 = stack

; LEAVE BLANK AT END

