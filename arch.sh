#!/bin/bash

kdeapps="ark dolphin dolphin-plugins elisa gwenview kate kbackup kcalc kcron kdeconnect kdenetwork-filesharing kdenlive kdialog kfind kgpg kjournald krdc krfb ksystemlog kwalletmanager okular partitionmanager signon-kwallet-extension spectacle" 
asianfonts="adobe-source-han-sans-cn-fonts adobe-source-han-sans-jp-fonts adobe-source-han-sans-kr-fonts adobe-source-han-sans-otc-fonts adobe-source-han-sans-tw-fonts adobe-source-han-serif-cn-fonts adobe-source-han-serif-jp-fonts adobe-source-han-serif-kr-fonts adobe-source-han-serif-otc-fonts adobe-source-han-serif-tw-fonts"

echo ""
echo "Install apps"
echo ""
sleep 1

    sudo pacman -S base-devel mc htop neofetch steam mangohud goverlay virt-manager qemu telegram-desktop discord $kdeapps
    clear

echo ""
echo "Install yay"
echo ""
sleep 1

    git clone https://aur.archlinux.org/yay-bin.git
    cd ./yay-bin
    makepkg -si
    cd ..
    clear

echo ""
echo "Install Chrome & vscode"
echo ""
sleep 1

    yay -Syu google-chrome visual-studio-code-bin
    clear

echo ""
echo "Install asian font and emoji"
echo ""

    sudo pacman -S noto-fonts-emoji $asianfonts

echo ""
echo "Start services"
echo ""
sleep 1
echo "bluetooth"
    sudo systemctl start bluetooth
    sudo systemctl enable bluetooth
sleep 1

echo ""
echo "sshd"
    sudo systemctl start sshd
    sudo systemctl enable sshd
sleep 1

echo ""
echo "libvirt"
    sudo systemctl start libvirtd.socket
    sudo systemctl enable libvirtd.socket
sleep 1
clear

echo ""
echo "Cleaning"
echo ""
sleep 

    rm -rf $HOME/scripts
    rm -rf $HOME/yay-bin
    clear
    neofetch
    sleep 5
    systemctl reboot
