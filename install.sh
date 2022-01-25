#!/bin/bash

DOTFILES="
  alacritty
  clash
  fish
  git
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

# Add tmux-256color (with strikethrough)
echo "Add tmux-256color (with strikethrough support)"
sudo tic -xe tmux-256color terminfo/tmux-256color.info

for dir in $DOTFILES; do
  if [ -d $dir ]; then
    # stow $dir
    echo "Install $dir"
    stow -R $dir
  else
    echo "$dir does not exist"
  fi
done
