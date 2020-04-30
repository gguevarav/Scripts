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
echo        Escoja una opción en el siguiente menu:
echo 		1. Reemplazar Java Policy (Administrador)
echo		2. Reemplazar exception.sites
echo		3. Agregar sufijos de DNS (Administrador)
echo 		4. Salir
echo.

set /p OpcionMenu= ^> Seleccione una opcion [1-3]:

REM Validamos la seleccion
IF "%OpcionMenu%"=="1" GOTO reemplazopolicy
IF "%OpcionMenu%"=="2" GOTO reemplazosites
IF "%OpcionMenu%"=="3" GOTO sufijo
IF "%OpcionMenu%"=="4" GOTO salir

::Mensaje de error, validación cuando se selecciona una opción fuera de rango
echo. El numero "%OpcionMenu%" no es una opcion valida, por favor intente de nuevo.
echo.
pause
echo.
goto:inicio

:reemplazopolicy

	REM xcopy copiará y reemplazará el archivo que ya se tiene en la carpeta
	xcopy "\\INF-L-001\01 - Compartida\gguevara\ArchivosCompartidos\JAVA\java.policy" "C:\Program Files (x86)\Java\jre1.8.0_121\lib\security\" /y
	
	REM Borramos la pantalla
	echo.
	echo. Listo, configuración realizada.
	pause
	
goto:inicio

:reemplazosites

	REM Obtendremos el usuario que se encuentra activo
	REM Primero almacenaremos el nombre del usuario y
	REM el nombre del equipo en una variable llamada 'text'
	@for /f "delims=" %%n in ('whoami') do @(
		set text=%%n
	)
	REM Dividimos en tokens la variable text con delimitación '\'
	REM para obtener solamente el nombre del usuario que se
	REM encuentra activo
	@for /f "tokens=1-2 delims=\" %%A in ("%text%") do @(
		@set NombreEquipo = %%A
		SET usuario=%%B
	)
	
	REM xcopy "\\INF-L-001\01 - Compartida\gguevara\ArchivosCompartidos\JAVA\exception.sites" %APPDATA%\Sun\Java\Deployment\security\ /y
	xcopy "\\INF-L-001\01 - Compartida\gguevara\ArchivosCompartidos\JAVA\exception.sites" "C:\Users\%usuario%\AppData\LocalLow\Sun\Java\Deployment\security\" /y
	
	echo C:\Users\%usuario%\AppData\LocalLow\Sun\Java\Deployment\security\
	
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