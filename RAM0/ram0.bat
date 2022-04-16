
@cd codemaps
@	del ram0.o
@cd ..
echo on
rem RAM0

rem attention new
cd songs

pasmo song1_compile.asm music1.bin
pasmo song2_compile.asm music2.bin
zx0_V2 -f music1.bin music1.zx0
zx0_V2 -f music2.bin music2.zx0

move music1.zx0 "..\"
move music2.zx0 "..\"

cd ..

@rem this creates an object file
zcc +zx -vn -SO3 -c -clib=new -pragma-include:zpragma.inc -o RAM0.o --fsigned-char @ram0.lst


@if not exist "RAM0.o" (
call error.bat
)

@copy "ram0.o" "..\"
@move "ram0.o" "codemaps\"

@REM Cleanup
@ del zcc_opt.def
@rem  del "cheapsunglasses.zx0"

REM a nice map view
@cd codemaps
	@REM all these objects match up
	z80nm ram0.o
	z80nm ram0.o > ram0.txt
	@copy "ram0.txt" "..\"
	@echo off
@cd ..

@call beep.bat


