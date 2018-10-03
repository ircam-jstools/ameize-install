# this script is intended to be sourced, as it defines variables and functions

echo `pwd`
# global variables
project_name="ameize"

default_user="pi"
default_passwd="raspberry"
default_hostname="raspberrypi"

ssh_options="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"

node_version="10"

# utils
log() {
  echo ""
  echo "-------------------------------------------------------------"
  echo "[${project_name}] ${1}"
  echo "-------------------------------------------------------------"
  echo ""
}

executeOnNextBoot() {
  currentDirectory=`pwd`
  execFile="${currentDirectory}/boot/execute-on-next-boot.sh"

  if [ ! -f "$execFile" ]
  then
    echo "> creating ${execFile}..."
    touch $execFile
    echo "#!/bin/bash" >> "$execFile"
    echo "" >> "$execFile"
  fi

  cmd="${1}"
  echo "$1" >> "$execFile"
}
