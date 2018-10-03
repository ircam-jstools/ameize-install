#!/bin/bash

filename="audio.injector.scripts_0.1-1_all.deb"
curl --location "https://raw.githubusercontent.com/Audio-Injector/stereo-and-zero/master/${filename}" -o "/tmp/${filename}"

sudo dpkg -i "/tmp/${filename}"
audioInjector-setup.sh

rm "/tmp/${filename}"

# unmute master
executeOnNextBoot 'amixer -c 0 set Master 100% unmute'
executeOnNextBoot 'amixer -c 0 set "Output Mixer HiFi" unmute'
