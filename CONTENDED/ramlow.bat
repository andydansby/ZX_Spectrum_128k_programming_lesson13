@cd codemaps
@	del contended.o
@cd ..

@rem this creates an object file
zcc +zx -vn -SO3 -c -clib=new --fsigned-char -o contended.o @ramlow.lst

@if not exist "contended.o" (
call error.bat
)

@copy "contended.o" "..\"
@move "contended.o" "codemaps\"

@REM Cleanup
@del zcc_opt.def

@REM a nice map view
@cd codemaps
@	echo on
	@REM all these objects match up
	z80nm contended.o
@	z80nm contended.o > contended.txt
@	copy "contended.txt" "..\"
@	echo off
@cd ..

@call beep.bat
