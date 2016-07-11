#!/bin/sh

cd ${HOME}

DOTFILES_DIR="./dotfiles/dotfiles"

[ -L .vimrc ]         || ln -s ${DOTFILES_DIR}/.vimrc       .vimrc
[ -L .vim   ]         || ln -s ${DOTFILES_DIR}/.vim         .vim
[ -L .tmux.conf ]     || ln -s ${DOTFILES_DIR}/.tmux.conf   .tmux.conf
[ -L .screenrc ]      || ln -s ${DOTFILES_DIR}/.screenrc    .screenrc
[ -L .zshrc ]         || ln -s ${DOTFILES_DIR}/.zshrc       .zshrc
[ -L .gitconfig ]     || ln -s ${DOTFILES_DIR}/.gitconfig   .gitconfig

