# If you come from bash you might have to change your $PATH.
source ~/.bash_profile

# Path to your oh-my-zsh installation.
export ZSH="/Users/zhipingne/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting      
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Pretty, minimal and fast ZSH prompt
# https://github.com/sindresorhus/pure
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

# Key binding
bindkey 'jk' vi-cmd-mode


# Aliases
alias v='nvim'
alias vim='nvim'
alias vf='vifm .'
alias home='cd ~'
