#creating bulk users in Active Directory
Import-Module ActiveDirectory

# Path to CSV file with user data
$csvPath = "FILE PATH"

# Import user data from CSV
$users = Import-Csv -Path $csvPath

foreach ($user in $users) {
    $userParams = @{
        Name               = $user.Name
        SamAccountName     = $user.SamAccountName
        UserPrincipalName  = $user.UserPrincipalName
        GivenName          = $user.GivenName
        Surname            = $user.Surname
        DisplayName        = $user.DisplayName
        Path               = $user.OU
        AccountPassword    = (ConvertTo-SecureString $user.Password -AsPlainText -Force)
        Enabled            = $true
        ChangePasswordAtLogon = $true
    }
    New-ADUser @userParams
}