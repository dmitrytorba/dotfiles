#!/usr/bin/env zsh

cd ~

ln -sf dotfiles/.tmux.conf .
ln -sf dotfiles/.emacs .
ln -sf dotfiles/.zshrc .

if [[ "$(uname)" == Darwin ]]; then
  if [[ "$(hostname)" == *Mac-Studio* ]]; then
    ln -sf dotfiles/.tmux.mac-studio.conf .tmux.mac-studio.conf
  else
    ln -sf dotfiles/.tmux.mac.conf .tmux.mac.conf
  fi
  ln -sf dotfiles/.mac.zshrc .

  ghostty_dir="${HOME}/Library/Application Support/com.mitchellh.ghostty"
  mkdir -p "$ghostty_dir"
  ln -sf ~/dotfiles/ghostty/config "${ghostty_dir}/config"
else
  mkdir -p ~/.config/ghostty
  ln -sf ~/dotfiles/ghostty/config ~/.config/ghostty/config
fi

read 'github_email?GitHub email: '
git config --global user.email "$github_email"
git config --global user.name 'Dmitry Torba'

chsh -s $(which zsh)

# Install nerd fonts
bash -c  "$(curl -fsSL https://raw.githubusercontent.com/officialrajdeepsingh/nerd-fonts-installer/main/install.sh)"

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Install zsh-autosuggestions
[[ -d ~/.zsh/zsh-autosuggestions ]] || \
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

export PATH="$HOME/.local/bin:$PATH"
source ~/.zshrc
