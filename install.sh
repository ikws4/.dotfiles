#!/bin/bash

DOTFILES="
  alacritty
  clash
  fish
  git
  ideavim
  karabiner
  nvim
  skhd
  tmux
  vim
  wallpapper
  yabai
  zsh
"

for dir in $DOTFILES; do
  if [ -d $dir ]; then
    # stow $dir
    echo "Install $dir"
    stow -R $dir
  else
    echo "$dir does not exist"
  fi
done
