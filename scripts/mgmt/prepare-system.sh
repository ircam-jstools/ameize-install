# this script is intended to be sourced, as it defines variables and functions

log "Adding Node.js (version ${node_version}) package sources to apt-get"

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

apt_get_command="DEBIAN_FRONTEND=noninteractive apt-get -yq"

log "Executing apt-get update"
sudo ${apt_get_command} update

log "Executing apt-get dist-upgrade"
sudo ${apt_get_command} dist-upgrade

log "Executing rpi-update"
while [[ 0 != $(sudo bash -c 'rpi-update 2>&1 > /dev/null ; echo $?') ]] ; do
    echo "$(date): error with rpi-update... Try again."
    sleep 5
done

log "Installing utilities"

sudo ${apt_get_command} install git gcc g++ make locate sox

log "Installing Node.js"

sudo ${apt_get_command} install nodejs
