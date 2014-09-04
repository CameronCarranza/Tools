#Variables
$computer = Read-Host "Computer Name/IP to Perform Minitab Remote Desktop Bypass On"
$username = Read-Host "Please Enter the Full Username (i.e. DOMAIN\f.lastname)"
#First RDP
$msg1 = new-object -comobject wscript.shell
$msg2 = $msg1.popup("Once you are logged in, please X out of the remote desktop window, do not log out normally!",0,"Notice",1)
& mstsc /v:$computer | out-null
#Execution
owexec -c $computer -u $username -k "C:\Program Files (x86)\Minitab\Minitab 17\Mtb.exe"
#Second RDP
mstsc /v:$computer