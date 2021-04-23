$ErrorActionPreference = 'Stop';

$packageName  = $env:ChocolateyPackageName;
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)";
$softwareName = 'docker-machine-sakuracloud*';
$url32        = 'https://github.com/sacloud/docker-machine-sakuracloud/releases/download/v___VERSION___/docker-machine-driver-sakuracloud___VERSION___windows_386.zip';
#                https://github.com/sacloud/docker-machine-sakuracloud/releases/download/v1.5.0        /docker-machine-driver-sakuracloud_1.5.0_windows_386.zip
$url64        = 'https://github.com/sacloud/docker-machine-sakuracloud/releases/download/v__VERSION__/docker-machine-driver-sakuracloud___VERSION___windows-amd64.zip';
#                https://github.com/sacloud/docker-machine-sakuracloud/releases/download/v1.5.0     /docker-machine-driver-sakuracloud_1.5.0_windows_amd64.zip
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
