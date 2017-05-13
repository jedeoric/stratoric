@echo off

rem ..\..\..\cc65-win\bin\da65.exe  -i da65_stratoric40.txt --comments 4 
rem ..\..\..\cc65-win\bin\da65.exe  -i da65_sedoric40.txt --comments 4 
cd src\
rem %OSDK%\bin\xa  page400_atmos.asm -o  page400_atmos.o
rem  %OSDK%\bin\xa  page400_oric1.asm -o  page400_oric1.o

rem %cc65%\da65.exe  page400_atmos.o -S0x400 -o page400_atmos.s
rem %cc65%\da65.exe  page400_oric1.o -S0x400 -o page400_oric1.s

%OSDK%\bin\xa page400_atmos_src.asm -o page400_atmos_assembled.o

rem  %OSDK%\bin\xa  atmos_page400.asm -o page400_atmos.o
%OSDK%\bin\bin2txt -s1 -e1 -f2 -h1 page400_atmos_assembled.o page400_atmos_for_include.inc XXXXXXXXXXXXXX

%OSDK%\bin\xa stratoric.asm -o B7STRATO4_NEW.ROM -l entries
cd ..
md5sums  B7STRA40.ROM
md5sums  src\B7STRATO4_NEW.ROM