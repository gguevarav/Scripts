' Este script alimenta un archivo de texto que almacena todos los datos importantes para el respectivo inventario
' (Nombre de Equipo, Usuario Logueado, Numero de Serie, Modelo, Procesador, Capacidad de RAM y Capacidad de Disco Duro)
' Gemis Daniel Guevara Villeda
' 05 de Junio del 2019
' 08:52 PM

'Option Explicit
On Error Resume Next

'Preparamos el numero de serie*******************************************
'Variables donde vamos a insertar la informacion
Dim strDirectory
Dim strFile
strDirectory = "\\10.4.6.99\inventario$\"
'strDirectory = "\\10.4.1.134\inventario\"    'Direccion donde se desea guardar la informacion
strFile = "inventario.txt"                       'Nombre del archivo donde se guardara la informacion

Dim strComputer     ' Variable para el nombre del equipo
Dim strSerial       ' Variable para el numero de serie
strComputer = "."
Set objWMIService = GetObject("winmgmts:" & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colSMBIOS = objWMIService.ExecQuery ("Select * from Win32_SystemEnclosure")

For Each objSMBIOS in colSMBIOS
	strSerial = objSMBIOS.SerialNumber
Next

'************************************************************************

'Preparamos el nombre de equipo y el usuario logueado********************
set objFSO = CreateObject("Scripting.FileSystemObject")
Set objNetwork = WScript.CreateObject("WScript.Network")
Set objSysInfo = Wscript.createObject("ADSystemInfo")

'GET ADSPATH & FULL NAMES
strHost=objNetwork.Computername
strDNUser=objSysInfo.username
Set objUser = GetObject("LDAP://" & strDNUser)
strUser = objUser.displayname
strDepto = objUser.department
strDescription = objUser.description
strMail = objUser.mail
strLogonName = objUser.sAMAccountName

'************************************************************************

'Preparamos el modelo de la maquina y Tama�o de Memoria RAM**************

Dim strModel ' Donde guardamos el modelo de la maquina
Dim strTotalRAM ' Tama�o de RAM en MB'S

Set colSettings = objWMIService.ExecQuery("Select * from Win32_ComputerSystem")

For Each objComputer in colSettings
	strModel = objComputer.Model
	strTotalRAM = objComputer.TotalPhysicalMemory / 1024 / 1024 & " MB"
Next

'Preparamos el Nombre del Procesador*************************************
Dim strProcessorName

Set colItems = objWMIService.ExecQuery("Select * from Win32_Processor")

For Each objItem in colItems
	strProcessorName = objItem.Name
Next

'Capacidad del Disco Duro************************************************

Const HARD_DISK = 3
Dim strSizeHardDisk

Set colDisks = objWMIService.ExecQuery("Select * from Win32_LogicalDisk Where DriveType = " & HARD_DISK & "")
For Each objDisk in colDisks
	strSizeHardDisk = objDisk.Size / 1024 / 1024 & " MB"
Next

'Version de Windows y Office***********************************************
Dim objShell
Dim strOSVersion
Dim strOfficeVersion

Set objShell = CreateObject("WScript.Shell")

strOSVersion = objShell.RegRead("HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProductName")' Leer el registro para obtener la versi�n del sistema operativo

strOfficeVersion = "Office " & GetOfficeVersionNumber() ' Lectura de la versi�n de office a trav�s de una funci�n.

    Function GetOfficeVersionNumber()
        GetOfficeVersionNumber = "Office no instalado"
        Dim sTempValue
                    ' Read the Classes Root registry hive (it is a memory-only instance amalgamation 
                    ' of HKCU\Software\Classes and HKLM\Software\Classes registry keys) as it contains a 
                    ' source of information for the currently active Microsoft Office Excel application
                    ' major version - it's quicker and easier to read the registry than the file version
                    ' information after a location lookup). The trailing backslash on the line denotes
                    ' that the @ or default registry key value is being queried.
        sTempValue = objShell.RegRead("HKCR\Excel.Application\CurVer\")
        If Len(sTempValue) > 2 Then GetOfficeVersionNumber = Replace(Right(sTempValue, 2), ".", "") ' Check the length of the value found and if greater than 2 digits
                                                                                                    ' then read the last two digits for the major Office version value
    End Function    ' Fin de Funci�n

'************************************************************************

' Para obtener la ip del equipo

strQuery = "SELECT * FROM Win32_NetworkAdapterConfiguration WHERE MACAddress > ''"

Set objWMIService = GetObject( "winmgmts://./root/CIMV2" )
Set colItems2      = objWMIService.ExecQuery( strQuery, "WQL", 48 )
DIM strIP
DIM DireccionMAC

For Each objItem In colItems2
    If IsArray( objItem.IPAddress ) Then
        If UBound( objItem.IPAddress ) = 0 Then
            strIP = objItem.IPAddress(0)
            DireccionMAC = objItem.MACAddress
        Else
            strIP = "IP Addresses: " & Join( objItem.IPAddress, "," )
            DireccionMAC = "IP Addresses: " & Join( objItem.MACAddress, "," )
        End If
    End If
Next

' WScript.Echo strIP

' **************************************************************************

' Insertamos los datos en el archivo de texto

Set objTextFile = objFSO.OpenTextFile(strDirectory & strFile, 8,True)

objTextFile.Writeline(strSerial & ";" & strUser & ";" & strHost & ";" & strModel & ";" & strProcessorName & ";" & strTotalRAM & ";" & strSizeHardDisk & ";" & strOSVersion & ";" & strOfficeVersion & ";" & strDepto & ";" & strDescription & ";" & strMail & ";" & strLogonName & ";" & strIP & ";" & DireccionMAC)
objTextFile.close 

' **************************************************************************
