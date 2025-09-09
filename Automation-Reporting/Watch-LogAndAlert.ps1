param(
  [Parameter(Mandatory)] [string]$Path,
  [Parameter(Mandatory)] [string]$To,
  [Parameter(Mandatory)] [string]$From,
  [Parameter(Mandatory)] [string]$SmtpServer,
  [int]$SmtpPort = 25
)

Write-Host "Watching $Path for 'error'..."
Get-Content -Path $Path -Tail 0 -Wait | ForEach-Object {
  if ($_ -match 'error') {
    $msg = "[$(Get-Date -Format s)] ERROR line detected:`n$_"
    Send-MailMessage -To $To -From $From -SmtpServer $SmtpServer -Port $SmtpPort -Subject "Log Alert: $Path" -Body $msg
    Write-Host "Alert sent."
  }
}