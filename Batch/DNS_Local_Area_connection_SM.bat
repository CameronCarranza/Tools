@echo off
netsh interface ip set dns "Local Area Connection" static 192.168.55.13
netsh interface ip add dns name="Local Area Connection" addr=192.168.55.12
ipconfig /flushdns