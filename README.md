# PowerShell Admin Scripts

A collection of PowerShell scripts I wrote while learning and practicing common system administration tasks.  
These scripts were created as part of my MSSA training and homelab work to automate, troubleshoot, and document typical sysadmin workflows.

---

## 📂 Folders & Scripts

### 📝 Basic / MSSA Scripts
| Script | Purpose |
|-------|---------|
| Get-DriveFreeSpace.ps1 | Displays free/total disk space for local drives. |
| Get-ErrorsLast24h.ps1 | Pulls error events from Application/System logs from the last 24 hours. |
| Get-LoggedOnUsers.ps1 | Lists currently logged-on users. |
| Invoke-CommandMulti.ps1 | Runs a remote command on multiple computers via PowerShell Remoting. |
| NewAndRemoveTempFolder.ps1 | Creates a temp folder, tests write access, then deletes it. |
| Release-DHCP.ps1 | Releases and renews the DHCP lease (network troubleshooting). |
| Restart-PrintSpooler.ps1 | Restarts the Print Spooler service (common fix for stuck print jobs). |
| OUsers.ps1 | Creates sample organizational units and users in an AD lab. |

### ⚙️ Automation & Reporting
| Script | Purpose |
|-------|---------|
| Compare-Folders.ps1 | Compares two folders and outputs missing/extra files. |
| Report-SystemHealth.ps1 | Generates a report of system uptime, disk space, and memory. |
| Watch-LogAndAlert.ps1 | Monitors a log file for errors and alerts if found. |

### 🧰 Functions
| Script | Purpose |
|-------|---------|
| PromptOrPipeline-Computers.ps1 | Accepts computer names from input or pipeline and runs a command. |
| Restart-ServiceWithLogging.ps1 | Restarts a service and logs success/failure to a text file. |

### 🔧 Project Scripts
| Script | Purpose |
|-------|---------|
| ExportImport-Processes.ps1 | Exports running processes to a file and re-imports for comparison. |
| Get-AutoServices.ps1 | Lists services set to start automatically. |
| Get-ComputerInfoTable.ps1 | Outputs key system information in a formatted table. |
| Get-ProcessesByMemory.ps1 | Sorts and shows top processes by memory usage. |
| Get-PSVersion.ps1 | Displays the current PowerShell version. |
| find-powershell.ps1 | Finds all PowerShell installations on a machine. |

### 🌐 Remoting & Multi-System Management
| Script | Purpose |
|-------|---------|
| Basic-Remoting.ps1 | Shows how to connect to a remote computer with PowerShell Remoting. |
| Mini-Remoting.ps1 | Lightweight test of remoting on multiple machines. |

---

## ▶️ Running the Scripts

```powershell
# Allow scripts to run for this session
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# Example: Get drive space
.\Get-DriveFreeSpace.ps1

# Example: Run a remote command
.\Invoke-CommandMulti.ps1 -Computers PC1,PC2 -Command "Get-Service"