#!/bin/bash

# system
sudo dnf install -y arandr atool autoconf cmake dhcpcd feh flameshot fzf htop i3 i3blocks lsscsi neofetch openvpn papirus-icon-theme picom polybar qalculate redshift rofi rxvt-unicode simple-mtpfs speedtest-cli task timew tldr udiskie unrar unzip vifm vim-X11 w3m xclip

pip install tasklib

# via flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub chat.rocket.RocketChat
flatpak install flathub org.telegram.desktop
flatpak install flathub com.dropbox.Client
flatpak install flathub org.videolan.VLC
flatpak install flathub us.zoom.Zoom

# xorg
sudo dnf grouplist hidden -v
sudo dnf install -y @base-x
sudo dnf install xorg-x11-apps

# urxvt
git clone https://github.com/muennich/urxvt-perls/
git clone https://github.com/simmel/urxvt-resize-font
sudo cp ./urxvt-perls/keyboard-select /usr/lib64/urxvt/perl
sudo cp ./urxvt-resize-font/resize-font /usr/lib64/urxvt/perl

# rofi
wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip
sudo cp greenclip /usr/bin
sudo chmod 777 /usr/bin/greenclip
sudo cp greenclip.service /usr/lib/systemd/user
systemctl --user enable greenclip.service
systemctl --user start greenclip.service


# fonts
sudo dnf install -y google-noto-emoji-color-fonts google-noto-emoji-fonts google-droid-fonts-all liberation-fonts
wget https://github.com/erikflowers/weather-icons/blob/master/font/weathericons-regular-webfont.ttf
sudo cp weathericons-regular-webfont.ttf /usr/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip
sudo unzip -o SourceCodePro.zip -d /usr/share/fonts
git clone https://github.com/stark/siji && cd siji
./install.sh
cd ..

fc-cache -f -v

# soft
sudo dnf install -y exiv2 hunspell hunspell-en hunspell-ru hyphen hyphen-en hyphen-ru mcomix mediainfo mediainfo-gui mkvtoolnix-gui mupdf p7zip pinta qbittorrent soundconverter sxiv thunderbird zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps

# vlc
# sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
# sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# sudo dnf install -y vlc
# sudo dnf install -y python-vlc (optional)

sudo systemctl enable sshd
sudo systemctl enable cups.service


