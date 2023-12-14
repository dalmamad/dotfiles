# Add your links source and destination_directory here
declare -A i3wm_module_list=(
[0,0]="i3" [0,1]="$HOME/.config"
[1,0]="picom" [1,1]="$HOME/.config"
[2,0]="rofi" [2,1]="$HOME/.config"
[3,0]="dunst" [3,1]="$HOME/.config"
[4,0]=".xprofile" [4,1]="$HOME"
)

declare -A nvim_module_list=(
[0,0]="nvim" [0,1]="$HOME/.config"
)

declare -A tools_module_list=(
[0,0]="alacritty.yml" [0,1]="$HOME/.config"
[1,0]="lazygit" [1,1]="$HOME/.config"
[2,0]=".bashrc" [2,1]="$HOME"
)


link_each(){
  link_source=$1
  destination_dir=$2

  # Check if the symbolic link already exists
  if [ -L "$destination_dir/$link_source" ]; then
    # Remove the existing symbolic link
    rm -rf "$destination_dir/$link_source"
    echo "Existing symbolic link for $link_source removed."
  fi

# Create the new symbolic link
ln -s "$(pwd)/$link_source" "$destination_dir/"
echo "Symbolic link for $link_source created."
}

link_source_list() {
  local -n source_list=$1
  length=$((${#source_list[@]} / 2))

  for ((i=0; i<$length; i++)); do
    link_each ${source_list[$i,0]} ${source_list[$i,1]}
  done
}

cd ./i3wm
link_source_list i3wm_module_list
cd ../

link_source_list nvim_module_list

cd ./tools
link_source_list tools_module_list
cd ../
