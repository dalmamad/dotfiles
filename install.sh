#!/bin/bash

#basic
sudo pacman -S pipewire wireplumber go sed lazygit nodejs npm ripgrep ttf-hack-nerd keyd-git
yay -S arc-x-icons-theme

# i3wm
sudo pacman -S dunst alacritty xclip picom rofi polybar feh maim xdotool xcape blueberry flameshot conky xss-lock xautolock i3lock power-profiles-daemon xfce4-power-manager light
yay -S sct xkb-switch-i3 
# need this for light package
sudo usermod -aG video $USER

# hyprland
sudo pacman -S cliphist slurp grim swayidle polkit-kde-agent qt5-wayland qt6-wayland wofi blueman waybar foot
yay -S satty-bin swaylock-effects-git
# for wayland there are some must have(which i have added them to list above but for more information):
# https://wiki.hyprland.org/Useful-Utilities/Must-have/
# also this tools are also useful:
# https://github.com/hyprland-community/awesome-hyprland

# zsh
sudo pacman -S zsh
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
sudo chsh -s $(which zsh)

# tmux
sudo pacman -S tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

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

# sudo pacman -S postgresql
# sudo systemctl enable postgresql.service 
# sudo systemctl start postgresql.service 
# sudo -u postgres initdb -D /var/lib/postgres/data

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

# applying symbolink for modules
./link-modules.sh
