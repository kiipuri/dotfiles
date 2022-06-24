#!/bin/sh

# make, fakeroot

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

sudo systemctl enable lightdm

# Set default lightdm greeter to lightdm-webkit2-greeter
sudo sed -i 's/^\(#?greeter\)-session\s*=\s*\(.*\)/greeter-session = lightdm-webkit2-greeter #\1/ #\2g' /etc/lightdm/lightdm.conf

# Set default lightdm-webkit2-greeter theme to Glorious
sudo sed -i 's/^webkit_theme\s*=\s*\(.*\)/webkit_theme = glorious #\1/g' /etc/lightdm/lightdm-webkit2-greeter.conf
sudo sed -i 's/^debug_mode\s*=\s*\(.*\)/debug_mode = true #\1/g' /etc/lightdm/lightdm-webkit2-greeter.conf
