@echo off
setlocal enabledelayedexpansion

:: Create directory for output
mkdir "wifi_passwords"
cd "wifi_passwords"

:: Export all profiles
netsh wlan export profile key=clear

:: Parse the XML files to extract SSID and Key
for %%f in (*.xml) do (
    echo Processing %%f...
    findstr /r /c:"<name>.*</name>" "%%f" >> results.txt
    findstr /r /c:"<keyMaterial>.*</keyMaterial>" "%%f" >> results.txt
    echo ------------------------- >> results.txt
)

echo Extraction complete. Check results.txt for passwords.
pause
