@echo off
cls
echo Versenden von Meldungen an das HGS
echo.

Set JAVA=C:\Testtools\jdk-17.0.11\bin\java

Set Projekt=%1
Set Meldung=%2
Set Testfall=%3

set path_self=%~dp0
set path_meldungen=C:\Testtools\HGS\MELDUNGEN

rem d:
cd %path_meldungen%





echo %JAVA% -jar sendMessage.jar -PROJEKTNAME %Projekt%  -MELDUNGSNAME %Meldung% -TESTFALLNAME %Testfall% -MAINPATH %path_meldungen% 
%JAVA% -jar sendMessage.jar -PROJEKTNAME %Projekt%  -MELDUNGSNAME %Meldung% -TESTFALLNAME %Testfall% -MAINPATH %path_meldungen%




EXIT /B %ERRORLEVEL%
