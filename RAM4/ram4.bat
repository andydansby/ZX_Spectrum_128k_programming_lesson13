@cd codemaps
@	del ram4.o
@cd ..

@rem this creates an object file
zcc +zx -vn -SO3 -c -clib=new -pragma-include:zpragma.inc -o RAM4.o --fsigned-char @ram4.lst

@if not exist "RAM4.o" (
call error.bat
)

@copy "ram4.o" "..\"
@move "ram4.o" "codemaps\"

@REM Cleanup
del zcc_opt.def
del hotrod6.zx0 rem attention new

REM a nice map view
@cd codemaps
@	echo on
	@REM all these objects match up
	z80nm ram4.o
	z80nm ram4.o > ram4.txt
@	copy "ram4.txt" "..\"
@	echo off
@cd ..

@call beep.bat
