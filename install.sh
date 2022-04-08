#!/bin/sh

cd dwm && sudo make install
cd ../dmenu && sudo make install
cd ..

cp -rp scripts ~/
cp -p .Xresources ~/
cp -p .vimrc ~/
cp -p .xinitrc ~/
cp -rp dwmblocks/blocks ~/scripts/

sudo mkdir --parents /usr/local/share/fonts/dotfiles
sudo cp -rp fonts/* /usr/local/share/fonts/dotfiles
fc-cache

sudo sed -i "/^#Color/ cColor" /etc/pacman.conf
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

yay -S --noconfirm zsh-theme-powerlevel10k-git
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
echo -e "\nbindkey -v" >> ~/.zshrc

chsh -s /bin/zsh
