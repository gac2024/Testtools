
@echo off
setlocal enableDelayedExpansion 


start "send"  /WAIT startSendMessage.bat MASTER Schichtreport  Schicht_GL_WGR1_start
start "send"  /WAIT startSendMessage.bat MASTER Schichtreport  Schicht_GL_WGR2
start "send"  /WAIT startSendMessage.bat MASTER Schichtreport  Schicht_GL_WGR3
start "send"  /WAIT startSendMessage.bat MASTER Schichtreport  Schicht_GL_WGR4
start "send"  /WAIT startSendMessage.bat MASTER Schichtreport  Schicht_GL_WGR5
start "send"  /WAIT startSendMessage.bat MASTER Schichtreport  Schicht_GL_BEK0
start "send"  /WAIT startSendMessage.bat MASTER Schichtreport  Schicht_GL_BEK1
start "send"  /WAIT startSendMessage.bat MASTER Schichtreport  Schicht_GL_ZGS1
start "send"  /WAIT startSendMessage.bat MASTER Schichtreport  Schicht_GL_ZGS2
start "send"  /WAIT startSendMessage.bat MASTER Schichtreport  Schicht_GL_ZGS3


 pause
