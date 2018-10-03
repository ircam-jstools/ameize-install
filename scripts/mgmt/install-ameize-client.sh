# this script is intended to be sourced, as it defines variables and functions

log "Installing ameize-client"

git clone https://github.com/ircam-jstools/ameize-client /home/pi/ameize/client

npm install --prefix /home/pi/ameize/client

chmod u+x /home/pi/ameize/client/dist/index.js
