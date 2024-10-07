@echo off
rem cls

set PROJEKTNAME=%1

set path_self=%~dp0


set RANOREX=%2

IF "%RANOREX%" equ "" set RANOREX="C:\Testtools\Ranorex\RanorexStudio Projects\HGS\HGS"



echo.
echo Kopiere MASTER Testsuite nach tmp 
echo.

copy %RANOREX%\MASTER.rxtst %path_self%\..\tmp

echo.
echo Ersetze MASTER gegen %PROJEKTNAME%
echo.
echo.
call cscript prepareNewProject.vbs %PROJEKTNAME%
echo.
echo.

if not exist "%path_self%\..\tmp\%PROJEKTNAME%.rxtst" ( 
    echo Da ist etwas schief gelaufen. 
    echo "%path_self%\..\tmp\%PROJEKTNAME%.rxtst"  existiert nicht.
	goto ENDE
	
) 
echo.
echo Kopiere %PROJEKTNAME% Testsuite nach %RANOREX%
echo.

copy "%path_self%\..\tmp\%PROJEKTNAME%.rxtst" %RANOREX%



echo.
echo Leere das tmp-Verzeichnis
echo.
del "%path_self%\..\tmp\*.rxtst"


echo.
echo Testsuite Artefakt erstellt. muss aber noch via RANOREX eingebunden werden.
echo.


pause


:ENDE
