param(
  [string[]]$Computers = @('PC1','PC2'),
  [string]$Command = 'hostname'
)

# Create sessions, run, then clean up
$sessions = New-PSSession -ComputerName $Computers
try {
  Invoke-Command -Session $sessions -ScriptBlock {
    param($cmd) Invoke-Expression $cmd
  } -ArgumentList $Command
}
finally {
  if ($sessions) { Remove-PSSession -Session $sessions }
}