#!/bin/bash

mkdir -p ~/.config

ln -sf ~/dotfiles/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/dotfiles/.fzf.zsh ~/.fzf.zsh

mkdir -p ~/.config/sheldon
ln -sf ~/dotfiles/dotfiles/.config/sheldon/plugins.toml ~/.config/sheldon/plugins.toml

ln -sf ~/dotfiles/dotfiles/.config/starship.toml ~/.config/starship.toml

ln -sf ~/dotfiles/dotfiles/.hyper.js ~/.hyper.js

ln -sf ~/dotfiles/dotfiles/.vimrc ~/.vimrc

ln -sf ~/dotfiles/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/dotfiles/.tmux ~/.tmux

ln -sf ~/dotfiles/dotfiles/.tigrc ~/.tigrc

ln -sf ~/dotfiles/dotfiles/.screenrc ~/.screenrc

mkdir -p ~/.config/karabiner
ln -sf ~/dotfiles/dotfiles/.config/karabiner/karabiner.json ~/.config/karabiner/karabiner.json


ln -sf ~/dotfiles/Brewfile ~/Brewfile
