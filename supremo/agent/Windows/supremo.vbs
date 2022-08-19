'----------------------------------------------------------
' Plugin for OCS Inventory NG 2.x
' Script :		Retrieve Supremo ID and version
' Version :		La primera
' Date :		18/08/2022
' Authors :		JosepMarPal
'----------------------------------------------------------
' NOTE : Espero que funcione bien
' ---------------------------------------------------------
On Error Resume Next

Set shell = WScript.CreateObject("WScript.Shell")
Set objWMIService = GetObject( "winmgmts://./root/cimv2" )
Set colItems = objWMIService.ExecQuery( "SELECT * FROM Win32_Processor", , 48 )

For Each objItem in colItems
	ArchiOS = objItem.AddressWidth
	If ArchiOS = "32" Then
		Wow = ""
	ElseIf ArchiOS = "64" Then
		Wow = "WOW6432Node\"
	End If
Next

stReg = "HKEY_LOCAL_MACHINE\SOFTWARE\" & Wow & "Supremo\"
Check = shell.RegRead(stReg)
If Err.Number <> 0 Then Wscript.quit

supID = shell.RegRead (stReg & "ClientID")
supVersion = shell.RegRead (stReg & "Version")

Wscript.Echo _
	"<SUPREMO>" & VbCrLf &_
	"<SUPID>" & supID & "</SUPID>" & VbCrLf &_
	"<VERSION>" & supVersion & "</VERSION>" & VbCrLf &_
	"</SUPREMO>"
