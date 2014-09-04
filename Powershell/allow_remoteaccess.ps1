#Variables
$computer = Read-Host "Computer to Allow Remote Access on"

#Execution
psexec \\$computer -c C:\Tools\Batch\Allow_RA.bat