@cd codemaps
@	del ram3.o
@cd ..

@rem this creates an object file
zcc +zx -vn -SO3 -c -clib=new -pragma-include:zpragma.inc -o RAM3.o --fsigned-char @ram3.lst

@if not exist "RAM3.o" (
call error.bat
)

@copy "ram3.o" "..\"
@move "ram3.o" "codemaps\"

@REM Cleanup
@del zcc_opt.def
@del hotrod5.zx0

@REM a nice map view
@cd codemaps
@	echo on
	@REM all these objects match up
	z80nm ram3.o
	z80nm ram3.o > ram3.txt
@	copy "ram3.txt" "..\"
@	echo off
@cd ..

@call beep.bat