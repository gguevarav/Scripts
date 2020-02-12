' Script para mapear las unidades de red que utiliza el
' sistema antiguo de Oracle
' (c) Gemis Daniel Guevara Villeda
' 12 de Diciembre del 2018
' 14:02 PM
' Empagua

Titulo="Mapeo de Menus y Reportes Sistema Antiguo"
Mensaje="Selecciona la arquitectura"&vbcr&vbcr&_
"(c) Gemis Daniel Guevara Villeda"&vbcr&vbcr&_
"Diciembre 2018"&vbcr&vbcr&_
"1 - x86 "&vbcr&_
"2 - x64 "&vbcr&_
"3 - Salir "

Default ="1"
Question = InputBox(Mensaje,Titulo,Default)
Select Case Question 
Case 1 Run(1)
Case 2 Run(2)
Case 3 Run(3)
Case 4 Run(4)
Case 5 Run(5)
Case 6 Run(6)
Case 7 Run(7)
Case 8 Run(8)
Case 9 Run(9)
end Select


Sub Run(var)
Set WS = CreateObject("WScript.shell")
    Select Case var
    Case 1 WS.run("\\usprsfs11\IT\IT_notes\!PC_ConfigDoc\Bryan\Autohotkey\64_bit_Menu\Mapping_Mastercd\Mapping_Mastercd.bat")
    Case 2 WS.run("\\usprsfs11\IT\IT_notes\!PC_ConfigDoc\Bryan\Autohotkey\64_bit_Menu\Shortcuts_done\Shortcuts.bat")
    Case 3 WS.run("\\usprsfs11\IT\IT_notes\!PC_ConfigDoc\Bryan\Autohotkey\64_bit_Menu\Setup_done\Taskbar_combined.vbs")
    Case 4 WS.run("\\usprsfs11\IT\IT_notes\!PC_ConfigDoc\Bryan\Autohotkey\64_bit_Menu\Iexplorer_done\IE_setup.vbs")
    Case 5 WS.run("\\usprsfs11\IT\IT_notes\!PC_ConfigDoc\Bryan\Autohotkey\64_bit_Menu\Notepab_done\Notetab_combined.vbs")
    Case 6 WS.run("\\usprsfs11\IT\IT_notes\!PC_ConfigDoc\Bryan\Autohotkey\64_bit_Menu\Outlook_done\Outlook.vbs")
    Case 7 WS.run("\\usprsfs11\IT\IT_notes\!PC_ConfigDoc\Bryan\Autohotkey\64_bit_Menu\AS400\ASW_Setup.vbs")
    Case 8 WS.run("\\usprsfs11\IT\IT_notes\!PC_ConfigDoc\Bryan\Autohotkey\64_bit_Menu\AMS_done\AMS_combined.vbs")
    Case 9 WS.run("Exit code")

End select
End Sub 

'  case 1

Sub Mapping(Process)
Set Ws = CreateObject("Wscript.Shell")
Command = "cmd /c Taskkill /F /IM "&Process&""
Execution = Ws.Run(Command,0,False)
End Sub

' case 2

Sub Shortcuts(Process)
Set Ws = CreateObject("Wscript.Shell")
Command = "cmd /c Taskkill /F /IM "&Process&""
Execution = Ws.Run(Command,0,False)
End Sub

Function CmdPrompt(sCmd)
Dim sCmdLine,oWS,nRes
set oWS = CreateObject("Wscript.Shell")
sCmdLine = "cmd /c Start " & sCmd & ""
nRes = oWS.Run(sCmdLine,0,False)
CmdPrompt = nRes
End Function

' case 3

Sub Customizewindows(Process)
Set Ws = CreateObject("Wscript.Shell")
Command = "cmd /c Taskkill /F /IM "&Process&""
Execution = Ws.Run(Command,0,False)
End Sub

Function CmdPrompt(sCmd)
Dim sCmdLine,oWS,nRes
set oWS = CreateObject("Wscript.Shell")
sCmdLine = "cmd /c Start " & sCmd & ""
nRes = oWS.Run(sCmdLine,0,False)
CmdPrompt = nRes
End Function

' case 4 

Sub IEsetup(Process)
Set Ws = CreateObject("Wscript.Shell")
Command = "cmd /c Taskkill /F /IM "&Process&""
Execution = Ws.Run(Command,0,False)
End Sub

Function CmdPrompt(sCmd)
Dim sCmdLine,oWS,nRes
set oWS = CreateObject("Wscript.Shell")
sCmdLine = "cmd /c Start " & sCmd & ""
nRes = oWS.Run(sCmdLine,0,False)
CmdPrompt = nRes
End Function

' case 5

Sub Notetab(Process)
Set Ws = CreateObject("Wscript.Shell")
Command = "cmd /c Taskkill /F /IM "&Process&""
Execution = Ws.Run(Command,0,False)
End Sub

Function CmdPrompt(sCmd)
Dim sCmdLine,oWS,nRes
set oWS = CreateObject("Wscript.Shell")
sCmdLine = "cmd /c Start " & sCmd & ""
nRes = oWS.Run(sCmdLine,0,False)
CmdPrompt = nRes
End Function

' case 6

Sub Outlook(Process)
Set Ws = CreateObject("Wscript.Shell")
Command = "cmd /c Taskkill /F /IM "&Process&""
Execution = Ws.Run(Command,0,False)
End Sub

Function CmdPrompt(sCmd)
Dim sCmdLine,oWS,nRes
set oWS = CreateObject("Wscript.Shell")
sCmdLine = "cmd /c Start " & sCmd & ""
nRes = oWS.Run(sCmdLine,0,False)
CmdPrompt = nRes
End Function

' case 7

Sub AS400(Process)
Set Ws = CreateObject("Wscript.Shell")
Command = "cmd /c Taskkill /F /IM "&Process&""
Execution = Ws.Run(Command,0,False)
End Sub

Function CmdPrompt(sCmd)
Dim sCmdLine,oWS,nRes
set oWS = CreateObject("Wscript.Shell")
sCmdLine = "cmd /c Start " & sCmd & ""
nRes = oWS.Run(sCmdLine,0,False)
CmdPrompt = nRes
End Function

' case 8

Sub AMS(Process)
Set Ws = CreateObject("Wscript.Shell")
Command = "cmd /c Taskkill /F /IM "&Process&""
Execution = Ws.Run(Command,0,False)
End Sub

Function CmdPrompt(sCmd)
Dim sCmdLine,oWS,nRes
set oWS = CreateObject("Wscript.Shell")
sCmdLine = "cmd /c Start " & sCmd & ""
nRes = oWS.Run(sCmdLine,0,False)
CmdPrompt = nRes
End Function