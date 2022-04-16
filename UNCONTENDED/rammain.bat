rem compile to a TAP file

rem ----------------------------------------------------
zcc +zx -v -m -startup=30 -clib=new ramALL.o -o compiled -pragma-include:zpragma.inc
rem ----------------------------------------------------



@rem have at the end
@call cleanup.bat
@call beep.bat
