@echo off
cls

set PROJEKTNAME=%1

set path_self=%~dp0

set PROJEKTDIR=CONFIG\%PROJEKTNAME%


echo Erstelle Projektkonfigurationsdatei "CONFIG\%PROJEKTNAME%.ini"
echo ; globale Einstellungen > CONFIG\%PROJEKTNAME%.ini
echo [projectconfiguration] >> CONFIG\%PROJEKTNAME%.ini
echo automat=0000 >> CONFIG\%PROJEKTNAME%.ini
echo version=3.10 >> CONFIG\%PROJEKTNAME%.ini
echo urlhgs=https://uestra.dev.ti-ica.de/dplus/services/automatenService/3_10/?wsdl >> CONFIG\%PROJEKTNAME%.ini



if not exist "%PROJEKTDIR%" ( 
    echo Erstelle Ordner "%PROJEKTDIR%" 
    mkdir "%PROJEKTDIR%"    
) else (
   echo Der Projektordner "%PROJEKTDIR%" existiert bereits 
   goto ENDE
)


echo Kopieren der templateFiles nach  "CONFIG\%PROJEKTNAME%"
xcopy /E templateFiles CONFIG\%PROJEKTNAME%






:ENDE
