# Show computer name, OS version, and last boot time in a table
Get-CimInstance Win32_OperatingSystem |
Select-Object CSName, Version, LastBootUpTime |
Format-Table -AutoSize