# Restarts the Print Spooler service
Restart-Service -Name Spooler -Force -ErrorAction Stop
Get-Service Spooler | Select-Object Status, Name