@echo off
cls

ECHO Set objShell = WScript.CreateObject("WScript.Shell") >>%USERPROFILE%\Desktop\accsdirecto.vbs
ECHO ficheroAccesoDirecto = "%USERPROFILE%\Desktop\SistemaComercial.lnk" >>%USERPROFILE%\Desktop\accsdirecto.vbs
ECHO Set objAccesoDirecto = objShell.CreateShortcut(ficheroAccesoDirecto) >>%USERPROFILE%\Desktop\accsdirecto.vbs
ECHO objAccesoDirecto.TargetPath = "C:\orant\BIN\ifrun60.EXE" >>%USERPROFILE%\Desktop\accsdirecto.vbs
ECHO objAccesoDirecto.Arguments = "fmenu_siaf" >>%USERPROFILE%\Desktop\accsdirecto.vbs
ECHO objAccesoDirecto.Description = "Sistema comercial antiguo" >>%USERPROFILE%\Desktop\accsdirecto.vbs
ECHO objAccesoDirecto.HotKey = "ALT+CTRL+N" >>%USERPROFILE%\Desktop\accsdirecto.vbs
ECHO objAccesoDirecto.IconLocation = "C:\orant\BIN\ifrun60.EXE, 2" >>%USERPROFILE%\Desktop\accsdirecto.vbs
ECHO objAccesoDirecto.WindowStyle = "1" >>%USERPROFILE%\Desktop\accsdirecto.vbs
ECHO objAccesoDirecto.WorkingDirectory = "C:\orant\BIN" >>%USERPROFILE%\Desktop\accsdirecto.vbs
ECHO objAccesoDirecto.Save >>%USERPROFILE%\Desktop\accsdirecto.vbs
ATTRIB +h +s "%USERPROFILE%\Desktop\accsdirecto.vbs"
cls
START /B /WAIT %USERPROFILE%\Desktop\accsdirecto.vbs
CLS
erase /Q /a h s "%USERPROFILE%\Desktop\accsdirecto.vbs"
cls
exit