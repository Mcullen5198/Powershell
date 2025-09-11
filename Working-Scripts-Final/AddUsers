$UserGroupMap = @{
    "user1@domain.com" = "GroupA"
    "user2@domain.com" = "GroupB"
    "user3@domain.com" = "GroupA"
}

# Email settings
$SmtpServer = "smtp.domain.com"
$From = "admin@domain.com"
$Subject = "Group Membership Update"
$BodyTemplate = "Hello {0},`n`nYou have been added to the group: {1}.`n`nRegards,`nAdmin Team"

foreach ($User in $UserGroupMap.Keys) {
    $Group = $UserGroupMap[$User]
    # Add user to group
    try {
        Add-ADGroupMember -Identity $Group -Members $User -ErrorAction Stop
        Write-Host "Added $User to $Group"
    } catch {
        Write-Warning "Failed to add $User to $Group ${_}"
        continue
    }

    # Send notification email
    $Body = [string]::Format($BodyTemplate, $User, $Group)
    try {
        Send-MailMessage -To $User -From $From -Subject $Subject -Body $Body -SmtpServer $SmtpServer
        Write-Host "Notification sent to $User"
    } catch {
        Write-Warning "Failed to send email to $User ${_}"
    }
}