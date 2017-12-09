$ErrorActionPreference = 'Stop';

$packageName  = $env:ChocolateyPackageName;
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)";
$softwareName = 'docker-machine-sakuracloud*';
$url32        = 'https://github.com/sacloud/docker-machine-sakuracloud/releases/download/__VERSION__/docker-machine-driver-sakuracloud_windows-386.zip';
$url64        = 'https://github.com/sacloud/docker-machine-sakuracloud/releases/download/__VERSION__/docker-machine-driver-sakuracloud_windows-amd64.zip';
$hashType     = 'sha512';
$hash32       = '__HASH32__';
$hash64       = '__HASH64__';

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url32
  url64bit      = $url64
  softwareName  = $softwareName
  checksum      = $hash32
  checksumType  = $hashType
  checksum64    = $hash64
  checksumType64= $hashType
}

# https://chocolatey.org/docs/helpers-install-chocolatey-zip-package
Install-ChocolateyZipPackage @packageArgs
