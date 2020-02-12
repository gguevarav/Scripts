@echo off

REM Inicializamos la variable de opción
SET OpcionMenu=0
REM Borramos la pantalla
CLS
echo (c) Gemis Daniel Guevara Villeda
echo Empagua
echo Cambio de adaptador a DHCP
echo Espere...
echo Cargando...
echo %DATE% ^|%TIME% 
echo.

REM Retardo
TIMEOUT 3

REM Regresamos el adpatador a DHCP
netsh interface ipv4 set address "Ethernet" source=DHCP
netsh interface ipv4 set dnsservers "Ethernet" source=DHCP

echo.
echo Listo, adaptador en DHCP

PAUSE