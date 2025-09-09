param(
  [string]$OutputPath = ".\SystemReport.html"
)

# Uptime
$os = Get-CimInstance Win32_OperatingSystem
$lastBoot = $os.LastBootUpTime
$uptime = (Get-Date) - $lastBoot
$uptimeTable = [pscustomobject]@{
  Computer   = $env:COMPUTERNAME
  LastBoot   = $lastBoot
  UptimeDays = [math]::Round($uptime.TotalDays,2)
} | ConvertTo-Html -Fragment -PreContent "<h2>Uptime</h2>"

# Disk (FileSystem drives)
$disk = Get-PSDrive -PSProvider FileSystem | Select-Object Name, @{n='Used(GB)';e={[math]::Round(($_.Used/1GB),2)}}, @{n='Free(GB)';e={[math]::Round(($_.Free/1GB),2)}}
$diskTable = $disk | ConvertTo-Html -Fragment -PreContent "<h2>Disk Usage</h2>"

# Memory
$memRow = [pscustomobject]@{
  TotalGB = [math]::Round($os.TotalVisibleMemorySize/1MB,2)
  FreeGB  = [math]::Round($os.FreePhysicalMemory/1MB,2)
  UsedGB  = [math]::Round(($os.TotalVisibleMemorySize-$os.FreePhysicalMemory)/1MB,2)
}
$memTable = $memRow | ConvertTo-Html -Fragment -PreContent "<h2>Memory</h2>"

# Assemble
$head = "<title>System Report - $env:COMPUTERNAME</title><style>body{font-family:Segoe UI,Arial} table{border-collapse:collapse} td,th{border:1px solid #ccc;padding:4px}</style>"
$html = ConvertTo-Html -Head $head -PreContent "<h1>System Report - $env:COMPUTERNAME</h1>$(Get-Date)" -PostContent "$uptimeTable$diskTable$memTable"
$html | Out-File -FilePath $OutputPath -Encoding UTF8
Write-Host "Report written to $OutputPath"