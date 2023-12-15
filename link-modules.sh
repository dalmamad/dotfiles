get_link_name(){
  local link_location=$1

  IFS="/" read -ra parts <<< "$link_location"
  local link_name="${parts[-1]}"

  echo $link_name
}

link_modules(){
  local link_source=$1
  local destination_dir=$2
  local link_name=$(get_link_name $link_source)


  # Check if the symbolic link already exists
  if [ -L "$destination_dir/$link_name" ]; then
    # Remove the existing symbolic link
    rm -rf "$destination_dir/$link_name"
    echo "Existing symbolic link for $link_name removed."
  fi

# Create the new symbolic link
ln -s "$(pwd)/$link_source" "$destination_dir/"
echo "Symbolic link for $link_source created."
}

# Creating symbolic link
## i3wm
link_modules "i3wm/i3" "$HOME/.config"
link_modules "i3wm/picom" "$HOME/.config"
link_modules "i3wm/rofi" "$HOME/.config"
link_modules "i3wm/dunst" "$HOME/.config"
link_modules "i3wm/xprofile/.xprofile" "$HOME"

## nvim
link_modules "nvim" "$HOME/.config"

## tools
link_modules "tools/alacritty/alacritty.yml" "$HOME/.config"
link_modules "tools/lazygit" "$HOME/.config"
link_modules "tools/bashrc/.bashrc" "$HOME"
