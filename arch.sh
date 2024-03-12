#!/bin/bash

#var
baseapps="mc htop neofetch timeshift"
kdeapps="ark dolphin dolphin-plugins elisa gwenview kate kcalc kcron kdeconnect kdenetwork-filesharing kdenlive kdialog kfind kgpg kjournald krdc krfb ksystemlog kwalletmanager okular partitionmanager signon-kwallet-extension spectacle" 
asianfonts="adobe-source-han-sans-cn-fonts adobe-source-han-sans-jp-fonts adobe-source-han-sans-kr-fonts adobe-source-han-sans-otc-fonts adobe-source-han-sans-tw-fonts adobe-source-han-serif-cn-fonts adobe-source-han-serif-jp-fonts adobe-source-han-serif-kr-fonts adobe-source-han-serif-otc-fonts adobe-source-han-serif-tw-fonts"
fonts="cantarell-fonts freetype noto-fonts noto-fonts-emoji noto-fonts-cjk noto-fonts-extra ttf-bitstream-vera ttf-dejavu ttf-liberation ttf-opensans"
power="power-profiles-daemon upower"
virtualization="virt-manager qemu-full"


echo ""
echo "Install apps"
echo ""
sleep 1

    sudo pacman -S base-devel steam mangohud goverlay telegram-desktop discord $baseapps $kdeapps $power $virtualization
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

    sudo pacman -S $fonts $asianfonts

echo ""
echo "Install flatpak"
echo ""

    sudo pacman -S flatpak flatpak-kcm

echo ""
echo "Services"
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

    clear
    neofetch

echo ""
echo "Finish"
