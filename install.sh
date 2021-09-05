#!/bin/bash

DOTFILES="
  alacritty
  fish
  git
  ideavim
  nvim
  skhd
  tmux
  vim
  wallpapper
  yabai
  zsh
"

for dir in $DOTFILES; do
  if [ -d $dir ]
  then
    # stow $dir
    echo "Install $dir"
  else
    echo "$dir does not exist"
  fi
done
