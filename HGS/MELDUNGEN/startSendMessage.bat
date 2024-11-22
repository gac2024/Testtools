@echo off
cls
echo Versenden von Meldungen an das HGS
echo.





Set MELDUNG=%2
Set PROJEKT=%1
Set TESTFALL=%3



rem definitions:
set RanorexHost=PCTR007
set MYLAUFWERK=%~d0
set MYPATH=%~dp0 

set LAUFWERK=%MYLAUFWERK%
if "%RanorexHost%"=="%ComputerName%" set LAUFWERK=D:



Set JAVA=%LAUFWERK%\Testtools\jdk-17.0.11\bin\java
set MAINPATH=%LAUFWERK%\Testtools\HGS\MELDUNGEN

cd %MAINPATH%

echo %JAVA% -jar sendMessage.jar -PROJEKTNAME %PROJEKT%  -MELDUNGSNAME %MELDUNG% -TESTFALLNAME %TESTFALL% -MAINPATH %MAINPATH% 
%JAVA% -jar sendMessage.jar -PROJEKTNAME %PROJEKT%  -MELDUNGSNAME %MELDUNG% -TESTFALLNAME %TESTFALL% -MAINPATH %MAINPATH%

set error=%ERRORLEVEL%

%MYLAUFWERK%
cd %MYPATH%

EXIT /B %error%
