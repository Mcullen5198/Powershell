# PowerShell SysAdmin Scripts

This repository contains my PowerShell scripts for system and cloud administration practice.  
They are organized by folder for quick navigation and practical use in labs, troubleshooting, and automation.

---

## 📂 Automation & Reporting
Scripts for collecting system data and generating automated reports.

- **Compare-Folders.ps1** – Compare two folders and show differences.
- **Report-SystemHealth.ps1** – Generate a system health report (uptime, disk, memory).
- **Watch-LogAndAlert.ps1** – Monitor logs and send an alert on errors.

---

## 📂 Basic MSSA Scripts
Utility scripts for everyday sysadmin tasks.

- **Get-DriveFreeSpace.ps1** – Display drive letters and free space (GB).
- **Get-ErrorsLast24h.ps1** – Show errors from the last 24 hours.
- **Get-LoggedOnUsers.ps1** – List logged-in users.
- **Invoke-CommandMulti.ps1** – Run commands on multiple computers.
- **NewAndRemoveTempFolder.ps1** – Create and remove a temporary folder.
- **OUUsers/** – Scripts for OU-level user tasks.
- **Release-DHCP.ps1** – Release the DHCP lease.
- **Restart-PrintSpooler.ps1** – Restart the print spooler service.

---

## 📂 Functions
Reusable building blocks for larger scripts.

- **PromptOrPipeline-Computers.ps1** – Accept computer names via prompt or pipeline.
- **Restart-ServiceWithLogging.ps1** – Restart a service and log errors.

---

## 📂 Project Scripts
More advanced and combined tasks.

- **ExportImport-Processes.ps1** – Export and reimport running processes.
- **find-powershell** – Locate the PowerShell executable.
- **Get-AutoServices.ps1** – List services with startup type set to Auto.
- **Get-ComputerInfoTable.ps1** – Output computer info as a table.
- **Get-ErrorsLast24h.ps1** – Project version of the 24-hour error report.
- **Get-ProcessesByMemory.ps1** – Show top processes by memory usage.
- **Get-PSVersion.ps1** – Display installed PowerShell version.

---

## 📂 Remoting & Multi-System Management
Scripts for remote management.

- **Basic-Remoting.ps1** – Open a PowerShell remote session.
- **Mini-Remoting.ps1** – Lightweight remoting example.

---

## 📂 User & Group Management
Scripts for AD user and group administration.

- **AddUsers.ps1** – Create AD users.
- **AddVoice.ps1** – Add mailbox/voice properties to users.
- **Basics.ps1** – Core AD user creation template.
- **BulkUsers.ps1** – Bulk import and create users from CSV.
- **CreateGroups.ps1** – Create AD groups.
- **MoveDisabledtoOU.ps1** – Move disabled users to a specific OU.

---

## 📂 Maintenance & Cleanup
Server and workstation housekeeping.

- **Cleardownloads60days.ps1** – Delete files older than 60 days from Downloads.
- **Cleareventlogstop15.ps1** – Clear top 15 event logs.
- **DiskClean.ps1** – Remove temp files and free up space.
- **RemoteRestart.ps1** – Restart a remote computer.

---

## 📂 Account & Printer Tools
Security and resource lookups.

- **Retrievelockedaccts.ps1** – Find locked-out accounts in AD.
- **RetrieveNetworkadapterprops.ps1** – Get network adapter properties.
- **retrieveprinter.ps1** – Retrieve installed printer info.

---

### 💡 Notes
These scripts are for training and lab practice.  
They cover common sysadmin tasks: AD user/group management, reporting, service restarts, and remote management.