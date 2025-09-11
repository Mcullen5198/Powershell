param (
    [Parameter(Mandatory=$true)]
    [string]$ComputerName
)

try {
    $adapters = Get-WmiObject -Class Win32_NetworkAdapterConfiguration -ComputerName $ComputerName -Filter "IPEnabled = 'True'"
    foreach ($adapter in $adapters) {
        [PSCustomObject]@{
            ComputerName   = $ComputerName
            Description    = $adapter.Description
            MACAddress     = $adapter.MACAddress
            IPAddress      = ($adapter.IPAddress -join ', ')
            SubnetMask     = ($adapter.IPSubnet -join ', ')
            DefaultGateway = ($adapter.DefaultIPGateway -join ', ')
            DNSServers     = ($adapter.DNSServerSearchOrder -join ', ')
        }
    }
} catch {
    Write-Error "Failed to retrieve network adapter properties from $ComputerName. $_"
}