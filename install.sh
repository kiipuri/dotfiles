#!/bin/sh

cd dwm && sudo make install
cd ../dmenu && sudo make install
cd ..

cp -rp home/* ~/
cp -rp nvim ~/.config/nvim/
cp -rp picom ~/.config/picom/

sudo mkdir --parents /usr/local/share/fonts/dotfiles/
sudo cp -rp fonts/* /usr/local/share/fonts/dotfiles/
fc-cache

sudo sed -i "/^#Color/ cColor" /etc/pacman.conf
sudo pacman -Syu --noconfirm

git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si --noconfirm

cd ..
rm -rf yay-git

yay -S --noconfirm - < packages.txt

chsh -s /bin/zsh
