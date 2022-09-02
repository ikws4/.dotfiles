eval "$(/opt/homebrew/bin/brew shellenv)"

starship init fish | source

# Auto color from terminal config
# set -U fish_color_autosuggestion      '#434C5E'
set -U fish_color_autosuggestion      black
set -U fish_color_cancel              -r
set -U fish_color_command             brgreen
set -U fish_color_comment             brmagenta
set -U fish_color_cwd                 green
set -U fish_color_cwd_root            red
set -U fish_color_end                 brmagenta
set -U fish_color_error               brred
set -U fish_color_escape              brcyan
set -U fish_color_history_current     --bold
set -U fish_color_host                normal
set -U fish_color_match               --background=brblue
set -U fish_color_normal              normal
set -U fish_color_operator            cyan
set -U fish_color_param               brblue
set -U fish_color_quote               yellow
set -U fish_color_redirection         bryellow
set -U fish_color_search_match        'bryellow' '--background=brblack'
set -U fish_color_selection           'white' '--bold' '--background=brblack'
set -U fish_color_status              red
set -U fish_color_user                brgreen
set -U fish_color_valid_path          --underline
set -U fish_pager_color_completion    normal
set -U fish_pager_color_description   yellow
set -U fish_pager_color_prefix        'white' '--bold' '--underline'
set -U fish_pager_color_progress      'brwhite' '--background=cyan'

set -gx NO_PROXY localhost,127.0.0.1
# set -gx ANDROID_HOME $HOME/Library/Android/sdk
set -gx ANDROID_SDK_ROOT $HOME/Library/Android/sdk
set -gx ANDROID_NDK_ROOT $ANDROID_SDK_ROOT/ndk/21.1.6352462
set -gx MANPAGER 'nvim +Man!'
set -gx MANWIDTH 999
set -gx LANG 'en_US.UTF-8'
set -gx EDITOR nvim
set -gx all_proxy 'socks5://127.0.0.1:49162'
set -gx http_proxy 'http://127.0.0.1:49162'
set -gx https_proxy 'http://127.0.0.1:49162'
set -gx JAVA_HOME $(/usr/libexec/java_home -v 11)

fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.npm-global/bin
fish_add_path $HOME/.gem/ruby/2.6.0/bin
fish_add_path $HOME/dev/flutter/bin
fish_add_path $HOME/.npm-global/bin

# brew install ruby
fish_add_path /opt/homebrew/opt/ruby/bin
fish_add_path /opt/homebrew/lib/ruby/gems/3.1.0/bin/

alias nvim 'TERM=alacritty JAVA_HOME=$(/usr/libexec/java_home -v 17) command nvim'

function fish_greeting
end

function fish_user_key_bindings
  fish_vi_key_bindings
  bind -M insert -m default jk backward-char force-repaint
  bind -M insert \el accept-autosuggestion
end
