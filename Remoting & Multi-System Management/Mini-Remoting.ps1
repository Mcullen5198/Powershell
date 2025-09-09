param(
  [Parameter(Mandatory)]
  [string[]]$ComputerName,

  [pscredential]$Credential
)

# Quick reachability check
$up = $ComputerName | ForEach-Object {
  if (Test-Connection -ComputerName $_ -Count 1 -Quiet) { $_ }
}

if (-not $up) { Write-Host "No reachable hosts." ; exit 1 }

# Option A: Simple Invoke-Command (hostname + uptime)
Invoke-Command -ComputerName $up -Credential $Credential -ScriptBlock {
  $uptime = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
  [pscustomobject]@{
    Computer   = $env:COMPUTERNAME
    LastBoot   = $uptime
  }
}

# Option B: Session-based run (gets 3 running services)
$s = @()
try {
  $sessParams = @{ ComputerName = $up; ErrorAction = 'Stop' }
  if ($Credential) { $sessParams.Credential = $Credential }
  $s = New-PSSession @sessParams

  Invoke-Command -Session $s -ScriptBlock {
    Get-Service | Where-Object Status -eq 'Running' | Select-Object -First 3 Name, Status
  }
}
finally {
  if ($s) { Remove-PSSession -Session $s }
}