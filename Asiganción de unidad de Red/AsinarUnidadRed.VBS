@echo off

REM Script para asignación de unidades de red
REM Lunes 7 de enero del 2019
REM 9:48 PM

REM Borramos la pantalla
CLS
echo (c) Gemis Daniel Guevara Villeda
echo Empagua
echo 
echo Espere...
echo Cargando...
echo %DATE% ^|%TIME% 
echo.

REM Retardo
REM TIMEOUT 3

set objDisco = CreateObject("Scripting.FileSystemObject")
Set objRed = WScript.CreateObject("WScript.Network")

REM letraUnidad = InputBox ("Introduzca la letra de unidad (con los dos puntos al final):")
REM rutaBNC = InputBox ("Introduzca la ruta BNC del tipo \\equipo\recurso:")

REM usuario = InputBox ("Nombre de usuario:")
REM contrasena = InputBox ("ContraseÃ±a:")

REM Letra a asignarle a la unidad
Set LetraUnidad=Y

REM Ruta a asignarle a la unidad
Set RutaBNC=\\10.4.2.2

on error resume next
objRed.MapNetworkDrive LetraUnidad, rutaBNC

Pause

If objDisco.FolderExists(letraUnidad) Then 
   wscript.echo "Unidad de red creada correctamente."
Else
   Wscript.Echo "Error al crear unidad de red."
End If