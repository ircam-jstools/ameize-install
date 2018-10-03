#!/bin/bash

# run in script directory
cd "$(dirname "$0")"
source mgmt/_globals.sh

log "Download latest Raspian Lite (follow redirection)"

# download latest raspian lite (follow redirection)
curl -o raspbian_lite_latest.zip --location https://downloads.raspberrypi.org/raspbian_lite_latest
# unzip raspbian_lite_latest.zip # not necessary, Etcher can flash zip archive of image

log "You can now flash SD cards using Etcher.
Then, eject and insert the card again, to mount it, and continue the setup."
