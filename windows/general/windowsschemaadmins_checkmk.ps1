$groupMembers = @(Get-ADGroupMember -Identity "Schema-Admins")


if ($groupmembers.count -eq 0)
{
Write-Host 0 Local_Schema-Admins - Gruppe Schema-Admins ist leer.
}
else
{
Write-Host 2 Local_Schema-Admins - Gruppe Schema-Admins ist nicht leer!
}
