#include soko-prefix.bas
#include soko-where-do-you-want-to-begin.bas
#include soko-start-screen.bas
300 DIM HX%(50),HY%(50),Q%(32,19)
#include soko-sprite-4-create.bas
705 COLOR 6:LOCATE 32,18:PRINT "Press SPACE to start !"
710 A$=INPUT$(1)
720 IF A$=" " THEN W%=1:GOTO 740
730 GOTO 710
740 PRINT CHR$(12):REM CLS 3
750 GOSUB 990:REM ***  ***
760 X2=X:Y2=Y
#include soko-sprite-4-use.bas
1370 REM ****************************** COUNT FREE BOX PLACES *************
--- Megszámolja, hány olyan ponthely van, ami nem piros még
1380 Z=0:A=0
1390 IF HX%(A)=0 THEN GOTO 1430
--- Ha a koordináták zöldek, azaz láda van rajtuk. A POINT csa -1 vagy 0 lehet. -1, ha van rajta pont. Ezért olyan pontot vizsgálunk, ami csak akkor
--- van kigyujrva, ha láda van ott. Ez pedig a sprite (1,3)-as pontja
1400 IF POINT(HX%(A),HY%(A)+2)=0 OR POINT(HX%(A)+1,HY%(A)+2)=0 THEN Z=Z+1
1410 A=A+1
1420 GOTO 1390
--- G%: Level number [1-20)
--- W%: Próbálkozások száma [1-5]
--- A: box counter
--- Z: unplaced box counter
1430 IFZ=0ANDG%=20THEN COLOR7:LOCATE8,9:PRINT"** CONGRATULATION **":GOTO 2710
--- Ha kész a szint:
1440 IFZ=0ANDG%<20 THEN COLOR 6:LOCATE 8,9:PRINT "The ";G%;". warehouse has been cleaned!":LOCATE8,11:PRINT"Would you like to move to the next warehouse? (Y/N)":GOTO 1480
--- Ha nincs kész, és ez volt az utolsó próbálkozás, azaz kirúgtak
1450 IFZ>1ANDW%=5 THEN BEEP:COLOR 3:LOCATE 0,9:PRINT"* You got fired from your job! Try again? (Y/N)":GOTO 1480
--- Ha már csak 1 láda kellett volna végéhez
1460 IFZ=1THEN COLOR 6:LOCATE 6,9:PRINT "That was close! Do better next time!":LOCATE8,11:PRINT "Would you like to try again? (Y/N)":GOTO 1480
--- Ha még több mint egy láda van hátra
1470 IFZ>1THEN COLOR 6:LOCATE 6,9:PRINT "Pull yourself together! They're going to fire you!":LOCATE8,11:PRINT "Try again? (Y/N)":GOTO 1480
--- y/n bekérése (csak kisbetűvel)
1480 A$=INPUT$(1)
1490 IFA$="y"AND Z>=1 AND W%=5 THEN W%=1:G%=1:ERASEQ%:DIM Q%(32,19):GOTO 740
1500 IFA$="y"AND Z>=1 AND W%<>5 THEN W%=W%+1:ERASEQ%:DIM Q%(32,19):GOTO 740
1510 IFA$="y"AND Z=0 THEN G%=G%+1:W%=1:ERASEQ%:DIMQ%(32,19):GOTO 740
1520 IFA$="n"THEN 1540
1530 GOTO 1480
1540 COLOR 7:LOCATE 6,15:PRINT"      * Bye, see you later!     "
1550 END
#include soko-sprite-4-data.bas
#include soko-levels-data.bas
2710 REM *******************
2720 COLOR 6:LOCATE 12,10
2730 READ A:IF A=52 THEN 2760
2740 PRINTCHR$(A);
2750 GOTO 2730
2760 LOCATE15,13:PRINT"GOOD-BY!"
