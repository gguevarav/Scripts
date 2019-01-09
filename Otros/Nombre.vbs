'Constants (taken from WinReg.h)
Const HKEY_CLASSES_ROOT= &H80000000
Const HKEY_CURRENT_USER= &H80000001
Const HKEY_LOCAL_MACHINE= &H80000002
Const HKEY_USERS= &H80000003

Set oReg = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\default:StdRegProv")

strKeyPath = "SOFTWARE\WOW6432Node\ORACLE\Nuevo"
strValueName = "GDIProcessHandleQuota"
oReg.GetStringValue HKEY_LOCAL_MACHINE, strKeyPath, strValueName, strValue
WScript.echo strValue