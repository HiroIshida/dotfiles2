#!/bin/bash
sudo apt update
sudo apt install git -y
sudo apt install vim-gtk3 -y 
sudo apt install tmux -y 
sudo apt install cmake -y

# setup ubuntu 18~20 workspace (open gnome-tweak and then choose static workspace)
sudo apt install -y gnome-tweak-tool 

# install albert
wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_$(lsb_release -sr)/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_$(lsb_release -sr)/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
sudo apt update 
sudo apt install albert -y --allow-unauthenticated
