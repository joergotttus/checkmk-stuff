# hyperv_replica-checkmk.ps1

This is a quick-n-dirty script to monitor HyperV-Replication directly on HyperV-Hosts.
When working with multiple HyperV-Hosts you might use the cluster functionality of CheckMK to monitor the VM states on all of your HyperV-Hosts.
CheckMK delivers some logic to check for VM state, Integration services etc., monitored directly on the VM.

As CheckMK misses same logic for HyperV-Replication I decided to create this short script, deploy it to your HyperV-Hosts.
