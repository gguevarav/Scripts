@echo off
echo (c) Gemis Daniel Guevara Villeda
echo Mapeo de Unidades de Red
echo Espere...
echo Cargando...

SET Unidad=Z
SET Contenido=:\siaf\fm

REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ORACLE /v FORMS60_PATH /t REG_EXPAND_SZ /d %Unidad%%Contenido%

pause