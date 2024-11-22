@echo off
setlocal enableDelayedExpansion 

set javaUse=java

set RanorexHost=NBTR062

set HOST=%ComputerName%

set MYLAUFWERK=%~d0

set LAUFWERK=%MYLAUFWERK%
if "%RanorexHost%"=="%ComputerName%" set LAUFWERK=D:


Set JAVA=%LAUFWERK%\Testtools\jdk-17.0.11\bin\java
set MAINPATH=%LAUFWERK%\Testtools\HGS\MELDUNGEN



echo %MAINPATH%


goto :eof


call :chkjava

echo use %javaUse%

goto :END











:chkjava


where java > javalist.txt
for /F tokens^=*^ delims^=^ eol^= %%a in (javalist.txt) do call :FOR2 "%%a"
goto :eof

:FOR2
set javaprg=%1
echo  %javaprg%


for /f tokens^=2-5^ delims^=.-_^" %%j in ('%javaprg% -fullversion 2^>^&1') Do set "vers=%%j"
if %vers% GEQ 17 set javaUse=%javaprg%
goto :eof
    
:END






