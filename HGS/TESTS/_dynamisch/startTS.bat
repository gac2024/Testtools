@echo off  
setlocal enableDelayedExpansion 
cls



SET PROJEKT=%1%
SET TESTFILE=%2%
SET TRY=%3%


rem definitions:
set LAUFWERK=%~d0
set WhereIam=%~dp0 

set MainPath=%LAUFWERK%\Testtools\HGS\MELDUNGEN
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
echo.

cd %MainPath%


SET /A COUNT=1

for /F " tokens=1-4 delims=;" %%a in ('more %TESTFILE%') do (

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
	IF "%TRY%"=="TEST" (
	  echo ####################################
	  echo # TEST MODUS
	)
	IF "%TRY%"=="STEP" (
	  echo ####################################
	  echo # STEP MODUS
	)	
	echo ####################################
	echo # PROJEKTNAME=!Projekt!
	echo # MELDUNGSNAME=!Meldung!
	echo # TESTFALLNAME=!Testfall! 
	echo ####################################
	echo # Kommentar:
	echo #  !Kommentar!
	echo ####################################
	echo.

	if "%TRY%"=="STEP" (
		pause
	)
	IF "%TRY%"=="TEST" (
	 echo !JAVA! -jar sendMessage.jar -PROJEKTNAME !Projekt!  -MELDUNGSNAME !Meldung! -TESTFALLNAME !Testfall! -MAINPATH !MainPath!
	 echo.
	) else (
	 start "sendMessage"  /WAIT  !JAVA! -jar sendMessage.jar -PROJEKTNAME !Projekt!  -MELDUNGSNAME !Meldung! -TESTFALLNAME !Testfall! -MAINPATH !MainPath!
	)

	if "!ERRORLEVEL!"=="0" (
		echo Kein Fehler: Meldung wurde erfolgreich versendet.
	) else (
		echo Es ist ein Fehler aufgetreten: !ERRORLEVEL!
		echo bitte pruefen	
		goto FEHLER	
	)
	
	echo.
	
	if "%TRY%"=="TEST" (	
		echo ####################################
		echo # Pruefungen:
		echo #  !Checkroutine!
		echo ####################################
		echo.

		pause
	)
	if "%TRY%"=="STEP" (	
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

cd %WhereIam%

