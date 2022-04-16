@rem copy /b compiled_UNCONTENDED.bin + compiled_CODE.bin  UNCONTENDED.bin
@rem appmake +zx -b UNCONTENDED.bin -o uncontended.tap --org 32768 --noloader --blockname uncontended

appmake +zx -b compiled_CODE.bin -o uncontended.tap --org 32768 --noloader --blockname uncontended


appmake +zx -b compiled_IM2_VECTOR_PLACEMENT.bin -o im2vector.tap --org 48573 --noloader --blockname im2vector


appmake +zx -b compiled_CONTENDED.bin -o contended.tap --org 24290 --noloader --blockname contended

rem ok
appmake +zx -b compiled_BANK_00.bin -o bank00.tap --org 49152 --noloader --blockname bank00
appmake +zx -b compiled_BANK_01.bin -o bank01.tap --org 49152 --noloader --blockname bank01
appmake +zx -b compiled_BANK_03.bin -o bank03.tap --org 49152 --noloader --blockname bank03
appmake +zx -b compiled_BANK_04.bin -o bank04.tap --org 49152 --noloader --blockname bank04
appmake +zx -b compiled_BANK_06.bin -o bank06.tap --org 49152 --noloader --blockname bank06


bas2tap -a1 -s128K loader.bas basloader.tap

rem attention new
@copy /b basloader.tap + bankSW.tap + bank01.tap + bank03.tap + bank04.tap + bank06.tap + bank00.tap + contended.tap + uncontended.tap + im2vector.tap  1output.tap
rem attention new
@del "loader.bas"
@del "bank00.tap"
@del "bank01.tap"
@del "bank03.tap"
@del "bank04.tap"
@del "bank06.tap"
@del "uncontended.tap"
@del "contended.tap"
@del "bankSW.tap"

@del "im2vector.tap"

@move "compiled_BANK_00.bin" "bin\"
@move "compiled_BANK_01.bin" "bin\"
@move "compiled_BANK_03.bin" "bin\"
@move "compiled_BANK_04.bin" "bin\"
@move "compiled_BANK_06.bin" "bin\"
@move "compiled_CODE.bin" "bin\"
@move "compiled_CONTENDED.bin" "bin\"
@move "compiled_UNASSIGNED.bin" "bin\"
@move "compiled_IM2_VECTOR_PLACEMENT.bin" "bin\"
