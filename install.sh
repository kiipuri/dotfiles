#!/bin/sh

sudo sed -i "/^#Color/ cColor" /etc/pacman.conf
sudo pacman -Syu --noconfirm

git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si --noconfirm

cd ..
rm -rf paru-bin

paru -S --noconfirm - < packages.txt

# cd dwm && sudo make clean install
# cd ../dmenu && sudo make clean install
# cd ../dwmblocks && sudo make clean install
# cd ..

mkdir $HOME/.config/
cd config
for d in *; do
    ln -sf $(pwd)/$d $HOME/.config/
done

cd ..

cp autorun.sh ~/
cp -r scripts ~/

sudo mkdir --parents /usr/local/share/fonts/dotfiles/
sudo cp -rp fonts/* /usr/local/share/fonts/dotfiles/
fc-cache

chsh -s /bin/zsh

sudo systemctl enable lightdm

# Set default lightdm greeter to lightdm-webkit2-greeter
# sudo sed -i 's/#greeter-session=.*/greeter-session=lightdm-webkit2-greeter/' /etc/lightdm/lightdm.conf

# Set default lightdm-webkit2-greeter theme to Glorious
# sudo sed -i 's/^webkit_theme\s*=\s*\(.*\)/webkit_theme = glorious #\1/g' /etc/lightdm/lightdm-webkit2-greeter.conf
# sudo sed -i 's/^debug_mode\s*=\s*\(.*\)/debug_mode = true #\1/g' /etc/lightdm/lightdm-webkit2-greeter.conf

# Install neovim plugins
nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync" > /dev/null 2>&1
nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync" > /dev/null 2>&1

# export ZDOTDIR environment variable
echo "export ZDOTDIR=$HOME/.config/zsh" > /etc/zsh/zshenv

sudo systemctl enable cronie
(crontab -l 2>/dev/null; echo -e "*/10 * * * * echo \"\$(checkupdates | wc -l)\" > $HOME/scripts/blocks/.updates") | crontab -
