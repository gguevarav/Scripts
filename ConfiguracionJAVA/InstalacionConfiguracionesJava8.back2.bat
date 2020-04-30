@echo off

:inicio
REM Inicializamos la variable de opción
SET OpcionMenu=0
REM Borramos la pantalla
CLS
echo (c) Gemis Daniel Guevara Villeda
echo 5 de marzo del 2020
echo Empagua
echo Mapeo de Unidades de Red
echo Espere...
echo Cargando...
echo %DATE% ^|%TIME% 
echo.

REM Retardo
TIMEOUT 3

REM Mostramos el menú
echo -----------------------------------------------------
echo -------------------- Bienvenido ---------------------
echo -----------------------------------------------------
echo -Reemplazo del archivo java.policy y exception.sites-
echo --para el uso de sistemas web desarrollados en Java--
echo -----------------------------------------------------
echo    Escoja una opción en el siguiente menu:
echo 		1. Reemplazar
echo		2. Agregar sufijos de DNS
echo 		3. Salir
echo.

set /p OpcionMenu= ^> Seleccione una opcion [1-3]:

REM Validamos la seleccion
IF "%OpcionMenu%"=="1" GOTO reemplazo
IF "%OpcionMenu%"=="2" GOTO sufijo
IF "%OpcionMenu%"=="3" GOTO salir

::Mensaje de error, validación cuando se selecciona una opción fuera de rango
echo. El numero "%OpcionMenu%" no es una opcion valida, por favor intente de nuevo.
echo.
pause
echo.
goto:inicio

:reemplazo
	
	REM xcopy copiará y reemplazará el archivo que ya se tiene en la carpeta
	xcopy "\\INF-L-001\01 - Compartida\gguevara\ArchivosCompartidos\JAVA\java.policy" "C:\Program Files (x86)\Java\jre1.8.0_121\lib\security\" /y
	xcopy "\\INF-L-001\01 - Compartida\gguevara\ArchivosCompartidos\JAVA\exception.sites" %APPDATA%\Sun\Java\Deployment\security\ /y
	
	REM Borramos la pantalla
	echo.
	echo. Listo, configuración realizada.
	pause
	
goto:inicio

:sufijo
	
	SET ContenidoClave=empagua.com,muni
	
	REM Reemplazo de claves
	REG ADD HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Tcpip\Parameters /v SearchList /t REG_SZ /d %ContenidoClave%
	REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v SearchList /t REG_SZ /d %ContenidoClave%
	
	REM Reniciamos el adaptador
	REM Deshabilitar
	netsh interface set interface Ethernet disable
	REM Habilitar
	netsh interface set interface Ethernet enable
	
	REM Borramos la pantalla
	echo.
	echo. Listo, sufijos agregados.
	pause
	
goto:inicio

REM Salir
:salir
	@cls&exit