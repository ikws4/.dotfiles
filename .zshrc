source ~/.bash_profile
export ZSH="/Users/zhipingne/.oh-my-zsh"

ZSH_THEME=""

plugins=(
  git
  tmux
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
 
# User configuration
# https://github.com/sindresorhus/pure
# fpath+=$HOME/.zsh/pure
# autoload -U promptinit; promptinit
# prompt pure

# Aliases
# alias vim='nvim'
# alias home='cd ~'
# alias blog='cd ~/Dev/Github/blog/'

# Vi keybinding
# bindkey -v

# Locale
export LANG=""
export LC_COLLATE="C"
export LC_CTYPE="UTF-8"
export LC_MESSAGES="C"
export LC_MONETARY="C"
export LC_NUMERIC="C"
export LC_TIME="C"
export LC_ALL=

eval "$(starship init zsh)"
