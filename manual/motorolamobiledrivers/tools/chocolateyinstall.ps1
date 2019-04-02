
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://motorola-global-portal.custhelp.com/euf/assets/downloads/Motorola_Mobile_Drivers_32bit.msi'
$url64      = 'https://motorola-global-portal.custhelp.com/euf/assets/downloads/Motorola_Mobile_Drivers_64bit.msi'

$packageArgs = @{
  packageName   = 'motorolamobiledrivers'
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64
  checksum      = '18C316FD1D3C7FB0B17F2CFAF0A4B1EF252D49B3AAB7CB3E4A41EF7E20E7B199'
  checksumType  = 'sha256'
  checksum64    = '495CDC3FD15A8790686A7802CBAF8E0E85F9A422F252DBB5FB2A613B6443C72A'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
