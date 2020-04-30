@echo off

:inicio
REM Inicializamos la variable de opción
SET OpcionMenu=0
REM Borramos la pantalla
CLS
echo (c) Gemis Daniel Guevara Villeda
echo 09 de marzo del 2020
echo Empagua
echo Backup de usuario
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
echo ---Script para la realización de backup automático---
echo ----------- de los archivos del usuario -------------
echo -----------------------------------------------------
echo        Escoja una opción en el siguiente menu:
echo 		1. Realizar backup
echo 		2. Salir
echo.

:backuparchivos

	REM Primero preguntaremos en que unidad desea realizar el backup
	echo Ingrese la letra de la unidad donde desea realizar el backup
	set /p Unidad=Letra:
	echo.
	
	REM Después procederemos a crear una carpeta para copiar los archivos en ella
	mkdir %unidad%:\Backup_20200309
	
	mkdir %unidad%:\Backup_20200309\Escritorio
	mkdir %unidad%:\Backup_20200309\Descargas
	mkdir %unidad%:\Backup_20200309\Documentos

GOTO:inicio