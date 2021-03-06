#!/usr/bin/env zsh

cd ~
ln -s dotfiles/.tmux.conf .
ln -s dotfiles/.emacs .
ln -s dotfiles/.zshrc .
git config --global user.email 'dmitrytorba@gmail.com'
git config --global user.name 'Dmitry Torba'

# make zsh all nice
ln -s dotfiles/.zpreztorc .
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
