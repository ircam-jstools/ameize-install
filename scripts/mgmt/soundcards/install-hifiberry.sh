#!/bin/bash

config_file="/boot/config.txt"

sudo sed -i -e 's/^dtparam=audio=on$/# dtparam=audio=on/g' "$config_file"
sudo sed -i "$ a # hifiberry dac+" "$config_file"
sudo sed -i "$ a dtoverlay=hifiberry-dacplus" "$config_file"

executeOnNextBoot 'amixer -c 0 set Master 100% unmute'
