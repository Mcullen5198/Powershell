# Creates a folder then removes it
$path = 'C:\Temp\DemoFolder'
New-Item -Path $path -ItemType Directory -Force | Out-Null
# (Do work here if needed)
Remove-Item -Path $path -Recurse -Force
Write-Host "Created and removed: $path"