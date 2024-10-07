@echo off


setlocal enableDelayedExpansion 
cls

rem Hier muss der Type eingegebene werden
set MYTYPE=%1%

Set JAVA=C:\Testtools\jdk-17.0.11\bin\java
set MYMAIN=C:\Testtools\HGS\MELDUNGEN\TEMPLATES\IN\
set MYDIR=%MYMAIN%\%MYTYPE%
set EXPORT=%MYMAIN%\..\OUT\%MYTYPE%

if not exist "%EXPORT%" ( 
    echo Creating Folder "%EXPORT%" 
    mkdir "%EXPORT%"    
)


for /F "delims=" %%x in ('dir /B/D %MYDIR%') do (
  set FILENAME="%MYDIR%\%%x"
  echo ===========================  Convert  !FILENAME! ===========================
  echo convert !FILENAME! to  %EXPORT%\%MYTYPE%.ini
  echo %JAVA% -jar convertMessage.jar -INXML !FILENAME! -OUTINI "%EXPORT%\%MYTYPE%.ini"
  start "convertMessage"  /WAIT  %JAVA% -jar convertMessage.jar -INXML !FILENAME!  -OUTINI "%EXPORT%\%MYTYPE%.ini"

  echo ======================================================
)



pause 
























