# Dotfiles

This is my Dotfiles repository which include `i3wm`, `hyprland`, `tmux`, `zsh`, `lf` and some other tools.

## Hyprland

<p align="center">
    <img src="./screenshots/hypr-1.png" width="300"/>
    <img src="./screenshots/hypr-2.png" width="300"/>
</p>

## i3wm

<p align="center">
    <img src="./screenshots/i3-1.png" width="300"/>
    <img src="./screenshots/i3-2.png" width="300"/>
</p>

# Install

> this installation script is made for arch linux and is using pacman to install packages. also i'm using endevour os so you may need to install some of the packages that are installed in endevour os by default like graphic drivers if for example you are using vanilla arch.

1. clone repository:

```bash
git clone --recurse-submodules https://github.com/dalmamad/dotfiles.git
```

2. change directory to the repository:

```bash
cd dotfiles
```

3. use `make` to install any configuration you want. For example:

```bash
make i3wm zsh tmux
```

Or you can install all of them:

```bash
make all
```

4. if you installed any of `i3wm` or `hyprland` you need to set ENV variables for them:

- this is the location of ENV variables for `i3wm`:

```sh
dotfiles/i3wm/xprofile/.xprofile
```

- this is the location of ENV variables for `hyprland`:

```sh
dotfiles/hyprland/hypr/envs.conf
```
