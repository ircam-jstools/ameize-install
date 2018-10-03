#!/bin/bash

filename="/tmp/raspiaudio.bash"
curl --location script.raspiaudio.com -o "${filename}"

echo "> commenting \`sysreboot\` line as we want to restart later..."
sed -i -e 's/sysreboot$/echo "bypassing system reboot"/g' "$filename"

sudo bash "${filename}" -y

executeOnNextBoot 'amixer -c 0 set Master 100% unmute'
