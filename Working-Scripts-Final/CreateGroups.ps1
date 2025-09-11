# CreateGroups.ps1
# This script creates Active Directory groups

# Define Organizational Unit (OU)
$ou = "OU=Groups,DC=yourdomain,DC=com"
Get-AdOrganizationalUnit -Identify $ou
if (-not $?) {
    Write-Host "The specified OU does not exist. Please create the OU first."
    exit
}

# If the OU does not exist, create it
if (-not (Get-ADOrganizationalUnit -Filter "DistinguishedName -eq '$ou'" -ErrorAction SilentlyContinue)) {
    New-ADOrganizationalUnit -Name "Groups" -Path "DC=yourdomain,DC=com"
    Write-Host "Created OU: Groups"
} else {
    Write-Host "OU already exists: Groups"
}

# Define group names
$groups = @(
    "HR_Group",
    "IT_Group",
    "Finance_Group",
    "Marketing_Group"
)

# Loop through each group and create it
foreach ($group in $groups) {
    if (-not (Get-ADGroup -Filter "Name -eq '$group'" -ErrorAction SilentlyContinue)) {
        New-ADGroup -Name $group -GroupScope Global -Path "OU=Groups,DC=yourdomain,DC=com" -Description "$group created by script"
        Write-Host "Created group: $group"
    } else {
        Write-Host "Group already exists: $group"
    }
}