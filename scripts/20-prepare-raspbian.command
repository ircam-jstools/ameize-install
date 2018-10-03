#!/bin/bash

# run in script directory
cd "$(dirname "$0")"
source mgmt/_globals.sh

# pass path to ssh key as argument
ssh_key="$1"

log "Setting up SSH key"

while true; do
    if [[ ! $ssh_key ]] ; then
        echo "> Enter absolute path to private SSH key (e.g. /Users/me/.ssh/id_rsa_ameize): "
        read ssh_key
    fi

    if [ -f "$ssh_key" ] ; then
        read -p "> Use SSH key \"$ssh_key\". Continue (y/N)? " yn
        case $yn in
            [Yy]* )
                break;;
            * )
                unset ssh_key
        esac
    else
        echo "> Error: SSH key \"$ssh_key\" does not exit."
        unset ssh_key
    fi
done

log "Copying \"${ssh_key}\" SSH id to remote device
- When prompted for password, type: \"${default_passwd}\""

ssh-copy-id ${ssh_options} -i "$ssh_key" "${default_user}@${default_hostname}.local"

log "Copying boostrap scripts to remote device
- When prompted for password, type: \"${default_passwd}\""

rsync --recursive -e "ssh ${ssh_options}" mgmt ${default_user}@${default_hostname}.local:~/${project_name}/

log "Now connect to the RaspberryPi (no password should be asked) using:
\`ssh ${ssh_options} ${default_user}@${default_hostname}.local\`

Once connected, run: \"./${project_name}/mgmt/configure\" to finish the installation"
