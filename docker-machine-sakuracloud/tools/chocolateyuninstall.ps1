﻿$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'docker-machine-driver-sakuracloud*'
  zipFileName   = 'docker-machine-driver-sakuracloud_windows-386.zip'
  zipFileName64 = 'docker-machine-driver-sakuracloud_windows-amd64.zip'
}

$uninstalled = $false

# Only necessary if you did not unpack to package directory - see https://chocolatey.org/docs/helpers-uninstall-chocolatey-zip-package
$os = Get-WmiObject -Class Win32_OperatingSystem;
if ($os.OSarchitecture.Contains("64")) {
  Uninstall-ChocolateyZipPackage -PackageName $packageArgs['packageName'] -ZipFileName $packageArgs['zipFileName']
} else {
  Uninstall-ChocolateyZipPackage -PackageName $packageArgs['packageName'] -ZipFileName $packageArgs['zipFileName64']
}