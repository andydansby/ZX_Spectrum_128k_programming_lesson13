rem combine all object files

@if not exist "contended.o" (
call error.bat
)
@if not exist "RAM0.o" (
call error.bat
)
@if not exist "RAM1.o" (
call error.bat
)
@if not exist "RAM3.o" (
call error.bat
)
@if not exist "RAM4.o" (
rem call error.bat
)
@if not exist "RAM6.o" (
rem call error.bat
)
@if not exist "uncontended.o" (
call error.bat
)


z80asm --output=ramALL.o RAM1.o RAM3.o RAM4.o RAM6.o RAM0.o contended.o uncontended.o

@if not exist "ramALL.o" (
call error.bat
)

z80nm ramALL.o > ramALL.txt
	@rem output.txt will have the listing of routines

REM move the object file created above into the RAMMAIN directory to compile the test.c file
@copy "ramALL.o" "..\UNCONTENDED\"
