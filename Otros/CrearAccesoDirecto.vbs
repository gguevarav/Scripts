

Set objShell = WScript.CreateObject("WScript.Shell")

ficheroAccesoDirecto = "C:\Users\EMPAGUA\Desktop\Notepad.lnk"

Set objAccesoDirecto = objShell.CreateShortcut(ficheroAccesoDirecto)
    objAccesoDirecto.TargetPath = "C:\Windows\System32\notepad.exe"
    objAccesoDirecto.Arguments = "C:\Windows\DtcInstall.log"
    objAccesoDirecto.Description = "Bloc de notas de Windows"   
    objAccesoDirecto.HotKey = "ALT+CTRL+N"
    objAccesoDirecto.IconLocation = "C:\Windows\System32\notepad.exe, 2"
    objAccesoDirecto.WindowStyle = "1"   
    objAccesoDirecto.WorkingDirectory = "C:\Windows"
    objAccesoDirecto.Save

Set objAccesoDirecto = Nothing