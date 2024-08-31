.PHONY: all basic i3wm hypr zsh lf tmux nvim lazygit keyd extra

all: basic i3wm hypr zsh lf tmux nvim lazygit keyd extra

basic:
	sudo pacman -S pipewire wireplumber go sed nodejs npm ripgrep ttf-hack-nerd tidy jq
	sudo npm install --global yarn
	yay -S arc-x-icons-theme bashmount

i3wm:
	sudo pacman -S i3-wm networkmanager network-manager-applet brightnessctl i3status dunst alacritty xclip picom rofi polybar feh maim xdotool xcape blueberry flameshot conky xss-lock xautolock i3lock power-profiles-daemon xfce4-power-manager i3status-rust
	yay -S sct xkb-switch-i3 betterlockscreen
	./link-modules.sh "i3wm/i3" "$$HOME/.config"
	./link-modules.sh "i3wm/picom" "$$HOME/.config"
	./link-modules.sh "i3wm/rofi" "$$HOME/.config"
	./link-modules.sh "i3wm/dunst" "$$HOME/.config"
	./link-modules.sh "i3wm/xprofile/.xprofile" "$$HOME"
	./link-modules.sh "alacritty/alacritty.toml" "$$HOME/.config"

hypr:
	sudo pacman -S hyprland cliphist slurp grim swayidle polkit-kde-agent qt5-wayland qt6-wayland wofi blueman waybar foot swaybg mako
	yay -S satty-bin swaylock-effects-git
	./link-modules.sh "hyprland/hypr" "$$HOME/.config"
	./link-modules.sh "hyprland/waybar" "$$HOME/.config"
	./link-modules.sh "hyprland/wofi" "$$HOME/.config"
	./link-modules.sh "hyprland/mako" "$$HOME/.config"
	./link-modules.sh "foot" "$$HOME/.config"

zsh:
	sudo pacman -S zsh
	zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
	chsh -s $(which zsh)
	./link-modules.sh "zsh/.zshrc" "$$HOME"

lf:
	sudo pacman -S perl-file-mimeinfo
	yay -S lf
	./link-modules.sh "lf" "$$HOME/.config"

tmux:
	sudo pacman -S tmux
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	~/.tmux/plugins/tpm/bin/install_plugins
	./link_modules.sh "tmux/.tmux.conf" "$$HOME"

nvim:
	sudo pacman -S neovim
	# golang debuger
	sudo pacman -S delve
	./link-modules.sh "nvim" "$$HOME/.config"

lazygit:
	sudo pacman -S lazygit
	./link-modules.sh "lazygit" "$$HOME/.config"

keyd:
	# keyd
	sudo pacman -S keyd
	sudo systemctl enable keyd && sudo systemctl start keyd
	./link-modules.sh "keyd/default.conf" "/etc/keyd"

extra:
	# installing docker
	sudo pacman -S docker docker-compose

	# installing video player
	sudo pacman -S vlc

	# installing browser
	yay -S brave-bin
