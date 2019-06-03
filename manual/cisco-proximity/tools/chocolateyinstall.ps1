$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://proximity.cisco.com/windows/Proximity.msi'

$packageArgs = @{
  packageName   = 'cisco-proximity'
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url

  softwareName  = 'proximity*'

  checksum      = '3EA57E1EFD1EDF46C8D813E7D67643FAC6FE044E8B4B5E47A00B38E1B602D592'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
