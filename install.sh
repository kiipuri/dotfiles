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
xrdb ~/.Xresources

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm - < packages.txt

git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si --noconfirm

cd ..
rm -rf yay-git

yay -S aur/vundle --noconfirm
vim +PluginInstall +qall

yay -S --noconfirm aur/oh-my-zsh-git
cp /usr/share/oh-my-zsh/zshrc ~/.zshrc

cd ~/
echo "xrandr --output Virtual-1 --mode 1920x1080
ifstat -t 1 -d 1
exec dwm" > .xinitrc

yay -S --noconfirm zsh-theme-powerlevel10k-git
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
