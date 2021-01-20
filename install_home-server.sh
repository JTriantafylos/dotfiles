#!/usr/bin/env bash

# Setup
src_dir=$(dirname $(realpath $0))

# zsh
zsh_dir=$HOME
ln -sv "${src_dir}/zsh/zshrc" $zsh_dir/.zshrc
ln -sv "${src_dir}/zsh/zshenv" $zsh_dir/.zshenv

# neovim
nvim_dir=$HOME/.config/nvim
ln -sv "${src_dir}/nvim/init.vim" $nvim_dir/init.vim
ln -sv "${src_dir}/nvim/coc-settings.json" $nvim_dir/coc-settings.json
ln -sv ${src_dir}/nvim/modules/* $nvim_dir/modules/
