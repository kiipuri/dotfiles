#!/bin/sh

cd dwm && sudo make install
cd ../dmenu && sudo make install
cd ..

cp -rp scripts ~/
cp -p .Xresources ~/
cp -p .vimrc ~/

sudo mkdir --parents /usr/local/share/fonts/dotfiles
sudo cp -rp fonts/* /usr/local/share/fonts/dotfiles
fc-cache

sudo pacman -Syu
sudo pacman -S - < packages.txt --noconfirm

git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si --noconfirm

cd ..
rm -rf yay-git

yay -S aur/vundle --noconfirm
vim +PluginInstall +qall

cd ~/
touch .xinitrc
echo -e "xrandr --output Virtual-1 --mode 1920x1080\nexec dwm" > .xinitrc
