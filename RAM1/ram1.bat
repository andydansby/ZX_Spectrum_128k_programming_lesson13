@cd codemaps
@	del ram1.o
@cd ..

@rem this creates an object file
zcc +zx -vn -SO3 -c -clib=new -pragma-include:zpragma.inc -o RAM1.o --fsigned-char @ram1.lst

@if not exist "RAM1.o" (
call error.bat
)

@copy "ram1.o" "..\"
@move "ram1.o" "codemaps\"

@REM Cleanup
del zcc_opt.def

del hotrod1.zx0
del hotrod2.zx0
del hotrod3.zx0
del hotrod4.zx0

@REM a nice map view
@cd codemaps
@	echo on
	@REM all these objects match up
	z80nm ram1.o
	z80nm ram1.o > ram1.txt
	@copy "ram1.txt" "..\"
	@echo off
@cd ..

@call beep.bat
