@echo off

:inicio
REM Inicializamos la variable de opción
SET OpcionMenu=0
SET OpcionMenuInicial=0
REM Borramos la pantalla
CLS
echo (c) Gemis Daniel Guevara Villeda
echo Empagua
echo Mapeo de Unidades de Red
echo Espere...
echo Cargando...
echo %DATE% ^| %TIME% 
echo.

REM Retardo
REM TIMEOUT 3

REM Mostramos el menú

echo ----------------------------------------------------
echo --------------------Bienvenido----------------------
echo ----------------------------------------------------
echo ----- Configuraciones post-instalacion de STC ------
echo ----------------------------------------------------
echo    Escoja un opcion en el siguiente menu:
echo		1. Mapeo de unidad de red
echo		2. Instalacion de TNSNames
echo		3. Instalacion de registros
echo		4. Salir
echo ----------------------------------------------------
echo -------------- GGuevara - Infra - 2020 -------------
echo ----------------------------------------------------
echo.

REM Opciones
set /p OpcionMenuInicial= ^> Seleccione una opcion [1-4]:

REM Validamos la seleccion
IF "%OpcionMenuInicial%"=="1" GOTO asignar
IF "%OpcionMenuInicial%"=="2" GOTO tnsnames
IF "%OpcionMenuInicial%"=="3" GOTO registros
IF "%OpcionMenuInicial%"=="4" GOTO salir

REM Si no se ah ingresado la opción correcta
echo. El numero "%OpcionMenuInicial%" no es una opcion valida, por favor intente de nuevo.
echo.
pause
echo.
goto:inicio

:asignar
	REM Asignamos la unidad de red
	REM net use Z:\\10.4.2.2\master
	NET USE Z: \\10.4.2.2\master /persistent:yes
	REM Borrando pantalla
	CLS
	REM Mostrando mensaje
	echo Asignando unidad...
	echo.
	REM Pausa
	Pause
goto:inicio

:tnsnames
	REM xcopy copiará y reemplazará el archivo que ya se tiene en la carpeta
	xcopy "\\inf-l-001\01 - Compartida\gguevara\ArchivosCompartidos\Oracle\TNSNames\*" C:\orant\NET80\ADMIN /y
	
	REM Borramos la pantalla
	echo.
	echo. Listo, instalacion realizada.
	pause
	
goto:inicio

:registros
REM Borramos pantalla
CLS

REM Mostramos el menú
echo ----------------------------------------------------
echo --------------------Bienvenido----------------------
echo ----------------------------------------------------
echo Instalacion de registros de mapeo de unidades de red
echo para el sistema SIAF
echo ----------------------------------------------------
echo    Escoja un departamento en el siguiente menu:
echo		1. Auditoria
echo		2. Compras
echo		3. Finanzas
echo		4. SIAF
echo		5. Direccion Comercial
echo		6. Regresar
echo ----------------------------------------------------
echo -------------- GGuevara - Infra - 2020 -------------
echo ----------------------------------------------------
echo.

set /p OpcionMenu= ^> Seleccione una opcion [1-5]:

REM Validamos la seleccion
IF "%OpcionMenu%"=="1" GOTO auditoria
IF "%OpcionMenu%"=="2" GOTO compras
IF "%OpcionMenu%"=="3" GOTO finanzas
IF "%OpcionMenu%"=="4" GOTO siaf
IF "%OpcionMenu%"=="5" GOTO dircom
IF "%OpcionMenu%"=="6" GOTO salir

REM Si no se ah ingresado la opción correcta
echo. El numero "%OpcionMenu%" no es una opcion valida, por favor intente de nuevo.
echo.
pause
echo.
goto:inicio

REM Auditoria
:auditoria
	REM Borramos la pantalla
	CLS

	REM Este es el contenido de la Clave, se concatenerá con la letra de la unidad
	SET PuntoyComa=;
	SET Unidad=Z
	SET apu=:\apu\fm
	SET aud=:\aud\fm
	SET bel=:\bel\fm
	SET caj=:\caj\fm
	SET cob=:\cob\fm
	SET dsu=:\dsu\fm
	SET fac=:\fac\fm
	SET INC=:\INC\fm
	SET ins=:\ins\fm
	SET REC=:\REC\fm
	SET siaf=:\siaf\fm
	SET tes=:\tes\fm

	REM Concatenación de todas las carpetas para enviarlas como una sola variable y para que no sea...
	REM ... muy extensa la línea de código
	SET Contenido=%Unidad%%apu%%PuntoyComa%%Unidad%%aud%%PuntoyComa%%Unidad%%bel%%PuntoyComa%%Unidad%%caj%%PuntoyComa%%Unidad%%cob%%PuntoyComa%%Unidad%%dsu%%PuntoyComa%%Unidad%%fac%%PuntoyComa%%Unidad%%INC%%PuntoyComa%%Unidad%%ins%%PuntoyComa%%Unidad%%REC%%PuntoyComa%%Unidad%%siaf%%PuntoyComa%%Unidad%%tes%

	REM Definimos el contenido del registro para los íconos
	SET e97=:\ico\e97
	SET e201=:\ico\e201
	SET e202=:\ico\e202
	SET e203=:\ico\e203
	SET ContenidoIconos=%Unidad%%e97%%PuntoyComa%%Unidad%%e201%%PuntoyComa%%Unidad%%e202%%PuntoyComa%%Unidad%%e203%

	REM Creamos el acceso directo de la aplicacion
	REM En este apartado primero creamos un archivo vbs linea por linea con lo que necesitamos
	REM luego se crea el acceso directo y se elimina el archivo de script creado
	cls
		ECHO Set objShell = WScript.CreateObject("WScript.Shell") >>%USERPROFILE%\Desktop\accsdirecto.vbs
		ECHO ficheroAccesoDirecto = "%USERPROFILE%\Desktop\Auditoria.lnk" >>%USERPROFILE%\Desktop\accsdirecto.vbs
		ECHO Set objAccesoDirecto = objShell.CreateShortcut(ficheroAccesoDirecto) >>%USERPROFILE%\Desktop\accsdirecto.vbs
		ECHO objAccesoDirecto.TargetPath = "C:\orant\BIN\ifrun60.EXE" >>%USERPROFILE%\Desktop\accsdirecto.vbs
		ECHO objAccesoDirecto.Arguments = "Auditoria" >>%USERPROFILE%\Desktop\accsdirecto.vbs
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
	
	REM Si el sistema es de 64 bits
	IF "%PROCESSOR_ARCHITECTURE%" == "AMD64" GOTO x64
	REM Si el sistema es de 32 bits
	IF "%PROCESSOR_ARCHITECTURE%" == "x86" GOTO x32
	
	:x64
		REM Mapeo de formularios
		REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ORACLE /v FORMS60_PATH /t REG_EXPAND_SZ /d %Contenido%
		REM Mapeo de iconos para los formularios
		REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ORACLE /v UI_ICON /t REG_SZ /d %ContenidoIconos%
		
		echo. Listo, registros de auditoria agregados
		pause
		GOTO:inicio
	:x32
		REM Mapeo de formularios
		REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\ORACLE /v FORMS60_PATH /t REG_EXPAND_SZ /d %Contenido%
		REM Mapeo de iconos para los formularios
		REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\ORACLE /v UI_ICON /t REG_SZ /d %ContenidoIconos%

		GOTO:inicio
GOTO:inicio
	
REM Compras
:compras
	
	goto:inicio

REM Finanzas
:finanzas
	
	GOTO:inicio
REM SIAF
:siaf
	REM Borramos la pantalla
	CLS

	REM Este es el contenido de la Clave, se concatenerá con la letra de la unidad
	SET PuntoyComa=;
	SET Unidad=Z
	SET siaffm=:\siaf\fm
	SET siafmn=:\siaf\mn

	REM Concatenación de todas las carpetas para enviarlas como una sola variable y para que no sea...
	REM ... muy extensa la línea de código
	SET Contenido=%Unidad%%siaffm%%PuntoyComa%%Unidad%%siafmn%

	REM Definimos el contenido del registro para los íconos
	SET e97=:\ico\e97
	SET e201=:\ico\e201
	SET e202=:\ico\e202
	SET e203=:\ico\e203
	SET ContenidoIconos=%Unidad%%e97%%PuntoyComa%%Unidad%%e201%%PuntoyComa%%Unidad%%e202%%PuntoyComa%%Unidad%%e203%

	REM Creamos el acceso directo de la aplicacion
	REM En este apartado primero creamos un archivo vbs linea por linea con lo que necesitamos
	REM luego se crea el acceso directo y se elimina el archivo de script creado
	cls
		ECHO Set objShell = WScript.CreateObject("WScript.Shell") >>%USERPROFILE%\Desktop\accsdirecto.vbs
		ECHO ficheroAccesoDirecto = "%USERPROFILE%\Desktop\SIAF.lnk" >>%USERPROFILE%\Desktop\accsdirecto.vbs
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
	
	REM Si el sistema es de 64 bits
	IF "%PROCESSOR_ARCHITECTURE%" == "AMD64" GOTO x64
	REM Si el sistema es de 32 bits
	IF "%PROCESSOR_ARCHITECTURE%" == "x86" GOTO x32
	
	:x64
		REM Mapeo de formularios
		REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ORACLE /v FORMS60_PATH /t REG_EXPAND_SZ /d %Contenido%
		REM Mapeo de iconos para los formularios
		REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ORACLE /v UI_ICON /t REG_SZ /d %ContenidoIconos%
		
		echo. Listo, registros de auditoria agregados
		pause
		GOTO:inicio
	:x32
		REM Mapeo de formularios
		REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\ORACLE /v FORMS60_PATH /t REG_EXPAND_SZ /d %Contenido%
		REM Mapeo de iconos para los formularios
		REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\ORACLE /v UI_ICON /t REG_SZ /d %ContenidoIconos%

		GOTO:inicio
GOTO:inicio

REM Direccion comercial
:dircom
	REM Borramos la pantalla
	CLS

	REM Este es el contenido de la Clave, se concatenerá con la letra de la unidad
	SET PuntoyComa=;
	SET Unidad=Z
	SET apu=:\apu\fm
	SET aud=:\aud\fm
	SET bel=:\bel\fm
	SET caj=:\caj\fm
	SET cob=:\cob\fm
	SET dsufm=:\dsu\fm
	SET apumn=:\apu\mn
	SET fac=:\fac\fm
	SET ins=:\ins\fm
	SET test=:\test\fm
	SET dsumn=:\dsu\mn

	REM Concatenación de todas las carpetas para enviarlas como una sola variable y para que no sea...
	REM ... muy extensa la línea de código
	SET Contenido=%Unidad%%apu%%PuntoyComa%%Unidad%%aud%%PuntoyComa%%Unidad%%bel%%PuntoyComa%%Unidad%%caj%%PuntoyComa%%Unidad%%cob%%PuntoyComa%%Unidad%%dsufm%%PuntoyComa%%Unidad%%apumn%%PuntoyComa%%Unidad%%fac%%PuntoyComa%%Unidad%%ins%%PuntoyComa%%Unidad%%test%%PuntoyComa%%Unidad%%dsumn%%PuntoyComa%

	REM Creamos el acceso directo de la aplicacion
	REM En este apartado primero creamos un archivo vbs linea por linea con lo que necesitamos
	REM luego se crea el acceso directo y se elimina el archivo de script creado
	cls
		ECHO Set objShell = WScript.CreateObject("WScript.Shell") >>%USERPROFILE%\Desktop\accsdirecto.vbs
		ECHO ficheroAccesoDirecto = "%USERPROFILE%\Desktop\DireccionComercial.lnk" >>%USERPROFILE%\Desktop\accsdirecto.vbs
		ECHO Set objAccesoDirecto = objShell.CreateShortcut(ficheroAccesoDirecto) >>%USERPROFILE%\Desktop\accsdirecto.vbs
		ECHO objAccesoDirecto.TargetPath = "C:\orant\BIN\ifrun60.EXE" >>%USERPROFILE%\Desktop\accsdirecto.vbs
		ECHO objAccesoDirecto.Arguments = "instalaciones" >>%USERPROFILE%\Desktop\accsdirecto.vbs
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

	REM Definimos el contenido del registro para los íconos
	SET ico=:\ico
	SET e97=:\ico\e97
	SET e201=:\ico\e201
	SET e202=:\ico\e202
	SET e203=:\ico\e203
	SET ContenidoIconos=%Unidad%%ico%%PuntoyComa%%Unidad%%e97%%PuntoyComa%%Unidad%%e201%%PuntoyComa%%Unidad%%e202%%PuntoyComa%%Unidad%%e203%
	
	REM Si el sistema es de 64 bits
	IF "%PROCESSOR_ARCHITECTURE%" == "AMD64" GOTO x64
	REM Si el sistema es de 32 bits
	IF "%PROCESSOR_ARCHITECTURE%" == "x86" GOTO x32
	
	:x64
		REM Mapeo de formularios
		REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ORACLE /v FORMS60_PATH /t REG_EXPAND_SZ /d %Contenido%
		REM Mapeo de iconos para los formularios
		REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ORACLE /v UI_ICON /t REG_SZ /d %ContenidoIconos%
		
		echo. Listo, registros de auditoria agregados
		pause
		GOTO:inicio
	:x32
		REM Mapeo de formularios
		REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\ORACLE /v FORMS60_PATH /t REG_EXPAND_SZ /d %Contenido%
		REM Mapeo de iconos para los formularios
		REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\ORACLE /v UI_ICON /t REG_SZ /d %ContenidoIconos%

		GOTO:inicio
GOTO:inicio

REM Salir
:salir
	@cls&exit