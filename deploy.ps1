$vCenterInstance = "vcsa1"
$vCenterUser = "administrator@vsphere.local"
$vCenterPass = "tryme"
# This section logs on to the defined vCenter instance above
Connect-VIServer $vCenterInstance -User $vCenterUser -Password $vCenterPass -WarningAction SilentlyContinue

$StartingIp = “130.175.94.59”
$SubNetMask = “255.255.255.192”
$DefaultGateway = “130.175.94.1”
$DNS = “130.175.94.19"
$NumVMs = 3
$DataStore = “datastore3”
$VMNamePrefix = “node”
$Folder = “nodes”
$Template = “golddisk-rhel-x86_64-72server-2q16”
$Cluster = “Lab”
$OSCustSpec = “rhel-7-template”

#Deploy VMs
$VMIP = $StartingIp
For ($count=1;$count -le $NumVMs; $count++) {
    $VMName = $VMNamePrefix + $count
    Get-OSCustomizationSpec -name $OSCustSpec | Get-OSCustomizationNICMapping | Set-OSCustomizationNICMapping -IPMode UseStaticIP -IPAddress $VMIP -SubNetMask $SubNetMask -DefaultGateway $DefaultGateway -dns $DNS
    New-VM -Name $VMName -Template $Template -Datastore $DataStore -ResourcePool $Cluster -Location $Folder -OSCustomizationSpec $OSCustSpec -RunAsync
    $NextIP = $VMIP.Split(“.”)
    $NextIP[3] = [INT]$NextIP[3]+1
    $VMIP = $NextIP -Join“.”
}

#Start VMs
For ($count=1;$count -le $NumVMs; $count++) {
    $VMName = $VMNamePrefix + $count
    While ((Get-VM $VMName).Version -eq “Unknown”) {Write-Host “Waiting to start $VMName”}
    Start-VM $VMName
}
