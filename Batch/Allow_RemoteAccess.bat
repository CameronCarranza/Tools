@echo off
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fAllowToGetHelp /t REG_DWORD /d 1 /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system /v LocalAccountTokenFilterPolicy /t REG_DWORD /d 1 /f
netsh firewall set service RemoteAdmin enable
netsh firewall set service remotedesktop enable
netsh firewall add portopening protocol=tcp port=135 name=DCOM_TCP135
netsh firewall add allowedprogram program=%windir%\system32\wbem\unsecapp.exe name=WMI
netsh firewall add allowedprogram program=%windir%\system32\dllhost.exe name=Dllhost
