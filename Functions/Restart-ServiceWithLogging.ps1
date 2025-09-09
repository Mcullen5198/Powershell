param(
    [Parameter(Mandatory=$true)]
    [string]$ServiceName,

    [string]$LogPath = "$env:TEMP\ServiceRestartErrors.log"
)

try {
    Restart-Service -Name $ServiceName -Force -ErrorAction Stop
    Get-Service -Name $ServiceName | Select-Object Status, Name
}
catch {
    $stamp = (Get-Date).ToString('yyyy-MM-dd HH:mm:ss')
    $msg = "$stamp | $ServiceName | $($_.Exception.Message)"
    Add-Content -Path $LogPath -Value $msg
    Write-Error "Failed to restart '$ServiceName'. Logged to $LogPath"
}