#!/bin/bash

#var
baseapps="mc htop neofetch timeshift"
kdeapps="filelight ark dolphin dolphin-plugins elisa gwenview kate kcalc kcron kdeconnect kdenetwork-filesharing kdenlive kdialog kfind kgpg kjournald krdc krfb ksystemlog kwalletmanager okular partitionmanager signon-kwallet-extension spectacle" 
fonts="cantarell-fonts freetype noto-fonts noto-fonts-emoji noto-fonts-cjk noto-fonts-extra ttf-bitstream-vera ttf-dejavu ttf-liberation ttf-opensans"
asianfonts="adobe-source-han-sans-cn-fonts adobe-source-han-sans-jp-fonts adobe-source-han-sans-kr-fonts adobe-source-han-sans-otc-fonts adobe-source-han-sans-tw-fonts adobe-source-han-serif-cn-fonts adobe-source-han-serif-jp-fonts adobe-source-han-serif-kr-fonts adobe-source-han-serif-otc-fonts adobe-source-han-serif-tw-fonts"
power="power-profiles-daemon upower"
virtualization="virt-manager qemu-full"
networks="openvpn networkmanager-openvpn sshfs bridge-utils"
gaming="steam mangohud goverlay gamemode gamescope"
social="telegram-desktop discord"

cd $HOME

sudo pacman -S base-devel $gaming $social $baseapps $kdeapps $virtualization $networks --noconfirm
sudo pacman -S $power

git clone https://aur.archlinux.org/yay-bin.git
cd $HOME/yay-bin
makepkg -si
cd $HOME
rm -rf $HOME/yay-bin

yay -Syu google-chrome visual-studio-code-bin heroic-games-launcher-bin --noconfirm

sudo pacman -S $fonts --noconfirm
sudo pacman -S $asianfonts --noconfirm

sudo pacman -S flatpak flatpak-kcm --noconfirm

sudo systemctl start bluetooth
sudo systemctl enable bluetooth

sudo systemctl start sshd
sudo systemctl enable sshd

sudo systemctl start libvirtd.socket
sudo systemctl enable libvirtd.socket

neofetch

