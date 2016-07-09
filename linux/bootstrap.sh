#!/bin/sh

cd ${HOME}

DOTFILES_DIR="./dotfiles/dotfiles"

ln -s ${DOTFILES_DIR}/.vimrc       .vimrc
ln -s ${DOTFILES_DIR}/.vim         .vim
ln -s ${DOTFILES_DIR}/.tmux.conf   .tmux.conf
ln -s ${DOTFILES_DIR}/.screenrc    .screenrc
ln -s ${DOTFILES_DIR}/.zshrc       .zshrc
ln -s ${DOTFILES_DIR}/.gitconfig   .gitconfig

