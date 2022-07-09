#!/bin/sh

sudo sed -i "/^#Color/ cColor" /etc/pacman.conf
sudo pacman -Syu --noconfirm

git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si --noconfirm

cd ..
rm -rf yay-git

yay -S --noconfirm - < packages.txt

cd dwm && sudo make clean install
cd ../dmenu && sudo make clean install
cd ../dwmblocks && sudo make clean install
cd ..

cp -rpT home/ ~/

sudo mkdir --parents /usr/local/share/fonts/dotfiles/
sudo cp -rp fonts/* /usr/local/share/fonts/dotfiles/
fc-cache

chsh -s /bin/zsh

sudo systemctl enable lightdm

# Set default lightdm greeter to lightdm-webkit2-greeter
sudo sed -i 's/#greeter-session=.*/greeter-session=lightdm-webkit2-greeter/' /etc/lightdm/lightdm.conf

# Set default lightdm-webkit2-greeter theme to Glorious
sudo sed -i 's/^webkit_theme\s*=\s*\(.*\)/webkit_theme = glorious #\1/g' /etc/lightdm/lightdm-webkit2-greeter.conf
sudo sed -i 's/^debug_mode\s*=\s*\(.*\)/debug_mode = true #\1/g' /etc/lightdm/lightdm-webkit2-greeter.conf

# Install neovim plugins
nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync"

# Copy xsession Lightdm entry
cp ~/.xinitrc ~/.xsession
sudo chmod +x ~/.xsession
sudo mkdir /usr/share/xsessions/
sudo cp -rp xsession.desktop /usr/share/xsessions/

# export ZDOTDIR environment variable
echo "export ZDOTDIR=$HOME/.config/zsh" > /etc/zsh/zshenv
