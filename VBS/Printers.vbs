'==========================================================================
' Title: List Printers.vbs' 
' Date: 02/23/2010' 
' Author: Bradley Buskey' 
' Version: 1.00' 
' Updated: 02/23/2010' 
' Purpose: List all printers attached to a workstation' 
'==========================================================================
' Date 03/29/2010
' updated: Chris Daws
' to include mapped network printers
'==========================================================================
' Date: 09/27/2011
' Edited By: Crisco Leet
' Improved InputBox method and fixed error caused by pressing Cancel
'==========================================================================

Const ForAppending = 8 
Const ForReading = 1 

Dim sTitle, WshNetwork, objPrinter, intDrive, intNetLetter

sTitle = "List Printers"
Dim StrComputer
strComputer = InputBox("Enter IP or name of computer to check for " & _
                       "printer list (leave blank to check " & _
                       "local system)." & vbcrlf & vbcrlf & "Remote " & _
                       "checking only from NT type OS to NT type OS " & _
                       "with same Admin level UID & PW", sTitle)
If IsEmpty(strComputer) Then WScript.Quit
strComputer = Trim(strComputer)
If strComputer = "" Then strComputer = "."

Set WshNetwork = CreateObject("WScript.Network") 
Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2") 
Set colInstalledPrinters = objWMIService.ExecQuery("Select * from Win32_Printer") 
Set colItems = objWMIService.ExecQuery("Select * from Win32_ComputerSystem",,48) 
Set WshShell = WScript.CreateObject("WScript.Shell") 
Set objFSO = CreateObject("Scripting.FileSystemObject") 

For Each objItem in colItems 
UserName = objItem.UserName 
arrUserName = Split(UserName, "\", -1, 1) 
varUserName = arrUserName(1) 
Next 

filOutput = varUserName & "_printers.txt" 

If objFSO.FileExists(filOutput) Then 
objFSO.DeleteFile(filOutput) 
End If 

Set objOutputFile = objFSO.OpenTextFile (filOutput, ForAppending, True) 
For Each objPrinter in colInstalledPrinters 
strTest = Left(objPrinter.Name, 2) 
objOutputFile.WriteLine(objPrinter.Name) 
Next 
'objOutputFile.Close


'added
Set objPrinter = WshNetwork.EnumPrinterConnections
'Set objOutputFile = objFSO.OpenTextFile (filOutput, ForAppending, True) 
If objPrinter.Count = 0 Then
WScript.Echo "No Printers Mapped "
else
For intDrive = 0 To (objPrinter.Count -1) Step 2
intNetLetter = IntNetLetter +1
printer = "UNC Path " & objPrinter.Item(intDrive) & " = " & objPrinter.Item(intDrive +1) & " Printer : " & intDrive
objOutputFile.WriteLine(printer)
Next
end if
objOutputFile.Close
'added

 

varOpen = MsgBox("Do you want to view the printers?",36,"View File?") 
If varOpen = vbYes Then 
varCommand = "notepad " & filOutput 
WshShell.Run varCommand,1,False 
End If 

Wscript.Sleep 1500 
MsgBox "Printer mappings have been stored in '" & filOutput & "'.", 64, "Script Complete" 
Wscript.Quit