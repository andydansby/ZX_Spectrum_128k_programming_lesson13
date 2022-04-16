@cd codemaps
@	del uncontended.o
@cd ..

@rem this creates an object file
zcc +zx -vn -SO3 -c -clib=new -o uncontended.o --fsigned-char @ramMain.lst

@if not exist "uncontended.o" (
call error.bat
)

@copy "uncontended.o" "..\"
@move "uncontended.o" "codemaps\"


@REM Cleanup
@del zcc_opt.def

REM a nice map view
@cd codemaps
@	echo on
	@REM all these objects match up
	z80nm uncontended.o
	z80nm uncontended.o > uncontended.txt
	copy "uncontended.txt" "..\"
@	echo off
@cd ..


@call beep.bat
