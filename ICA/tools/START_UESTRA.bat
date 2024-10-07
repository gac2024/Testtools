@echo off

echo STARTE UESTRA TEST   (SEQUENCENUMMERN)

set RCONFIGpath="C:\Testtools\Ranorex\RanorexStudio Projects\HGS\ICA_config"

set RCONFIGfile="startConfigurationUESTRA.xml"

set TESTROJEKTPath="C:\Testtools\Ranorex\RanorexStudio Projects\HGS\HGS\bin\Debug"


set path=%~dp0


echo wechsel nach %TESTROJEKTPath%
cd %TESTROJEKTPath%



echo copy  /Y %RCONFIGpath%\%RCONFIGfile% startConfiguration.xml
copy /Y %RCONFIGpath%\%RCONFIGfile% startConfiguration.xml

echo call %TESTROJEKTCmd% 

call HGS.exe /ts:UESTRA.rxtst > %path%\hgs.log


echo wechsel nach %path%
cd %path%

