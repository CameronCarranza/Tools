#Variables
$computer = Read-Host "Computer to Edit DNS Settings On"
$dns1 = Read-Host "DNS Server #1"
$dns2 = Read-Host "DNS Server #2"

#Execution
psexec \\$computer netsh interface ip set dns "Local Area Connection" static $dns1
psexec \\$computer netsh interface ip add dns name="Local Area Connection" addr=$dns2
psexec \\$computer ipconfig /flushdns