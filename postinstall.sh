#!/bin/bash

echo ""
echo "Післяінсталяційний скрипт для Kubuntu"
echo "Встановлення останніх оновлень, backports, xanmod та flatpak"
echo ""
echo "Step 1: Update"
echo ""

    sudo apt update -y
    sudo apt upgrade -y
    clear

echo ""
echo "Step 2: Kubuntu Backports"
echo ""

    sudo add-apt-repository ppa:kubuntu-ppa/backports -y
    sudo apt update -y
    sudo apt upgrade -y
    clear

echo ""
echo "Step 3: XanMod"
echo ""

    wget -qO - https://dl.xanmod.org/archive.key | sudo gpg --dearmor -o /usr/share/keyrings/xanmod-archive-keyring.gpg
    echo 'deb [signed-by=/usr/share/keyrings/xanmod-archive-keyring.gpg] http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-release.list
    sudo apt update -y
    sudo apt install linux-xanmod-x64v2 -y
    clear

echo ""
echo "Step 4: Apps"
echo ""
    wget -P $HOME/Downloads https://cdn.cloudflare.steamstatic.com/client/installer/steam.deb

    sudo apt install mc neofetch flatpak htop gnome-disk-utility qbittorrent mangohud goverlay gamemode timeshift ssh samba zsh ./Downloads/*.deb -y
    clear

echo ""
echo "Step 5: Setup Flathub"
echo ""

    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    flatpak install telegram flatseal pupgui discord heroic lutris bottles -y
    clear

echo ""
echo "Step 6: Remove apps"
echo ""

    snap remove firefox
    sudo apt remove libreoffice kmahjongg kmines kpat ksudoku ktorrent snap -y
    sudo apt autoremove -y
    sudo rm -rf $HOME/Downloads/*
echo ""
    clear
    reboot