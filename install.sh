#!/usr/bin/env bash

# Setup
src_dir=$(dirname $(realpath $0))

# i3
i3_dir=$HOME/.config/i3
ln -sv "${src_dir}/i3/config" $i3_dir/config
ln -sv "${src_dir}/i3/statusline" $i3_dir/statusline

# zsh
zsh_dir=$HOME
ln -sv "${src_dir}/zsh/zshrc" $zsh_dir/.zshrc
ln -sv "${src_dir}/zsh/zlogin" $zsh_dir/.zlogin

# X11
X11_dir=$HOME
ln -sv "${src_dir}/X11/xinitrc" $X11_dir/.xinitrc
ln -sv "${src_dir}/X11/Xresources" $X11_dir/.Xresources

# neovim
nvim_dir=$HOME/.config/nvim
ln -sv "${src_dir}/nvim/init.vim" $nvim_dir/init.vim
ln -sv "${src_dir}/nvim/coc-settings.json" $nvim_dir/coc-settings.json

# picom
picom_dir=$HOME/.config/picom
ln -sv "${src_dir}/picom/picom.conf" $picom_dir/picom.conf

# wallpaper
wallpaper_dir=$HOME
ln -sv "${src_dir}/wallpaper/wallpaper.jpg" $wallpaper_dir/.wallpaper.jpg
