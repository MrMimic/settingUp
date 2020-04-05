#!/bin/bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 
# Installation script for every programs, updates and shit when installing a new VM

echo "Starting instalation"


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 
# Ubuntu upgrade
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 

sudo apt-get -y update
sudo apt-get -y upgrade


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 
# Programming installations
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 

sudo apt-get -y install python3 python3-dev python3-venv 

wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo pip3 install --upgrade pip


# Get bashrc from github
wget "https://raw.githubusercontent.com/MrMimic/settingUp/master/bashrc_emeric"
sudo rm ~/.bashrc
mv bashrc_emeric ~/.bashrc
cd ~ && source .bashrc
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #



echo "Finished instalation"



