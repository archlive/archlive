#!/bin/sh

rm -rf ./custom/config/*

# Copy & replace custom configuration files
cp -rf ./configs/releng/*           ./custom/config
cp -rf ./custom/source/airootfs/etc ./custom/config/airootfs
cp -rf ./custom/source/airootfs/usr ./custom/config/airootfs

# Append custom configuration to files
cat ./custom/source/packages.x86_64.txt                  >> ./custom/config/packages.x86_64
cat ./custom/source/pacman.conf.txt                      >> ./custom/config/pacman.conf
cat ./custom/source/airootfs/root/customize_airootfs.txt >> ./custom/config/airootfs/root/customize_airootfs.sh

cd custom/config && ./build.sh -v | tee -a archiso.log
