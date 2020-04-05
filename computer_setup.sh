#!/bin/bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 
# Installation script for quick deployement of a GCP VM

echo "Starting instalation"

# Ubuntu upgrade
sudo apt-get -y update
sudo apt-get -y upgrade

# Install python
sudo apt-get -y install python python-dev
sudo apt-get -y install python3 python3-dev python3-venv

# Install pip
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo pip3 install --upgrade pip

# Get bashrc from github
wget "https://raw.githubusercontent.com/MrMimic/settingUp/master/bashrc_emeric"
sudo rm ~/.bashrc
mv bashrc_emeric ~/.bashrc
source ~/.bashrc

echo "Finished instalation"