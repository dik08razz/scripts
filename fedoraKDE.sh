#!/bin/bash

cd $HOME

sudo dnf upgrade --refresh -y

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install fedora-workstation-repositories -y
sudo dnf config-manager --set-enabled google-chrome
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

sudo dnf copr enable atim/heroic-games-launcher
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

sudo dnf upgrade --refresh
sudo dnf install neovim mc neofetch htop kcron mangohud goverlay steam google-chrome-stable code heroic-games-launcher-bin -y
flatpak install telegram discord -y

sudo dnf remove kmahjongg kmines kpat ksudoku -y
    
sudo systemctl start sshd
sudo systemctl enable sshd

neofetch
