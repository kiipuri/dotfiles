#!/bin/sh

if [ -z "$(echo $SUDO_USER)" ]
then
    echo "Run as sudo"
    exit 1
fi

homedir="/home/$(echo $SUDO_USER)"

cd dwm && make install

cd ../dmenu && make install

cd ../slstatus && make install

cd ..
cp -rp scripts $homedir
cp -p .Xresources $homedir
mkdir --parents /usr/local/share/fonts/dotfiles
cp -rp fonts/* /usr/local/share/fonts/dotfiles
fc-cache
