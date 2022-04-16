@cd codemaps
@	del ram6.o
@cd ..

@rem this creates an object file
zcc +zx -vn -SO3 -c -clib=new -pragma-include:zpragma.inc -o RAM6.o --fsigned-char @ram6.lst

@if not exist "RAM6.o" (
call error.bat
)

@copy "ram6.o" "..\"
@move "ram6.o" "codemaps\"

@REM Cleanup
@del zcc_opt.def
@del hotrod7.zx0

REM a nice map view
cd codemaps
	echo on
	@REM all these objects match up
	z80nm ram6.o
	z80nm ram6.o > ram6.txt
	copy "ram6.txt" "..\"
	echo off
cd ..

@call beep.bat