$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://proximity.cisco.com/windows/Proximity.msi'

$packageArgs = @{
  packageName   = 'cisco-proximity'
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url

  softwareName  = 'proximity*'

  checksum      = '725942439B2299FA348E60D7CED9B6E9F103EE1AD515B8F64089C6EBA3FC4F0C'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" ACCEPTEULA=1"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
