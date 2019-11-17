$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://proximity.cisco.com/windows/Proximity.msi'

$packageArgs = @{
  packageName   = 'cisco-proximity'
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url

  softwareName  = 'proximity*'

  checksum      = 'eb05d112b6ab99039dcc3baccb5080ae77f3279beb869be4f7c0c40724f575c7'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" ACCEPTEULA=1"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
