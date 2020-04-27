#!/usr/bin/env bash

# Setup
src_dir=$(dirname $(realpath $0))

# i3
i3_dir=$home/.config/i3
ln -siv "${src_dir}/i3/config" $i3_dir/config_base

# zsh
zsh_dir=$HOME
ln -siv "${src_dir}/zsh/zshrc" $zsh_dir/.zshrc
ln -siv "${src_dir}/zsh/zprofile" $zsh_dir/.zprofile

# X11
X11_dir=$HOME
ln -siv "${src_dir}/X11/xinitrc" $X11_dir/.xinitrc
