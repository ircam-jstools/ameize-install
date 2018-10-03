#!/bin/bash

# run in script directory
cd "$(dirname "$0")"
source mgmt/_globals.sh

sdcard_path="/Volumes/boot"

if [[ ! -d "${sdcard_path}" ]] ;
then
  log "Error: No SD card found in ${sdcard_path}"
  exit
fi

log "Copying config files into SD Card...
> note: to configure a new WiFi connection edit the
> \"./install-resources/wpa-supplicant\" file and run this script again"

# empty file to enable SSH deamon
cp  "install-resources/ssh" "$sdcard_path"
# # wifi configuration file
cp "install-resources/wpa_supplicant.conf" "$sdcard_path"

diskutil umount /Volumes/boot/

log "Now:
- Insert SD card in your RaspberryPi,
- Boot it,
- Wait for the green LED to switch off,
- Then, continue the setup."
