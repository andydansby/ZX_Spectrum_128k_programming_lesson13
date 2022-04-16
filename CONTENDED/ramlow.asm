;; CONTENDED

;;contended memory from 24200-32767
;;8167 bytes total

;;The ULA bug which causes snow when I is set to point to contended memory still occurs, and also appears to crash the machine shortly after I is set to point to contended memory.
;;This means ISR CANNOT BE IN CONTENDED MEMORY!!!

;;__fastcall__ fastcall
;; Fastcall linkage allows one parameter
;; to be passed by register in a subset of DEHL.
;; So if the parameter is 8-bit, the value will
;; be in L.  If the parameter is 16-bit,
;; the value is in HL and if it is
;; 32-bit the value is in DEHL.

;; On the Spectrum 128, interrupt vectors may only
;; be placed between $80ff and $beff inclusive.
;; An interrupt routing itself must exist wholly
;; between 4000 and $BFFF.
;; This is because address $c000 to $ffff are pageabe
;; and should an interrupt occur while the
;; wrong 16k RAM is paged in, you will get a crash.

SECTION CONTENDED

PUBLIC _Variable_in_contended
_Variable_in_contended:
    defb 33

