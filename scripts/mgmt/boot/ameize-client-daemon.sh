#!/bin/bash

cd "$(dirname "$0")"

source ../_globals.sh

if [ -d "/home/pi/${project_name}/client" ]
then
  echo "launching ${project_name}/client deamon"
  "/home/pi/${project_name}/client/dist/index.js" start
fi
