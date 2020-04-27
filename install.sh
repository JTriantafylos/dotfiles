#!/usr/bin/env bash

# Setup
src_dir=$(dirname $(realpath $0))

# i3
i3_dir=$HOME/.config/i3
ln -siv "${src_dir}/i3/config" $i3_dir/config_base
echo

# zsh
zsh_dir=$HOME
ln -siv "${src_dir}/zsh/zshrc" $zsh_dir/.zshrc
echo
ln -siv "${src_dir}/zsh/zprofile" $zsh_dir/.zprofile
echo

# X11
X11_dir=$HOME
ln -siv "${src_dir}/X11/xinitrc" $X11_dir/.xinitrc
echo

# neovim
nvim_dir=$HOME/.config/nvim
ln -siv "${src_dir}/nvim/init.vim" $nvim_dir/init.vim
echo
ln -siv "${src_dir}/nvim/coc-settings.json" $nvim_dir/coc-settings.json
echo
