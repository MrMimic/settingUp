#!/bin/bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 
# Installation script for every programs, updates and shit when installing a new computer


echo Starting instalation


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 
# Ubuntu upgrade
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 
sudo apt-get -y update
sudo apt-get -y upgrade


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 
# Utilities installations
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 
sudo apt-get -y install zim
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 
sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D2C19886
sudo apt-get update
sudo apt-get -y install spotify-client spotify-client-gnome-support
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 
sudo apt-get -y install geany
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 
sudo apt-get -y install filezilla
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 
sudo apt-get -y install nautilus-dropbox
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 
wget -O messenger.deb "https://updates.messengerfordesktop.com/download/linux/latest/beta?arch=amd64&pkg=deb"
wait
sudo apt -y install ./*.deb
sudo rm *.deb
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 
# Programming installations
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 
# PHP
sudo apt-get -y install php5
sudo apt-get -y install php
sudo apt-get install php-mysqli
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 
# PYTHON 2.7
sudo apt-get -y install python
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 
# PYTHON 3.5
sudo apt-get -y install python3
sudo apt install -y python3-pip
sudo pip3 install --upgrade pip
# Modules python
sudo pip3 install cython				# Faster execution on python functions
sudo pip3 install requests				# curl for python
sudo pip3 install bs4					# Parse HTML request
sudo pip3 install nltk					# Natural Langage ToolKit
sudo pip3 install certifi   # POST requests
# python3 -c "import nltk ; nltk.download('<MODULE_NAME>')"
sudo pip3 install numpy					# Mathematical array and rapid shit
sudo pip3 install tensorflow-gpu		# Ready for machine learning ?
sudo pip3 install keras					# Text processing
sudo pip3 install pymysql   #SQL connection
sudo pip3 install matplotlib    # DRAWBITCH
sudo apt-get install python3-tk
sudo apt-get install pandas
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 
# R, Rstudio
sudo apt-get -y install r-base
sudo apt-get -y install r-base-dev
wget "https://download1.rstudio.org/rstudio-1.0.136-amd64.deb" 
wait
sudo apt -y install ./*.deb
sudo rm *.deb
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 
# mySQL
sudo apt-get -y install mysql-client
sudo apt-get -y install mysql-server
sudo apt-get -y install mysql-workbench

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 
# System modifications
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# Change launcher links
gsettings set com.canonical.Unity.Launcher favorites "['nautilus-folder-handler.desktop', 'gnome-terminal.desktop', 'x-terminal-emulator.desktop', 'firefox.desktop', 'thunderbird.desktop', 'libreoffice-writer.desktop', 'libreoffice-calc.desktop', 'geany.desktop', 'rstudio.desktop', 'zim.desktop', 'filezilla.desktop', 'spotify.desktop', 'messengerfordesktop.desktop']"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - # 
# Get bashrc from github
wget "https://raw.githubusercontent.com/MrMimic/settingUp/master/bashrc_emeric"
sudo rm ~/.bashrc
mv bashrc_emeric ~/.bashrc
cd ~ && source .bashrc
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #



echo Finished instalation



