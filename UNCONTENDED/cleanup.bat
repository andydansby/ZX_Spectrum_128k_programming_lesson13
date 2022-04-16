
@copy "compiled_BANK_00.bin" "..\magic\"
@copy "compiled_BANK_01.bin" "..\magic\"
@copy "compiled_BANK_03.bin" "..\magic\"
@copy "compiled_BANK_04.bin" "..\magic\"
@copy "compiled_BANK_06.bin" "..\magic\"

@copy "compiled_CODE.bin" "..\magic\"
@copy "compiled_UNASSIGNED.bin" "..\magic\"
@rem copy "compiled_UNCONTENDED.bin" "..\magic\"
@copy "compiled_CONTENDED.bin" "..\magic\"
@copy "compiled_IM2_VECTOR_PLACEMENT.bin" "..\magic\"


@move "compiled_BANK_00.bin" "binaries\"
@move "compiled_BANK_01.bin" "binaries\"
@move "compiled_BANK_03.bin" "binaries\"
@move "compiled_BANK_04.bin" "binaries\"
@move "compiled_BANK_06.bin" "binaries\"

@move "compiled_CODE.bin" "binaries\"
@move "compiled_UNASSIGNED.bin" "binaries\"
@move "compiled_CONTENDED.bin" "binaries\"
@move "compiled_IM2_VECTOR_PLACEMENT.bin" "binaries\"

@move "ramALL.o" "binaries\"

@copy "compiled.map" "..\"
@move "compiled.map" "codemaps\"
@del "zcc_opt.def"
