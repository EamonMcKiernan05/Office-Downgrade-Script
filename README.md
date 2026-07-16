# Office-Downgrade-Script
This tool is aimed at IT professionals that want to upgrade/downgrade Microsoft Office on mass using a single Powershell script. I'm too lazy to make a readme so here is one from Qwen3.7 Max:

# Office Downgrade/Rollback Script

A PowerShell automation tool designed for IT professionals to mass downgrade, upgrade, or reinstall Microsoft Office 365 on Windows machines using the official Office Deployment Tool (ODT).

## 🚀 Features
- Automatically downloads and extracts the latest **Office Deployment Tool (ODT)**.
- Dynamically generates required XML configuration files for clean uninstallation and targeted installation.
- Performs a clean deployment: uninstalls existing Office versions before deploying the specified build.
- Targets a specific Office version by default (e.g., `16.0.20026.20140` x64).

## ⚙️ Prerequisites
- **OS**: Windows 11.
- **Permissions**: Must be run as **Administrator/System**.
- **Network**: Active internet connection to download ODT and Office binaries.
- **Execution Policy**: PowerShell must allow script execution (e.g., `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`).

## 🛠️ How It Works
1. Creates a working directory at `C:\OfficeInstall`.
2. Downloads and silently extracts the official Microsoft ODT.
3. Generates `uninstall.xml` to remove existing Office installations.
4. Generates `configuration-Office365-x64.xml` with the target version pin.
5. Executes ODT sequentially to:
   - Uninstall the current Office suite.
   - Download the target Office build.
   - Install the downloaded build.

## 💻 Usage
1. Download the script to your local machine.
2. Open PowerShell **as Administrator**.
3. Navigate to the script directory and execute:
   ```powershell
   .\Office Rollback Script.ps1
