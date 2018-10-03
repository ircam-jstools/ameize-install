# this script is intended to be sourced, as it defines variables and functions

log "Updating hostname from \"${default_hostname}\" to \"${target_hostname}\"."

for file in /etc/hosts /etc/hostname ; do
     sudo sed -i.bak "s/raspberrypi/${target_hostname}/g" "$file"
done
