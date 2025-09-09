# basic-scripts

PowerShell snippets for common sysadmin tasks.

## Scripts
- `Get-DriveFreeSpace.ps1` — Show free/total space for local disks.
- `Get-LoggedOnUsers.ps1` — Show current logged-in users.
- `Restart-PrintSpooler.ps1` — Restart the Print Spooler service.
- `NewAndRemoveTempFolder.ps1` — Create and then remove a temp folder.
- `Get-ErrorsLast24h.ps1` — Error events from Application/System logs in last 24h.
- `Invoke-CommandMulti.ps1` — Run a command on multiple computers via PS Remoting.

## Run (optional)
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\Get-DriveFreeSpace.ps1
.\Get-LoggedOnUsers.ps1
.\Restart-PrintSpooler.ps1
.\NewAndRemoveTempFolder.ps1
.\Get-ErrorsLast24h.ps1
.\Invoke-CommandMulti.ps1 -Computers PC1,PC2 -Command "Get-Date"