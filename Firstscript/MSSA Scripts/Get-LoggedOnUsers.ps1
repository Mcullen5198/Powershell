# Shows currently logged-in users (local machine)
try {
    quser
}
catch {
    Write-Host "Fallback method:" -ForegroundColor Yellow
    (Get-CimInstance Win32_ComputerSystem).UserName
}