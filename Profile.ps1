#In order to auto load this profile (or your own variation), move the Profile.ps1 file to "C:\Windows\System32\WindowsPowerShell\v1.0")
#Set working directory
set-location C:\Tools\

#Modules
Import-Module ActiveDirectory

#UNIX Prompt
function prompt {
"[$env:username@$([System.Net.Dns]::GetHostName())]$ "
}

#Tool Aliases
#PSTools
set-alias owexec C:\Tools\OWexec\owexec.exe
set-alias psexec C:\Tools\PSTools\PsExec.exe
set-alias psfile C:\Tools\PSTools\psfile.exe
set-alias psgetsid C:\Tools\PSTools\PsGetsid.exe
set-alias psinfo C:\Tools\PSTools\PsInfo.exe
set-alias pskill C:\Tools\PSTools\pskill.exe
set-alias pslist C:\Tools\PSTools\pslist.exe
set-alias psloggedon C:\Tools\PSTools\PsLoggedon.exe
set-alias psloglist C:\Tools\PSTools\psloglist.exe
set-alias pspasswd C:\Tools\PSTools\pspasswd.exe
set-alias psping C:\Tools\PSTools\psping.exe
set-alias psservice C:\Tools\PSTools\PsService.exe
set-alias psshutdown C:\Tools\PSTools\psshutdown.exe
set-alias pssuspend C:\Tools\PSTools\pssuspend.exe
#Net-SNMP
set-alias encode_keychange "C:\Tools\Executable\Net-SNMP\bin\encode_keychange.exe"
set-alias snmpbulkget "C:\Tools\Executable\Net-SNMP\bin\snmpbulkget.exe"
set-alias snmpbulkwalk "C:\Tools\Executable\Net-SNMP\bin\snmpbulkwalk.exe"
set-alias snmpd "C:\Tools\Executable\Net-SNMP\bin\snmpd.exe"
set-alias snmpdelta "C:\Tools\Executable\Net-SNMP\bin\snmpdelta.exe"
set-alias snmpdf "C:\Tools\Executable\Net-SNMP\bin\snmpdf.exe"
set-alias snmpget "C:\Tools\Executable\Net-SNMP\bin\snmpget.exe"
set-alias snmpgetnext "C:\Tools\Executable\Net-SNMP\bin\snmpgetnext.exe"
set-alias snmpnetstat "C:\Tools\Executable\Net-SNMP\bin\snmpnetstat.exe"
set-alias snmpset "C:\Tools\Executable\Net-SNMP\bin\snmpset.exe"
set-alias snmpstatus "C:\Tools\Executable\Net-SNMP\bin\snmpstatus.exe"
set-alias snmptable "C:\Tools\Executable\Net-SNMP\bin\snmptable.exe"
set-alias snmptest "C:\Tools\Executable\Net-SNMP\bin\snmptest.exe"
set-alias snmptranslate "C:\Tools\Executable\Net-SNMP\bin\snmptranslate.exe"
set-alias snmptrap "C:\Tools\Executable\Net-SNMP\bin\snmptrap.exe"
set-alias snmptrapd "C:\Tools\Executable\Net-SNMP\bin\snmptrapd.exe"
set-alias snmpusm "C:\Tools\Executable\Net-SNMP\bin\snmpusm.exe"
set-alias snmpvacm "C:\Tools\Executable\Net-SNMP\bin\snmpvacm.exe"
set-alias snmpwalk "C:\Tools\Executable\Net-SNMP\bin\snmpwalk.exe"
#Other
set-alias ssh "C:\Program Files (x86)\PuTTy\putty.exe"
set-alias putty "C:\Program Files (x86)\PuTTy\putty.exe"
set-alias puttygen "C:\Program Files (x86)\PuTTy\puttygen.exe"
set-alias change_dns "C:\Tools\Powershell\change_dns.ps1"
set-alias allow_remoteaccess "C:\Tools\Powershell\allow_remoteaccess.ps1"
set-alias user_loginlocation "C:\Tools\Powershell\user_loginlocation.ps1"
set-alias rdp "C:\Tools\Powershell\rdp.ps1"
set-alias ura "C:\Program Files (x86)\Unattended Remote Assistance\URAEXE.exe"
set-alias notepad "C:\Program Files (x86)\Notepad++\notepad++.exe"
set-alias browser_history_viewer "C:\Tools\Executable\Nirsoft\BrowsingHistoryView.exe"
set-alias esxi "C:\Program Files (x86)\VMware\Infrastructure\Virtual Infrastructure Client\Launcher\VpxClient.exe"
set-alias mail "C:\Program Files (x86)\Mozilla Thunderbird\thunderbird.exe"
set-alias pdqinventory "C:\Program Files (x86)\Admin Arsenal\PDQ Inventory\PDQInventoryConsole.exe"
set-alias pdqdeploy "C:\Program Files (x86)\Admin Arsenal\PDQ Deploy\PDQDeployConsole.exe"
set-alias thedude "C:\Program Files (x86)\Dude\dude.exe"
set-alias switchport_miner "C:\Tools\Executable\SwitchPort Miner\sm.exe"

#Su (Change PS User)
function su
{
	param($process="powershell.exe")
	$cred = Get-Credential
	Start-Process $process -Credential $cred -LoadUserProfile
}

#Get Serial
function getserial
{
	$computer = Read-Host "Computer Name"
	$Serial = (Get-WMIObject -Class "Win32_BIOS" -computer $computer | select SerialNumber)
	Write-Host "$computer has service tag: $Serial
"}

#Uptime
function uptime
{
	$computer = read-host "Computer Name"
	$lastboottime = (Get-WmiObject -Class Win32_OperatingSystem -computername $computer).LastBootUpTime
	$sysuptime = (Get-Date) - [System.Management.ManagementDateTimeconverter]::ToDateTime($lastboottime)
	Write-Host "$computer has been up for: " $sysuptime.days "days" $sysuptime.hours "hours" $sysuptime.minutes "minutes" $sysuptime.seconds "seconds
"}
