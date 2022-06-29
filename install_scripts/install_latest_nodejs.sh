# https://askubuntu.com/questions/426750/how-can-i-update-my-nodejs-to-the-latest-version
sudo apt-get install nodejs-dev node-gyp libssl1.0-dev
sudo apt install npm -y
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo n latest
