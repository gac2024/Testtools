


Filename = "MASTER.rxtst"
Path = "../tmp/"
SearchString = "MASTER"

newProjectname =  WScript.Arguments(0) 

Replacement = newProjectname
OutputFile = newProjectname&".rxtst"

NeuerInhalt = ""

WScript.Echo "Filename "+Path&Filename
WScript.Echo "SearchString "+SearchString
WScript.Echo "ReplaceString "+Replacement 
WScript.Echo "Projektnamen "+newProjectname
WScript.Echo "OutputFile "+OutputFile

Set objFSO = CreateObject("Scripting.FileSystemObject")
if objFSO.FileExists(Path&Filename) Then
    Set Datei = objFSO.OpenTextFile(Path&Filename, 1, true)
    NeuerInhalt = Replace(Datei.ReadAll,SearchString ,Replacement ) + vbcrlf 

 Datei.close
end if

 objFSO.CreateTextFile Path&OutputFile, true
 
 set Datei =objFSO.OpenTextFile(Path&OutputFile,2,true)
 Datei.write NeuerInhalt
 Datei.close
 
