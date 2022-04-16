rem attention new
pasmo bankswitcher.asm bankswitcher.bin
bin2tap -o bankSW.tap -a 32768 bankswitcher.bin
move "bankSW.tap" "..\magic"
del "bankswitcher.bin"