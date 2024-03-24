#!/bin/bash

# installing basics
sudo pacman -S cliphist slurp grim swayidle polkit-kde-agent pipewire wireplumber qt5-wayland qt6-wayland wofi blueman waybar git go sed xautolock i3lock power-profiles-daemon dunst xclip picom rofi polybar lazygit alacritty nodejs npm feh maim ripgrep xdotool xcape blueberry flameshot conky xss-lock 
yay -S yay -S satty-bin swaylock-effects-git ttf-hack-nerd sct xkb-switch-i3 arc-x-icons-theme keyd-git
# for wayland there are some must have(which i have added them to list above but for more information):
# https://wiki.hyprland.org/Useful-Utilities/Must-have/
# also this tools are also useful:
# https://github.com/hyprland-community/awesome-hyprland

# changing brightness
sudo pacman -S light
sudo usermod -aG video $USER

# installing display manager
sudo pacman -S sddm
# sudo systemctl enable sddm.service 

# installing file manager
sudo pacman -S thunar

# installing editor
sudo pacman -S neovim

# installing databases
sudo pacman -S redis 
# sudo systemctl enable redis.service 
# sudo systemctl start redis.service 

sudo pacman -S postgresql
# sudo systemctl enable postgresql.service 
sudo systemctl start postgresql.service 
sudo -u postgres initdb -D /var/lib/postgres/data

# installing docker
sudo pacman -S docker docker-compose
# sudo systemctl enable docker.service 
# sudo systemctl start docker.service 

# installing video player
sudo pacman -S vlc

# installing browser
yay -S brave-bin

# activating keyd
sudo systemctl enable keyd && sudo systemctl start keyd

# to prevent xrog option reset after udev reload
# sudo touch /etc/systemd/do-not-udevadm-trigger-on-update

#appling symbolink for modules
./link-modules.sh


# remember to add keyd config to config
