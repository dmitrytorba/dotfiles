#!/usr/bin/env zsh

cd ~
ln -s dotfiles/.tmux.conf .
ln -s dotfiles/.emacs .
ln -s dotfiles/.zshrc .
git config --global user.email 'dmitrytorba@gmail.com'
git config --global user.name 'Dmitry Torba'

chsh -s $(which zsh) 

# Install nerd fonts
bash -c  "$(curl -fsSL https://raw.githubusercontent.com/officialrajdeepsingh/nerd-fonts-installer/main/install.sh)"

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

source ~/.zshrc
