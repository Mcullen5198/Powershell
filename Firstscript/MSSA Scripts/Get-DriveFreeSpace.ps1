# Shows drive letter, free space (GB), total size (GB)
Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" |
Select-Object `
    @{Name='Drive';Expression={$_.DeviceID}},
    @{Name='FreeGB';Expression={[math]::Round($_.FreeSpace/1GB,2)}},
    @{Name='TotalGB';Expression={[math]::Round($_.Size/1GB,2)}}