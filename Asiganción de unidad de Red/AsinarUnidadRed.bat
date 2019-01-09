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

REM Asignamos la unidad de red
net use Y: \\10.4.2.2\master

Pause