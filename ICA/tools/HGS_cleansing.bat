@echo off
cls
echo ################

echo Starte Cleansing
echo ################

set "startpfad=%~dp0"

set logpath=%startpfad%..\..\HGS\MELDUNGEN\LOGS
set exportpath=%startpfad%..\..\HGS\MELDUNGEN\EXPORT


echo Verschiebe Log und Export Dateien die aelter als 7 Tage sind
echo in den Ordner HGSArchive inklusive Zeitstempel
SET DATUM=%DATE:~-4%_%DATE:~3,2%_%DATE:~0,2%
set archive=%startpfad%..\..\HGSArchive\%DATUM%\

mkdir %archive%
mkdir %archive%\log
mkdir %archive%\meldungen



echo %logpath%
echo %exportpath%

rem forfiles /p "%downloadPath%" /s /m *.* /d -7 /c "cmd /c echo @path "
forfiles /p "%exportpath%" /s /m *.* /d -7 /c "cmd /c copy @path %archive%\meldungen"
forfiles /p "%exportpath%" /s /m *.* /d -7 /c "cmd /c del @path"

forfiles /p "%logpath%" /s /m *.* /d -7 /c "cmd /c copy @path %archive%\log"
forfiles /p "%logpath%" /s /m *.* /d -7 /c "cmd /c del @path"

echo ################
echo FERTIG
echo ################

