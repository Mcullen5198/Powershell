# AddVoiceToScript.ps1
# This script reads a text file and uses Windows Text-to-Speech to read it aloud.

param (
    [Parameter(Mandatory=$true)]
    [string]$ScriptPath
)

if (-not (Test-Path $ScriptPath)) {
    Write-Error "File not found: $ScriptPath"
    exit 1
}

# Read the script content
$text = Get-Content $ScriptPath -Raw

# Create the SAPI.SpVoice COM object
$voice = New-Object -ComObject SAPI.SpVoice

# Speak the script content
$voice.Speak($text)
Write-Host "Finished reading the script."