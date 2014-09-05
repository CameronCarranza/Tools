Tools
=====

Just a clone of my Windows tools directory, primarily just a customized Powershell profile w/ some Scripts.

Also has a Minitab 17 Remote Desktop Bypass Powershell script (requires Owexec) to allow you to run Minitab 17 over Remote Desktop when it is normally prohibited.

If you are trying to clone and use everything, it will function best when placed as C:\Tools, then copy C:\Tools\Profile.ps1 to "C:\Windows\System32\WindowsPowerShell\v1.0" so it autoloads every time. Some dependencies may still be unsatisfied but most should be included and satisfied through Aliases (i.e. how typing psexec after loading the profile automatically loads C:\Tools\PSTools\Psexec.exe). I will try to keep this list of Dependencies updated as best as I can.

Quest ActiveRoles Management Shell for Active Directory [Satisfies Tools/Powershell/user_loginlocation.ps1]
http://www.quest.com/powershell/activeroles-server.aspx
