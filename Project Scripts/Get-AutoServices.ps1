Get-Service | Where-Object {$_.StartType -eq 'Automatic'} |
Select-Object -First 10