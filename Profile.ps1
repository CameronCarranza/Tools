#Set working directory
set-location C:\Tools\

#Modules
Import-Module ActiveDirectory

#UNIX Prompt
function prompt {
"[$env:username@$([System.Net.Dns]::GetHostName())]$ "
}

#Tool Aliases
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
set-alias ssh "C:\Program Files (x86)\PuTTy\putty.exe"
set-alias putty "C:\Program Files (x86)\PuTTy\putty.exe"
set-alias puttygen "C:\Program Files (x86)\PuTTy\puttygen.exe"
set-alias change_dns "C:\Tools\Powershell\change_dns.ps1"
set-alias allow_remoteaccess "C:\Tools\Powershell\allow_remoteaccess.ps1"
set-alias user_loginlocation "C:\Tools\Powershell\user_loginlocation.ps1"
set-alias rdp "C:\Tools\Powershell\rdp.ps1"


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
