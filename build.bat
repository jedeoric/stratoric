@echo off

..\..\..\cc65-win\bin\da65.exe  -i da65_stratoric40.txt --comments 4 
..\..\..\cc65-win\bin\da65.exe  -i da65_sedoric40.txt --comments 4 
cd src\
%OSDK%\bin\xa stratoric.asm -o B7STRATO4_NEW.ROM
cd ..
md5sums  B7STRA40.ROM
md5sums  src\B7STRATO4_NEW.ROM