#!/bin/bash

cd "$(dirname "$0")"

filename="execute-on-next-boot.sh"

if [ -f "$filename" ]
then
  echo "> executing commands registered on last boot"
  source "$filename"
  rm -f "$filename"
fi

exit 0