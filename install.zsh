#!/usr/bin/env zsh

cd ~
ln -s dotfiles/.tmux.conf .
ln -s dotfiles/.emacs .
ln -s dotfiles/.zshrc .
git config --global user.email 'dmitrytorba@gmail.com'
git config --global user.name 'Dmitry Torba'

curl -sS https://starship.rs/install.sh | sh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions