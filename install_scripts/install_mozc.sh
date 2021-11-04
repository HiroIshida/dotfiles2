sudo apt update
sudo apt-get install ibus-mozc -y
killall ibus-daemon
ibus-daemon -d -x &
# Ubuntu18.04 settings -> launguage -> add new Japanese(mozc)
