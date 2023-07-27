$replicavms = Get-VMReplication;
if ($replicavms.Length -eq 0)
	{
	$exitcode = "0"
	$message = "Local_HyperV-Replication - Keine Replikationen eingerichtet"
	}
	else
	{
		foreach ($vm in $replicavms)
		{
			if ($vm.replicationhealth -ne "Normal")
			{
			$brokenreplica += ,@($vm.name, $vm.replicationhealth, $vm.replicationstate);
			}
		}
		if ($brokenreplica.Length -eq 0)
			{
			$exitcode = "0"
			$message = "Local_HyperV-Replication - Alle Replikationen fehlerfrei"
			}
			else
			{
			$stringfrombrokenreplica = $brokenreplica | Out-String
				if ($stringfrombrokenreplica -Contains "Critical")
				{
				$exitcode = "2"
				}
				else
				{
				$exitcode = "1"
				}
			$message = "Local_HyperV-Replication - Replikationsfehler erkannt:"
			}
	}
Write-Host $exitcode $message $brokenreplica