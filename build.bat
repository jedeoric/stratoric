@echo off

rem ..\..\..\cc65-win\bin\da65.exe  -i da65_stratoric40.txt --comments 4 
rem ..\..\..\cc65-win\bin\da65.exe  -i da65_sedoric40.txt --comments 4 
cd src\
rem %OSDK%\bin\xa  page400_atmos.asm -o  page400_atmos.o
rem %OSDK%\bin\xa  page400_oric1.asm -o  page400_oric1.o

rem  %OSDK%\bin\xa  atmos_page400.asm -o page400_atmos.o
rem %OSDK%\bin\bin2txt -s1 -e1 -f2 -h1 page400_atmos.o page400_atmos.asm XXXXXXXXXXXXXX

%OSDK%\bin\xa stratoric.asm -o B7STRATO4_NEW.ROM
cd ..
md5sums  B7STRA40.ROM
md5sums  src\B7STRATO4_NEW.ROM