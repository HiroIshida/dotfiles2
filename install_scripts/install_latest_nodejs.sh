# 2024/07/08: main purpose of installing node-js is to install pyright-server
# however, there is some problem installing node-js on the compute with ros-melodic 
# Instead you can install pyright from snap
# sudo snap install pyright --classic

# https://askubuntu.com/questions/426750/how-can-i-update-my-nodejs-to-the-latest-version

# NOTE: this uninstall melodic
if [ ! -d "/opt/ros/melodic" ]; then
    sudo apt-get install nodejs-dev node-gyp libssl1.0-dev
    sudo apt install npm -y
    sudo npm cache clean -f
    sudo npm install -g n
    sudo n stable
    sudo n latest
fi

echo "NOTE by Ishida: maybe you need to add 104.16.20.35 registry.npmjs.org to /etc/hosts"
