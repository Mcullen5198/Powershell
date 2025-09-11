# Retrieve all locked Active Directory user accounts
$lockedAccounts = Search-ADAccount -LockedOut -UsersOnly

# Display locked accounts
$lockedAccounts | Select-Object Name, SamAccountName, LockedOut

# Export options
# Export to CSV
$lockedAccounts | Select-Object Name, SamAccountName, LockedOut | Export-Csv -Path ".\LockedAccounts.csv" -NoTypeInformation

# Export to TXT
$lockedAccounts | Select-Object Name, SamAccountName, LockedOut | Out-File -FilePath ".\LockedAccounts.txt"

# Export to HTML
$lockedAccounts | Select-Object Name, SamAccountName, LockedOut | ConvertTo-Html | Out-File -FilePath ".\LockedAccounts.html"