# Search event logs for errors in last 24h
$after = (Get-Date).AddDays(-1)
Get-WinEvent -FilterHashtable @{
    LogName = @('Application','System')
    Level   = 2
    StartTime = $after
} | Select-Object TimeCreated, ProviderName, Id, Message |
  Format-Table -AutoSize