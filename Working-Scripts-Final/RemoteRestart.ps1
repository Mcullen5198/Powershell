# Remote Restart Script for Windows Servers

# This script restarts a specified remote server and logs the action.

# Ensure you have the necessary permissions and that the remote server allows remote restarts.
param (
    [Parameter(Mandatory=$true)]
    [string]$ComputerName
)

# Prompt user for confirmation
$confirmation = Read-Host "Are you sure you want to restart $ComputerName? (Y/N)"
if ($confirmation -ne 'Y' -and $confirmation -ne 'y') {
    Write-Host "Restart cancelled."
    exit
}

# Attempt to restart the remote computer
try {
    Restart-Computer -ComputerName $ComputerName -Force -Confirm:$false
    Write-Host "Restart command sent to $ComputerName."
    
# Log the restart action
$logEntry = "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - Restart command sent to $ComputerName"
Add-Content -Path ".\RemoteRestart.log" -Value $logEntry

# Optional: Export log to CSV if requested
$export = Read-Host "Do you want to export the log to CSV? (Y/N)"
if ($export -eq 'Y' -or $export -eq 'y') {
    $logData = Get-Content ".\RemoteRestart.log" | ForEach-Object {
        $parts = $_ -split ' - '
        [PSCustomObject]@{
            DateTime = $parts[0]
            Message  = $parts[1]
        }
    }
    $logData | Export-Csv -Path ".\RemoteRestart.csv" -NoTypeInformation
    Write-Host "Log exported to RemoteRestart.csv"
}
} catch {
Write-Host "Failed to restart $ComputerName. Error: $_"
}