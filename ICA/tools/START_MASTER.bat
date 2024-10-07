@echo off
cls

set dt=%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set dt=%dt: =0%

echo #######################
echo STARTE MASTER TEST 
echo Startzeitpunkt: %dt%
echo #######################







set RCONFIGpath="C:\Testtools\ICA\Startconfig"

set RCONFIGfile=startConfiguration_MASTER.xml

set TESTROJEKTPath="C:\Testtools\Ranorex\RanorexStudio Projects\HGS\HGS\bin\Debug"
set TESTROJEKTCmd="HGS.exe /ts:MASTER.rxtst"

set path=%~dp0




echo wechsel nach %TESTROJEKTPath%
cd %TESTROJEKTPath%



echo copy  /Y %RCONFIGpath%\%RCONFIGfile% \%RCONFIGfile%
copy /Y %RCONFIGpath%\%RCONFIGfile% \%RCONFIGfile%


if not exist "%path%\startLogs" ( 
	mkdir %path%\startLogs
)


set logfile=%path%\startLogs\hgsLog_%dt%.log



rem for logfile
echo #######################  	> %logfile%
echo STARTE MASTER TEST       	>> %logfile%
echo Startzeitpunkt: %dt%       >> %logfile%
echo #######################  	>> %logfile%
echo. 							>> %logfile%
echo call %TESTROJEKTCmd% 		>> %logfile%
echo. 							>> %logfile%
echo Ranorex-Log: 				>> %logfile%
echo.							>> %logfile%


echo call %TESTROJEKTCmd% 
rem call HGS.exe /ts:MASTER.rxtst >> %path%\startLogs\hgsLog_%d%.log


echo wechsel nach %path%
cd %path%



set dt=%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set dt=%dt: =0%
echo.							>> %logfile%
echo #######################  	>> %logfile%
echo BEENDE MASTER TEST       	>> %logfile%
echo Endzeitpunkt: %dt%         >> %logfile%
echo #######################  	>> %logfile%
echo.							>> %logfile%
