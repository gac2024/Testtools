@echo off  
cls

echo.
echo.
echo ########################################################################################################
echo #                                   BESCHREIBUNG DES TEST                                              #
echo ########################################################################################################
echo.
echo.
echo Dieser virtuelle Testlauf enthaellt folgendes Szenario:
echo - Gelspeicherwechsel aller Geldspeicher
echo - - Automatische Schicht wird erzeugt     
echo - Einkaufen eines Tickets in BAR fuer 3,40 EURO
echo - Online-Abrechnung ausloesen  
echo - Einkaufen eines Tickets via Girocard fuer 7,30 EURO
echo - Online-Abrechnung ausloesen
echo - Einkaufen eines Tickets in BAR fuer 3,40 EURO mit 3,50 Rueckgeld 10ct
echo - Online-Abrechnung ausloesen
echo - Einkaufen eines Tickets via Kreditkarte fuer 10,40 EURO
echo - Online-Abrechnung ausloesen
echo - Simulation (rein virtuell) WGR Geldeinzug  , die Muenzen fallen in den BEK ( auch hier rein virtuell)
echo - Online-Abrechnung ausloesen
echo - Gelspeicherwechsel aller Geldspeicher
echo - - Automatische Schicht wird erzeugt   
echo.
echo.
echo ########################################################################################################





echo Zum Start Taste druecken
pause
goto ENDE

rem ------------------------------------------------------
rem start
rem ------------------------------------------------------

rem definitions:
set WhereIam=%~dp0 
set MainPath=C:\Testtools\HGS\MELDUNGEN
set Meldung=Schichtreport
set Projekt=DIMAS19
Set JAVA=C:\Testtools\jdk-17.0.11\bin\java


cd %MainPath%




:Start
echo.
echo.
echo ###################
echo # START DES TESTS #
echo ###################
echo.
echo.

echo # Gelspeicherwechsel aller Geldspeicher
echo # Automat sendet Schichtmeldung
echo # Meldungs-config: Lauf01\Step01_Geldlogistik_Vorbedingung.ini



rem subfunktionen Step by Step
:STEP1

echo.
echo ####################################
echo #              STEP1               #
echo ####################################
echo.
set Testfall=Lauf01\Step01_Geldlogistik_Vorbedingung
start "sendMessage"  /WAIT  %JAVA% -jar sendMessage.jar -PROJEKTNAME %Projekt%  -MELDUNGSNAME %Meldung% -TESTFALLNAME %Testfall% -MAINPATH %MainPath%
rem start "sendMessage"  /WAIT  startSendMessage.bat %Projekt% %Meldung% %Testfall%
echo ErrorLevel ist %ERRORLEVEL%  

echo.
echo.

echo ############################################################
echo ## Gelspeicherwechsel in DIMAS19 kann kontrolliert werden.
echo ############################################################
echo.
echo.
pause

:STEP2

echo.
echo ####################################
echo #              STEP2               #
echo ####################################
echo.

echo # Einkaufen eines Tickets in BAR fuer 3,40 EURO
echo # Online-Abrechnung ausloesen
echo # Meldungs-config: Lauf01\Step02a_Einkauf_BAR.ini

echo.
echo.
set Testfall=Lauf01\Step02a_Einkauf_BAR
start "sendMessage"  /WAIT  %JAVA% -jar sendMessage.jar -PROJEKTNAME %Projekt%  -MELDUNGSNAME %Meldung% -TESTFALLNAME %Testfall% -MAINPATH %MainPath%
rem start "sendMessage"  /WAIT  startSendMessage.bat %Projekt% %Meldung% %Testfall%
echo ErrorLevel ist %ERRORLEVEL%  
echo.
echo.

echo ##################################################################
echo ## Abrechnung/Statistiken in DIMAS19 koennen kontrolliert werden.
echo ##################################################################
echo.
echo.
pause

:STEP3

echo.
echo ####################################
echo #              STEP3               #
echo ####################################
echo.

echo # Einkaufen eines Tickets via Girocard fuer 7,30 EURO
echo # Online-Abrechnung ausloesen
echo # Meldungs-config: Lauf01\Step02b_Einkauf_GIRO.ini

echo.
echo.
set Testfall=Lauf01\Step02b_Einkauf_GIRO
start "sendMessage"  /WAIT  %JAVA% -jar sendMessage.jar -PROJEKTNAME %Projekt%  -MELDUNGSNAME %Meldung% -TESTFALLNAME %Testfall% -MAINPATH %MainPath%
rem start "sendMessage"  /WAIT  startSendMessage.bat %Projekt% %Meldung% %Testfall%
echo ErrorLevel ist %ERRORLEVEL%  
echo.
echo.

echo ##################################################################
echo ## Abrechnung/Statistiken in DIMAS19 koennen kontrolliert werden.
echo ##################################################################
echo.
echo.
pause

:STEP4

echo.
echo ####################################
echo #              STEP4               #
echo ####################################
echo.

echo # Einkaufen eines Tickets in BAR fuer 3,40 EURO mit 3,50 Rueckgeld 10ct
echo # Online-Abrechnung ausloesen
echo # Meldungs-config: Lauf01\Step02c_Einkauf_BAR_mRueck.ini

echo.
echo.
set Testfall=Lauf01\Step02c_Einkauf_BAR_mRueck
start "sendMessage"  /WAIT  %JAVA% -jar sendMessage.jar -PROJEKTNAME %Projekt%  -MELDUNGSNAME %Meldung% -TESTFALLNAME %Testfall% -MAINPATH %MainPath%
rem start "sendMessage"  /WAIT  startSendMessage.bat %Projekt% %Meldung% %Testfall%
echo ErrorLevel ist %ERRORLEVEL%  
echo.
echo.

echo ##################################################################
echo ## Abrechnung/Statistiken in DIMAS19 koennen kontrolliert werden.
echo ##################################################################
echo.
echo.
pause

:STEP5

echo.
echo ####################################
echo #              STEP5               #
echo ####################################
echo.

echo # Einkaufen eines Tickets via Kreditkarte fuer 10,40 EURO
echo # Online-Abrechnung ausloesen
echo # Meldungs-config: Lauf01\Step02d_Einkauf_KRED.ini

echo.
echo.
set Testfall=Lauf01\Step02d_Einkauf_KRED
start "sendMessage"  /WAIT  %JAVA% -jar sendMessage.jar -PROJEKTNAME %Projekt%  -MELDUNGSNAME %Meldung% -TESTFALLNAME %Testfall% -MAINPATH %MainPath%
rem start "sendMessage"  /WAIT  startSendMessage.bat %Projekt% %Meldung% %Testfall%
echo ErrorLevel ist %ERRORLEVEL%  
echo.
echo.

echo ##################################################################
echo ## Abrechnung/Statistiken in DIMAS19 koennen kontrolliert werden.
echo ##################################################################
echo.
echo.
pause

:STEP6

echo.
echo ####################################
echo #              STEP6               #
echo ####################################
echo.

echo # Simulation (rein virtuell) WGR Geldeinzug  , die Münzen fallen in den BEK ( auch hier rein virtuell)
echo # Online-Abrechnung ausloesen
echo # Meldungs-config: Lauf01\Step04a_Geldlogistik_Kassieren.ini

echo.
echo.
set Testfall=Lauf01\Step04a_Geldlogistik_Kassieren
start "sendMessage"  /WAIT  %JAVA% -jar sendMessage.jar -PROJEKTNAME %Projekt%  -MELDUNGSNAME %Meldung% -TESTFALLNAME %Testfall% -MAINPATH %MainPath%
rem start "sendMessage"  /WAIT  startSendMessage.bat %Projekt% %Meldung% %Testfall%
echo ErrorLevel ist %ERRORLEVEL%  
echo.
echo.

echo ##################################################################
echo ## Abrechnung/Statistiken in DIMAS19 koennen kontrolliert werden.
echo ##################################################################
echo.
echo.
pause


:STEP7

echo.
echo ####################################
echo #              STEP7               #
echo ####################################
echo.

echo # Gelspeicherwechsel aller Geldspeicher   ( Zuruecksetzen fuer Schritt 1) 
echo # Online-Abrechnung ausloesen
echo # Meldungs-config: Lauf01\Step09_Geldlogistik_Geldspeichertausch.ini

echo.
echo.
set Testfall=Lauf01\Step09_Geldlogistik_Geldspeichertausch
start "sendMessage"  /WAIT  %JAVA% -jar sendMessage.jar -PROJEKTNAME %Projekt%  -MELDUNGSNAME %Meldung% -TESTFALLNAME %Testfall% -MAINPATH %MainPath%
rem start "sendMessage"  /WAIT  startSendMessage.bat %Projekt% %Meldung% %Testfall%
echo ErrorLevel ist %ERRORLEVEL%  
echo.
echo.

echo ##################################################################
echo ## Abrechnung/Statistiken in DIMAS19 koennen kontrolliert werden.
echo ##################################################################
echo.
echo.
pause



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


pause

