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
sudo ln -s "$current_dir/$link_source" "$destination_dir/"
echo "Symbolic link for $link_source created."
}

link_modules $1 $2
