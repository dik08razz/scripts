#!/bin/bash

echo ""
echo "Step 1: Update"
echo ""
sleep 2

    sudo dnf upgrade --refresh -y
    clear

echo ""
echo "Step 2: Repository >> RPM Fusion, FWR, Google Chrome"
echo ""
sleep 2

    sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
    sudo dnf install fedora-workstation-repositories -y
    sudo dnf config-manager --set-enabled google-chrome
    clear

echo ""
echo "Step 3: Set flathub"
echo ""
sleep 2

    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    clear

echo ""
echo "Step 4: Install apps"
echo ""
sleep 2

    sudo dnf upgrade --refresh
    sudo dnf install mc neofetch htop mangohud goverlay zsh steam google-chrome-stable -y
    flatpak install telegram pupgui discord heroic lutris -y
    clear

echo ""
echo "Step 5: Cleaning"
echo ""
sleep 2

    sudo dnf remove kmahjongg kmines kpat ksudoku -y
    sudo rm -rf $HOME/scripts
    clear
    neofetch
    sleep 5
    systemctl reboot
