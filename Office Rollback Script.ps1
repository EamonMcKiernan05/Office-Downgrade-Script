# Make OfficeInstall folder

New-Item -ItemType Directory -Force -Path "C:\OfficeInstall" | Out-Null

# Download Office Deployment Tool (ODT)

[Net.ServicePointManager]::SecurityProtocol='Tls12'; $url=([regex]::Match((Invoke-WebRequest 'https://www.microsoft.com/en-us/download/details.aspx?id=49117' -UseBasicParsing).Content,'href="(https://download\.microsoft\.com/download/[^"]+officedeploymenttool[^"]+\.exe)"')).Groups[1].Value; Invoke-WebRequest $url -OutFile 'C:\OfficeInstall\odt.exe' -UserAgent 'Mozilla/5.0'; Start-Process 'C:\OfficeInstall\odt.exe' '/quiet /extract:C:\OfficeInstall' -Wait; dir C:\OfficeInstall

# Make Uninstall Config

Set-Content -Path "C:\OfficeInstall\uninstall.xml" -Value '<Configuration><Display Level="None" AcceptEULA="TRUE" /><Remove All="TRUE" /></Configuration>' -Encoding UTF8

# Make Install Config for Version 16.0.20026.20140

Set-Content -Path "C:\OfficeInstall\configuration-Office365-x64.xml" -Value '<Configuration><Add OfficeClientEdition="64" Channel="Current" Version="16.0.20026.20140" SourcePath="C:\OfficeInstall"><Product ID="O365ProPlusRetail"><Language ID="en-us" /></Product></Add><Updates Enabled="FALSE" TargetVersion="16.0.20026.20140" /><Property Name="FORCEAPPSHUTDOWN" Value="TRUE" /><Property Name="AUTOACTIVATE" Value="1" /><Display Level="None" AcceptEULA="TRUE" /><Logging Level="Standard" Path="%temp%\OfficeODTLogs" /></Configuration>' -Encoding UTF8

# Run ODT with Uninstall Config

C:\OfficeInstall\setup.exe /configure C:\OfficeInstall\uninstall.xml

# Run ODT with Install Config - Download then Install

C:\OfficeInstall\setup.exe /download C:\OfficeInstall\configuration-Office365-x64.xml
C:\OfficeInstall\setup.exe /configure C:\OfficeInstall\configuration-Office365-x64.xml