$username=”ILOadmin”
$password=”tryme”
$iLO="ilo1"
$ISO=”http://130.175.94.25/custom_esxi.iso”

Dismount-HPiLOVirtualMedia -Server $iLO -user $username -pass $password -DisableCertificateAuthentication -Device CDROM -Force
Mount-HPiLOVirtualMedia -Server $iLO -user $username -pass $password -DisableCertificateAuthentication -Device CDROM -ImageURL $ISO

Get-HPiLOHostPower -Server $iLO -user $username -pass $password -DisableCertificateAuthentication
Set-HPiLOHostPower -Server $iLO -user $username -pass $password -DisableCertificateAuthentication -HostPower “Yes”
Get-HPiLOHostPower -Server $iLO -user $username -pass $password -DisableCertificateAuthentication

Get-HPiLOOneTimeBootOrder -Server $iLO -user $username -pass $password -DisableCertificateAuthentication
Set-HPiLOOneTimeBootOrder -Server $iLO -user $username -pass $password -DisableCertificateAuthentication -Device CDROM
Get-HPiLOOneTimeBootOrder -Server $iLO -user $username -pass $password -DisableCertificateAuthentication

### Need to manually Dismount-HPiLOVirtualMedia