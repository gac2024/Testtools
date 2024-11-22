@echo off  
setlocal enableDelayedExpansion 
cls



SET PROJEKT=%1%
SET TESTFILE=%2%
SET CTRL=%3%


rem definitions:
set RanorexHost=PCTR007
set MYLAUFWERK=%~d0
set MYPATH=%~dp0 

set LAUFWERK=%MYLAUFWERK%
if "%RanorexHost%"=="%ComputerName%" set LAUFWERK=D:




set MAINPATH=%LAUFWERK%\Testtools\HGS\MELDUNGEN
Set JAVA=%LAUFWERK%\Testtools\jdk-17.0.11\bin\java
Set KONFIG=%LAUFWERK%\Testtools\HGS\TESTS\_dynamisch\Testablaeufe\

REM Pruefungen
if exist "%TESTFILE%" (
	goto START
)
set TESTFILE=%KONFIG%%TESTFILE%

if exist "%TESTFILE%" (
	goto START
)
   echo Die Ablaufdatei "%TESTFILE%" existiert nicht. 
   goto ENDE

:START
echo.
echo.
echo ###################
echo # START DES TESTS #
echo ###################
echo.
echo # %DATE% %TIME%
echo.
echo.

cd %MAINPATH%


SET /A COUNT=1

for /F " tokens=1-4 delims=;" %%a in ('more %TESTFILE%') do (
    
	SET NL=^^^&echo:^&
	rem Zeilenumbruch in NL speichern

	set Meldung=%%a
	set Testfall=%%b
	set Kommentar=%%c
	set Checkroutine=%%d
     
    if not "Nachrichtentyp"=="!Meldung!" ( 
	
	echo.
	echo ####################################
	echo #              STEP!COUNT!               #
	echo ####################################
	echo.
	SET /A COUNT+=1
	IF "%CTRL%"=="TEST" (
	  echo ####################################
	  echo # TEST MODUS
	)
	IF "%CTRL%"=="STEP" (
	  echo ####################################
	  echo # STEP MODUS
	)	
	echo ####################################
	echo # PROJEKTNAME=!PROJEKT!
	echo # MELDUNGSNAME=!Meldung!
	echo # TESTFALLNAME=!Testfall! 
	echo ####################################
	echo # Kommentar:
	echo #  !Kommentar!
	echo ####################################
	echo.

	if "%CTRL%"=="STEP" (
		pause
	)
	IF "%CTRL%"=="TEST" (
	 echo !JAVA! -jar sendMessage.jar -PROJEKTNAME !PROJEKT!  -MELDUNGSNAME !Meldung! -TESTFALLNAME !Testfall! -MAINPATH !MAINPATH!
	 echo.
	) else (
	 start "sendMessage"  /WAIT  !JAVA! -jar sendMessage.jar -PROJEKTNAME !PROJEKT!  -MELDUNGSNAME !Meldung! -TESTFALLNAME !Testfall! -MAINPATH !MAINPATH!
	)

	if "!ERRORLEVEL!"=="0" (
		echo Kein Fehler: Meldung wurde erfolgreich versendet.
	) else (
		echo Es ist ein Fehler aufgetreten: !ERRORLEVEL!
		echo bitte pruefen	
		goto FEHLER	
	)
	
	echo.
	
	if "%CTRL%"=="TEST" (	
		echo ####################################
		echo # Pruefungen:
		echo #  !Checkroutine!
		echo ####################################
		echo.

		pause
	)
	if "%CTRL%"=="STEP" (	
		echo ####################################
		echo # Pruefungen:
		echo #  !Checkroutine!
		echo ####################################
		echo.

		pause
	)

	)
)

goto ENDE


:FEHLER

echo.
echo Hilfe ein Fehler 
echo Abbruch.
echo.



:ENDE
echo.
echo.
echo #################
echo #     ENDE      #
echo #################
echo.
echo.
echo.
echo.

%MYLAUFWERK%
cd %MYPATH%

