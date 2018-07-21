set -x LANG ja_JP.UTF-8
set -x EDITOR nvim

# rbenv
rbenv init - | source

# Rustup
# set -U fish_user_paths $fish_user_paths $HOME/.cargo/bin

# Go bin
set -U fish_user_paths $fish_user_paths $HOME/go/bin 

