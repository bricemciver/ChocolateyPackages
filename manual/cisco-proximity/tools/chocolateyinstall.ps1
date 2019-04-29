$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://proximity.cisco.com/windows/Proximity.msi'

$packageArgs = @{
  packageName   = 'cisco-proximity'
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url

  softwareName  = 'proximity*'

  checksum      = '9D0BD61A51BA38927D4190A71A02412F65F202A3B828CEA3A42FD67AA2FA5879'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
