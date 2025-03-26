$DomainJoined = (Get-WmiObject -Class Win32_ComputerSystem).PartOfDomain
$NetProfile = Get-NetConnectionProfile

if ($DomainJoined -eq "True" -And $NetProfile.NetworkCategory -eq "DomainAuthenticated") { Write-Host 0 Local_Network-Category - $NetProfile.NetworkCategory }
elseif ($DomainJoined -ne "True" -And $NetProfile.NetworkCategory -eq "Private") { Write-Host 0 Local_Network-Category - $NetProfile.NetworkCategory }
else { Write-Host 2 Local_Network-Category - $NetProfile.NetworkCategory }
