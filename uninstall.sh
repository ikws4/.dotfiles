#!/bin/bash

DOTFILES="
  alacritty
  clash
  fish
  git
  gradle
  ideavim
  julia
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
    stow -D $dir
  else
    echo "$dir does not exist"
  fi
done
