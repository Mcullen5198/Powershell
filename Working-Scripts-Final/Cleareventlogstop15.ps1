# List top 15 largest event log files on C: drive and clear them

# Get top 15 largest .evtx files
$eventLogs = Get-ChildItem -Path "C:\Windows\System32\winevt\Logs" -Filter *.evtx |
    Sort-Object Length -Descending |
    Select-Object -First 15

Write-Host "Top 15 largest event log files:"
$eventLogs | Select-Object Name, Length | Format-Table -AutoSize

# Clear each event log
foreach ($log in $eventLogs) {
    $logName = [System.IO.Path]::GetFileNameWithoutExtension($log.Name)
    try {
        Write-Host "Clearing event log: $logName"
        Clear-EventLog -LogName $logName
    } catch {
        Write-Warning "Could not clear log: $logName. $_"
    }
}