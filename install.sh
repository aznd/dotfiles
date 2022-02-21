#!/bin/sh
cp -r nvim/ ~/.config/.
cp -r awesome/ ~/.config/.
cp -r rofi/ ~/.config/.
cp -r kitty/ ~/.config/.
sudo pacman -S --needed fish git thunar rofi kitty
chsh -s /bin/fish
