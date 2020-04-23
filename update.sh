#!/bin/bash
rm Packages
rm Packages.bz2
rm Packages.gz
rm Release
dpkg-scanpackages -m debfiles /dev/null > Packages
bzip2 -c9 Packages > Packages.bz2
gzip -c9 Packages > Packages.gz
PackagesBytes=$(wc -c < Packages)
PackagesbzBytes=$(wc -c < Packages.bz2)
PackagesgzBytes=$(wc -c < Packages.gz)
Packagesmd5=$(md5 Packages| cut -d ' ' -f 1)
Packagesbzmd5=$(md5 Packages.bz2| cut -d ' ' -f 1)
Packagesxzmd5=$(md5 Packages.gz| cut -d ' ' -f 1)
Packagessha256=$(openssl dgst -sha256 Packages| cut -d ' ' -f 2)
Packagesbzsha256=$(openssl dgst -sha256 Packages.bz2| cut -d ' ' -f 2)
Packagesxzsha256=$(openssl dgst -sha256 Packages.gz| cut -d ' ' -f 2)
echo 'Origin: Sa3odka ©
Label: Sa3odka Repo ©
Suite: stable
Version: 1.0
Codename: Sa3odka
Architectures: iphoneos-arm
Components: main
Description: Sa3odka ©
'>> Release