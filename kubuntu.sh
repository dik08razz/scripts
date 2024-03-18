#!/bin/bash

cd $HOME

sudo apt update -y
sudo apt upgrade -y

sudo add-apt-repository ppa:kubuntu-ppa/backports -y
sudo apt update -y
sudo apt upgrade -y

wget -qO - https://dl.xanmod.org/archive.key | sudo gpg --dearmor -o /usr/share/keyrings/xanmod-archive-keyring.gpg
echo 'deb [signed-by=/usr/share/keyrings/xanmod-archive-keyring.gpg] http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-release.list
sudo apt update -y
sudo apt install linux-xanmod-x64v2 -y

wget -P $HOME/Downloads https://cdn.cloudflare.steamstatic.com/client/installer/steam.deb

sudo apt install mc neofetch flatpak htop mangohud goverlay gamemode timeshift ssh samba ./Downloads/*.deb -y
clear

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install telegram pupgui discord lutris google-chrome -y
clear

snap remove firefox
sudo apt remove kmahjongg kmines kpat ksudoku -y
sudo apt autoremove -y
sudo rm -rf $HOME/Downloads/*
sudo rm -rf $HOME/scripts

neofetch