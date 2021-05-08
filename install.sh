#!/usr/bin/env bash

# Setup
src_dir=$(dirname $(realpath $0))

# i3
i3_dir=$HOME/.config/i3
ln -sfv "${src_dir}/i3/config" $i3_dir/config

# sstatus
sstatus_dir=$HOME/.config/sstatus
ln -sfv "${src_dir}/sstatus/config.toml" $sstatus_dir/config.toml

# alacritty
alacritty_dir=$HOME/.config/alacritty
ln -sfv "${src_dir}/alacritty/alacritty.yml" $alacritty_dir/alacritty.yml

# zsh
zsh_dir=$HOME
ln -sfv "${src_dir}/zsh/zshrc" $zsh_dir/.zshrc
ln -sfv "${src_dir}/zsh/zshenv" $zsh_dir/.zshenv

# X11
X11_dir=$HOME/.config/X11
ln -sfv "${src_dir}/X11/xinitrc" $X11_dir/xinitrc
ln -sfv "${src_dir}/X11/Xresources" $X11_dir/Xresources
ln -sfv "${src_dir}/X11/xprofile" $HOME/.xprofile

# XDG
XDG_dir=$HOME/.config/
ln -sfv "${src_dir}/users-dirs.dirs" $XDG_dir/users-dirs.dirs

# GTK2
gtk2_dir=$HOME/.config/gtk-2.0
ln -sfv "${src_dir}/gtk2/gtkrc" $gtk2_dir/gtkrc

# GTK3
gtk3_dir=$HOME/.config/gtk-3.0
ln -sfv "${src_dir}/gtk3/settings.ini" $gtk3_dir/settings.ini

# neovim
nvim_dir=$HOME/.config/nvim
ln -sfv "${src_dir}/nvim/init.vim" $nvim_dir/init.vim
ln -sfv "${src_dir}/nvim/coc-settings.json" $nvim_dir/coc-settings.json
ln -sfv ${src_dir}/nvim/modules/* $nvim_dir/modules/

# starship
starship_dir=$HOME/.config
ln -sfv "${src_dir}/starship/starship.toml" $starship_dir/starship.toml

# zathura
zathura_dir=$HOME/.config/zathura
ln -sfv "${src_dir}/zathura/zathurarc" $zathura_dir/zathurarc

# redshift
redshift_dir=$HOME/.config/redshift
ln -sfv "${src_dir}/redshift/redshift.conf" $redshift_dir/redshift.conf

# wallpaper
wallpaper_dir=$HOME/.config
ln -sfv "${src_dir}/wallpaper/wallpaper2.jpg" $wallpaper_dir/wallpaper.jpg

#scripts
scripts_dir=$HOME/.local/bin
ln -sfv "${src_dir}/scripts/dmenu-fzf" $scripts_dir/dmenu-fzf
ln -sfv "${src_dir}/scripts/newterm" $scripts_dir/newterm
ln -sfv "${src_dir}/scripts/volume" $scripts_dir/volume
ln -sfv "${src_dir}/scripts/carleton-vpn-connect" $scripts_dir/carleton-vpn-connect
ln -sfv "${src_dir}/scripts/carleton-ssh-COMP3000B" $scripts_dir/carleton-ssh-COMP3000B
