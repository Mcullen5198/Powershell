<#
Prompts for computer names if none provided, but also supports pipeline.
Demonstrates param() with ValueFromPipeline and simple action (ping).
#>

[CmdletBinding()]
param(
    [Parameter(ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [string[]]$ComputerName
)

begin {
    $targets = New-Object System.Collections.Generic.List[string]
}
process {
    if ($ComputerName) { $ComputerName | ForEach-Object { $targets.Add($_) } }
}
end {
    if ($targets.Count -eq 0) {
        $inputStr = Read-Host "Enter computer names (comma-separated)"
        $targets.AddRange(($inputStr -split ',' | ForEach-Object { $_.Trim() }) )
    }

    foreach ($c in $targets) {
        try {
            Test-Connection -ComputerName $c -Count 1 -Quiet -ErrorAction Stop | Out-Null
            [pscustomobject]@{ Computer=$c; Reachable=$true }
        }
        catch {
            [pscustomobject]@{ Computer=$c; Reachable=$false; Error=$_.Exception.Message }
        }
    }
}