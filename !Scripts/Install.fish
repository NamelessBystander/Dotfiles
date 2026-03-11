#!/usr/bin/env fish


# ----------------- Init------------------ #

# Update
sudo pacman -Syu

# Base 
sudo pacman -S \
base \
base-devel \
alsa-firmware \
alsa-utils \
fish \
man-db \
linux \
linux-firmware \
linux-headers \
networkmanager \
pipewire \
sddm \
sof-firmware \
tlp \

# Yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si


# --------------- Packages --------------- #

# Applications
sudo pacman -S \
discord \
firefox \
kitty \
neovim \
obsidian \
spotify-launcher \
signal-desktop \
libreoffice 

sudo pacman -S \
peaclock \
btop

# AUR
yay -S \
wasistlos \
onlyoffice-bin 

# --------------- #

# Window Manager
sudo pacman -S \
rofi \
swaybg



yay -S \
oh-my-posh-bin

# --------------- #

# Tools
sudo pacman -S \
blueman \
dunst \
eza \
fzf \
git \
bat \
openssh \
rclone \
stow \
syncthing \
zip \
unzip \
wl-clipboard \
zoxide


sudo pacman -S \
fprintd \
wev \

# --------------- #

# Libraries
sudo pacman -S \
fuse3


# --------------- Packages --------------- #
