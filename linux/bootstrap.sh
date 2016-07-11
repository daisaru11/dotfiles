#!/bin/sh

cd ${HOME}

DOTFILES_DIR="./dotfiles/dotfiles"

[ -L ${DOTFILES_DIR}/.vimrc ]         && ln -s ${DOTFILES_DIR}/.vimrc       .vimrc
[ -L ${DOTFILES_DIR}/.vim   ]         && ln -s ${DOTFILES_DIR}/.vim         .vim
[ -L ${DOTFILES_DIR}/.tmux.conf ]     && ln -s ${DOTFILES_DIR}/.tmux.conf   .tmux.conf
[ -L ${DOTFILES_DIR}/.screenrc ]      && ln -s ${DOTFILES_DIR}/.screenrc    .screenrc
[ -L ${DOTFILES_DIR}/.zshrc ]         && ln -s ${DOTFILES_DIR}/.zshrc       .zshrc
[ -L ${DOTFILES_DIR}/.gitconfig ]     && ln -s ${DOTFILES_DIR}/.gitconfig   .gitconfig

