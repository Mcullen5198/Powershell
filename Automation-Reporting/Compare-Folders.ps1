param(
  [Parameter(Mandatory)] [string]$Left,
  [Parameter(Mandatory)] [string]$Right
)

$leftFiles  = Get-ChildItem -Path $Left  -File -Recurse | Select-Object @{n='RelPath';e={$_.FullName.Substring($Left.Length).TrimStart('\')}}
$rightFiles = Get-ChildItem -Path $Right -File -Recurse | Select-Object @{n='RelPath';e={$_.FullName.Substring($Right.Length).TrimStart('\')}}

Compare-Object -ReferenceObject $leftFiles.RelPath -DifferenceObject $rightFiles.RelPath |
  Select-Object @{n='File';e={$_.InputObject}}, @{n='Location';e={ if ($_.SideIndicator -eq '<=') { 'OnlyInLeft' } else { 'OnlyInRight' } }} |
  Sort-Object Location, File | Format-Table -Auto