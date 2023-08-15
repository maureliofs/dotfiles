#!/bin/bash

# lista de pacotes instalados no arch:

sudo pacman -S --noconfirm xorg-server \
xorg-apps \
xorg-xinit \
lightdm \
lightdm-gtk-greeter \
lightdm-gtk-greeter-settings \
arandr \
curl \
wget \
git \
stow \
alacritty \ 
rofi \
dunst \
picom \
nitrogen \
lxappearance \
ranger \
neovim \
xdg-user-dirs \
#rodar xdg-user-dirs-update para criar os diretorios
nemo \
nemo-fileroller \
zsh \
zip \
unzip \
pavucontrol \
python-pip \
base-devel \
python-dbus \
network-manager-applet \
numlockx \
neofetch \
ttf-jetbrains-mono-nerd \
discord

# pip install psutil pulsectl python-dbus i3-workspace-names-daemon pulsectl


# AUR
# git clone https://aur.archlinux.org/yay.git
# cd yay && makepkg -si

# yay -S spotify
# yay -S brave-bin
