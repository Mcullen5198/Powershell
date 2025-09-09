param(
    [string[]]$ComputerName
)

# Run hostname on each remote computer
Invoke-Command -ComputerName $ComputerName -ScriptBlock {
    "Computer: $env:COMPUTERNAME"
    Get-Date
}