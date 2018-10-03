# this script is intended to be sourced, as it defines variables and functions

log "Installing jack"

old_pwd="$(pwd)"

sudo apt-get install -y libasound2-dev libsndfile1-dev libreadline-dev libreadline6-dev libtinfo-dev
cd /home/pi/lib
git clone https://github.com/jackaudio/jack2.git --depth 1
cd jack2
./waf configure
./waf build
sudo ./waf install
sudo ldconfig
sudo sh -c "echo @audio - memlock 256000 >> /etc/security/limits.conf"
sudo sh -c "echo @audio - rtprio 75 >> /etc/security/limits.conf"

cd "$old_pwd"
