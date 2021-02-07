source ~/.bash_profile
export ZSH="/Users/zhipingne/.oh-my-zsh"

ZSH_THEME=""

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting      
)

source $ZSH/oh-my-zsh.sh
 
# User configuration
# https://github.com/sindresorhus/pure
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

# Display beautiful system info when login zsh
neofetch

# Aliases
alias vim='nvim'
alias home='cd ~'
alias blog='cd ~/Dev/Github/blog/'
