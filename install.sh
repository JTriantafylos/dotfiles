#!/usr/bin/env bash

# Setup
src_dir=$(dirname $(realpath $0))

# i3
i3_dir=$HOME/.config/i3
ln -sv "${src_dir}/i3/config" $i3_dir/config
ln -sv "${src_dir}/i3/statusline" $i3_dir/statusline

# termite
termite_dir=$HOME/.config/termite
ln -sv "${src_dir}/termite/config" $termite_dir/config

# zsh
zsh_dir=$HOME
ln -sv "${src_dir}/zsh/zshrc" $zsh_dir/.zshrc
ln -sv "${src_dir}/zsh/zshenv" $zsh_dir/.zshenv

# X11
X11_dir=$HOME/.config/X11
ln -sv "${src_dir}/X11/xinitrc" $X11_dir/xinitrc
ln -sv "${src_dir}/X11/Xresources" $X11_dir/Xresources
ln -sv "${src_dir}/X11/xprofile" $HOME/.xprofile

# neovim
nvim_dir=$HOME/.config/nvim
ln -sv "${src_dir}/nvim/init.vim" $nvim_dir/init.vim
ln -sv "${src_dir}/nvim/coc-settings.json" $nvim_dir/coc-settings.json

# starship
starship_dir=$HOME/.config
ln -sv "${src_dir}/starship/starship.toml" $starship_dir/starship.toml

# wallpaper
wallpaper_dir=$HOME/.config
ln -sv "${src_dir}/wallpaper/wallpaper.jpg" $wallpaper_dir/wallpaper.jpg

#scripts
scripts_dir=$HOME/.local/bin
ln -sv "${src_dir}/scripts/dmenu-fzf" $scripts_dir/dmenu-fzf
ln -sv "${src_dir}/scripts/newterm" $scripts_dir/newterm
