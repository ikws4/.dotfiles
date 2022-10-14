#!/bin/bash

CONFIGS="
  alacritty
  fish
  git
  gradle
  ideavim
  julia
  karabiner
  nvim
  omnisharp
  skhd
  tmux
  vim
  wallpapper
  yabai
"

TPM_PATH=~/.local/tmux/plugins/tpm

function install() {
  # Add tmux-256color (with strikethrough)
  echo "Install tmux-256color (with strikethrough support)"
  sudo tic -xe tmux-256color terminfo/tmux-256color.info

  for dir in $CONFIGS; do
    if [ -d $dir ]; then
      # stow $dir
      echo "Installing $dir"
      stow -R $dir
    else
      echo "Directory $dir does not exist"
    fi
  done

  # install tpm
  if [[ ! -d $TPM_PATH ]]; then
    git clone https://github.com/tmux-plugins/tpm $TPM_PATH
  fi
}

function uninstall() {
  for dir in $CONFIGS; do
    if [ -d $dir ]; then
      # stow $dir
      echo "Uninstall $dir"
      stow -D $dir
    else
      echo "Directory $dir does not exist"
    fi
  done

  # uninstall tpm
  if [[ -d $TPM_PATH ]]; then
    rm -rf $TPM_PATH
  fi
}

case $1 in
  install|uninstall)
    $1
    ;;
  *)
    echo "manager [install|uninstall]"
    ;;
esac
