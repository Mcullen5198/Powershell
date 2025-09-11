# DiskCleaner.ps1
# Frees up disk space by cleaning temp files, recycle bin, and Windows Update cache

# Remove temp files
Get-ChildItem -Path $env:TEMP -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue

# Empty Recycle Bin
Clear-RecycleBin -Force -ErrorAction SilentlyContinue

# Clean Windows Update cache
Stop-Service wuauserv -Force
Remove-Item -Path "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
Start-Service wuauserv

# Optional: Clean Windows Temp folder
Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue

# Optional: Clean user temp folders
Get-ChildItem -Path "C:\Users\*\AppData\Local\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue

# Output completion message
Write-Output "Disk cleanup completed successfully."