# Error events (Level 2) from Application and System logs in last 24h
$after = (Get-Date).AddDays(-1)
Get-WinEvent -FilterHashtable @{
  LogName   = @('Application','System')
  Level     = 2
  StartTime = $after
} | Select-Object TimeCreated, ProviderName, Id, LevelDisplayName, Message |
  Format-Table -AutoSize