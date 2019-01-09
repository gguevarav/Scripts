@echo off

REM Inicializamos la variable de opción
SET OpcionMenu=0
REM Borramos la pantalla
CLS
echo (c) Gemis Daniel Guevara Villeda
echo Empagua
echo Asignacion de ip "120"
echo Espere...
echo Cargando...
echo %DATE% ^|%TIME% 
echo.

REM Retardo
TIMEOUT 3

REM Cambiamos la dirección del adaptador
netsh interface ipv4 set address "Ethernet" static 10.4.5.120 255.255.0.0 10.4.2.3 1
REM Cambiamos el DNS del adaptador
netsh interface ip set dnsservers "Ethernet" static 10.5.2.50 validate=no primary
REM Agregamos otro DNS al adptadors
REM netsh interface ip set dnsservers "Ethernet" static 10.4.0.8 validate=no

echo.
echo Listo, ip cambiada

PAUSE