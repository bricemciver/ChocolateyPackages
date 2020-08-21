$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://proximity.cisco.com/windows/Proximity.msi'

$packageArgs = @{
  packageName   = 'cisco-proximity'
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url

  softwareName  = 'proximity*'

  checksum      = 'b37c5a98053fb10543faf01f0cdd7ba493fbdba6b39d050a454058c0444145a5'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" ACCEPTEULA=1"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
