$downloadsPath = "$env:USERPROFILE\Downloads"
$days = 60

Get-ChildItem -Path $downloadsPath -File -Recurse | Where-Object {
    $_.LastWriteTime -lt (Get-Date).AddDays(-$days)
} | Remove-Item -Force

Set-ScheduledJobOption -Name "ClearDownloads60Days" -RunElevated -ErrorAction SilentlyContinue
if (-not (Get-ScheduledJob -Name "ClearDownloads60Days" -ErrorAction SilentlyContinue)) {
    $trigger = New-JobTrigger -Daily -At 3am
    Register-ScheduledJob -Name "ClearDownloads60Days" -FilePath "$PSScriptRoot\ClearDownloads60Days.ps1" -Trigger $trigger -ScheduledJobOption (Get-ScheduledJobOption -Name "ClearDownloads60Days") -ErrorAction Stop
}