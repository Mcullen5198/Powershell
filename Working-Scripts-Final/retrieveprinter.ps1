# RetrievePrinters.ps1

# Get list of installed printers
$printers = Get-Printer | Select-Object Name, DriverName, PortName, Shared, Published

# Display the list
$printers | Format-Table -AutoSize

# Export options
$exportPathCSV = "$PSScriptRoot\PrintersList.csv"
$exportPathJSON = "$PSScriptRoot\PrintersList.json"

# Export to CSV
$printers | Export-Csv -Path $exportPathCSV -NoTypeInformation
Write-Host "Printers exported to CSV: $exportPathCSV"

# Export to JSON
$printers | ConvertTo-Json | Set-Content -Path $exportPathJSON
Write-Host "Printers exported to JSON: $exportPathJSON"