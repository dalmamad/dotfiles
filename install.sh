#!/bin/bash

# installing basics
sudo pacman -S git stow xclip picom rofi polybar lazygit alacritty nodejs npm feh maim ripgrep xdotool xcape blueberry flameshot conky xss-lock 
yay -S ttf-hack-nerd sct xkb-switch-i3

# changing brightness
sudo pacman -S light
sudo usermod -aG video $USER

#installing file manager
sudo pacman -S thunar
sudo pacman -S ranger

#installing editor
sudo pacman -S neovim

# installing databases
sudo pacman -S redis 
# sudo systemctl enable redis.service 
# sudo systemctl start redis.service 

sudo pacman -S postgresql
# sudo systemctl enable postgresql.service 
sudo systemctl start postgresql.service 
sudo -u postgres initdb -D /var/lib/postgres/data

#installing docker
sudo pacman -S docker docker-compose
# sudo systemctl enable docker.service 
# sudo systemctl start docker.service 

#installing video player
sudo pacman -S mpv 

#installing browser
yay -S brave-bin

#appling configs with stow
stow --adopt alacritty i3 lazygit nvim picom polybar ranger rofi xprofile bash mpv
git restore .
