$username="Administrator@vsphere.local"
$password="tryme"
$server="vcsa1"
$vmhost="esx1"
$esxuser="root"
$esxpass="tryme"
$esxIP="130.175.94.39"
$vcsaIP="130.175.94.57"
$folder="Datacenters"

Connect-VIServer -Server $server -Password $password -User $username

### Create new datacenter

#$folder = Get-Folder -NoRecursion | New-Folder -Name Folder

#New-Datacenter -Location $folder -Name Datacenter | fl

#New-Datacenter -Location $folder -Name Lab -Server vcsa1

Add-VMHost -Name $esxIP -Location Lab -Password $password -Server $vcsaIP -User $username

Disconnect-VIServer