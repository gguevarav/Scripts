@echo off
echo (c) Gemis Daniel Guevara Villeda
echo Mapeo de Unidades de Red
echo Espere...
echo Cargando...

REM Borramos la pantalla
CLS

REM Solicitamos la letra de la unidad de red
echo Ingrese la letra de la unidad, por defecto es la letra Y:
echo %PROCESSOR_ARCHITECTURE%
set/p Unidad=Letra:


REM Este es el contenido de la Clave, se concatenerá con la letra de la unidad
SET PuntoyComa=;
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

REM Borramos la pantalla Nuevamente:
CLS

REM Mensaje de Cargando
echo Cargando.
TIMEOUT 2
CLS
echo Cargando..
TIMEOUT 2
CLS
echo Cargando...
TIMEOUT 2
CLS

IF "%PROCESSOR_ARCHITECTURE%" EQU "AMD64" (
	REM Mapeo de formularios
	REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ORACLE /v FORMS60_PATH /t REG_EXPAND_SZ /d %Contenido%
	REM Mapeo de iconos para los formularios
	REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ORACLE /v UI_ICON /t REG_SZ /d %ContenidoIconos%
	
	echo Listo, registro agregados!!!
	TIMEOUT 2
)ELSE (
	REM >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

pause