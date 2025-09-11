# MoveDisabledtoOU.ps1

# Set variables
$sourceOU = "OU=Users,DC=yourdomain,DC=com"      # Change to your source OU
$targetOU = "OU=disabled,DC=yourdomain,DC=com"   # Change to your target OU
$exportPath = "C:\Temp\DisabledUsers.csv"        # Change export path if needed

# Import Active Directory module
Import-Module ActiveDirectory

# Find all disabled users in the source OU
$disabledUsers = Get-ADUser -SearchBase $sourceOU -Filter {Enabled -eq $false}

# Move each disabled user to the target OU
foreach ($user in $disabledUsers) {
    Move-ADObject -Identity $user.DistinguishedName -TargetPath $targetOU
}

# Export the list of moved users
$disabledUsers | Select-Object Name, SamAccountName, DistinguishedName | Export-Csv -Path $exportPath -NoTypeInformation

Write-Host "Moved $($disabledUsers.Count) disabled users to $targetOU and exported the list to $exportPath."