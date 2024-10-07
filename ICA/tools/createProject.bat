@echo off
cls

set PROJEKTNAME=%1
set CONFIGPATH=%2

set path_self=%~dp0
cd ..
set path_parent=%~dp0

IF "%CONFIGPATH%" equ "" set CONFIGPATH="C:\Testtools\HGS\MELDUNGEN\CONFIG"


cd %CONFIGPATH%


echo.
echo Erstellt ein Projekt-duplikat von der MASTER Konfiguration.
echo.
echo 1. Pruefung ob dieses Projekt bereits existiert. 
echo.

if exist  "%PROJEKTNAME%" ( 
   echo Das Projekt "%PROJEKTNAME%" existiert bereits, bitte prüfen.
   goto ENDE
)

echo 2. Erstellt das Verzeichnis  "%PROJEKTNAME%" 
mkdir %PROJEKTNAME%




echo.
echo 3. Kopiere das Verzeichnis MASTER  ( wenn es dieses gibt)
echo.

if not exist "MASTER" ( 
   echo Das Projekt MASTER existiert nicht, bitte prüfen.
   goto ENDE
)
xcopy MASTER %PROJEKTNAME% /E

echo.
echo 4. Kopiere die Datei MASTER.ini nach %PROJEKTNAME%.ini
echo.

if not exist "MASTER.ini" ( 
   echo Die Datei MASTER.ini existiert nicht, bitte prüfen.

   goto CREATEINI
)

copy MASTER.ini %PROJEKTNAME%.ini

goto CREATETESTSUITE




:CREATEINI
   
echo Erstelle Projektkonfigurationsdatei "%PROJEKTNAME%.ini"
echo ; globale Einstellungen fuer das Projekt %PROJEKTNAME% > %PROJEKTNAME%.ini
echo [projectconfiguration] >> %PROJEKTNAME%.ini
echo automat=0000 >> %PROJEKTNAME%.ini
echo version=3.10 >> %PROJEKTNAME%.ini
echo urlhgs=https://uestra.dev.ti-ica.de/dplus/services/automatenService/3_10/?wsdl >> %PROJEKTNAME%.ini

goto CREATETESTSUITE



:CREATETESTSUITE


echo.
echo 4. In Ranorex wird die entsprechnde Testsuite erstellt 
echo.

cd %path_self%

call  createTestsuite.bat %PROJEKTNAME%


echo.
echo 5. Startkonfigurationen erstellen
echo.


copy ..\Startconfig\startConfiguration_MASTER.xml ..\Startconfig\startConfiguration_%PROJEKTNAME%.xml 

echo.

copy START_MASTER.bat START_%PROJEKTNAME%.bat

echo.



echo.
echo.
echo #############################################
echo.
echo Folgende Daten wurden erstellt:
echo Verzeichnis: %CONFIGPATH%\%PROJEKTNAME%
echo.
echo Datei: %CONFIGPATH%\%PROJEKTNAME%.ini
echo   ---- Bitte Inhalt anpassen ----
echo Datei: %CONFIGPATH%\%PROJEKTNAME%\database.ini
echo   ---- Bitte Inhalt anpassen ----
echo Datei: %path_parent%Startconfig\startConfiguration_%PROJEKTNAME%.xml
echo   ---- Bitte Inhalt anpassen ----
echo        Nach dem Anpassen muss die Datei in das Verzeichnis 
echo        C:\Testtools\Ranorex\RanorexStudio Projects\HGS\HGS\bin\Debug
echo        kopiert werden. 
echo Datei: %path_self%START_%PROJEKTNAME%.bat
echo   ---- Bitte Inhalt anpassen ----
echo        Nach dem Anpassen muss die Datei in das Verzeichnis 
echo        C:\Testtools\Ranorex\RanorexStudio Projects\HGS\HGS\bin\Debug
echo        kopiert werden. 
echo. 
echo. 
echo Datei: C:\Testtools\Ranorex\RanorexStudio Projects\HGS\HGS\%PROJEKTNAME%.rxtst 
echo   ---- Diese muss in Ranorex hinzugefügt werden 
echo        und anschliessend sollte das Projekt neu erstellt werden. 
echo #############################################
echo #############################################
echo.
echo.







 






:ENDE
