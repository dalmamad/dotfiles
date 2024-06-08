get_link_name(){
  local link_location=$1

  IFS="/" read -ra parts <<< "$link_location"
  local link_name="${parts[-1]}"

  echo $link_name
}

link_modules(){
  local link_source=$1
  local destination_dir=$2
  local current_dir=$(realpath $(dirname "$0"))
  local link_name=$(get_link_name $link_source)


  # Check if the symbolic link already exists
  if [ -e "$destination_dir/$link_name" ] || [ -L "$destination_dir/$link_name" ]; then
    # Remove the existing symbolic link
    sudo rm -rf "$destination_dir/$link_name"
    echo "Existing symbolic link for $link_name removed."
  fi

# Create the new symbolic link
echo "$current_dir"
sudo ln -s "$current_dir/$link_source" "$destination_dir/"
echo "Symbolic link for $link_source created."
}

# Creating symbolic link
## i3wm
link_modules "i3wm/i3" "$HOME/.config"
link_modules "i3wm/picom" "$HOME/.config"
link_modules "i3wm/rofi" "$HOME/.config"
link_modules "i3wm/dunst" "$HOME/.config"
link_modules "i3wm/xprofile/.xprofile" "$HOME"

## hyprland
link_modules "hyprland/hypr" "$HOME/.config"
link_modules "hyprland/waybar" "$HOME/.config"
link_modules "hyprland/wofi" "$HOME/.config"
link_modules "hyprland/mako" "$HOME/.config"

## nvim
link_modules "nvim" "$HOME/.config"

## tools
link_modules "alacritty/alacritty.toml" "$HOME/.config"
link_modules "lazygit" "$HOME/.config"
link_modules "foot" "$HOME/.config"
link_modules "bashrc/.bashrc" "$HOME"
link_modules "zsh/.zshrc" "$HOME"
link_modules "tmux/.tmux.conf" "$HOME"
link_modules "lf" "$HOME/.config"
link_modules "keyd/default.conf" "/etc/keyd"
