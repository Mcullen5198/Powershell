# Export running processes to CSV and re-import
$path = "$env:TEMP\processes.csv"
Get-Process | Export-Csv -Path $path -NoTypeInformation
Import-Csv -Path $path