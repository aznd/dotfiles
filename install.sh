#!/bin/sh
cp -r nvim/ ~/.config/.
cp -r awesome/ ~/.config/.
cp -r rofi/ ~/.config/.
sudo pacman -S --needed fish git thunar rofi
chsh -s /bin/fish
