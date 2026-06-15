#!/usr/bin/env zsh

cd ~

remove_dotfiles_link() {
  local target=$1
  [[ -L "$target" ]] || return 0
  local link=$(readlink "$target")
  [[ "$link" == dotfiles/* || "$link" == */dotfiles/* ]] || return 0
  rm "$target"
}

remove_dotfiles_link .tmux.conf
remove_dotfiles_link .emacs
remove_dotfiles_link .zshrc

if [[ "$(uname)" == Darwin ]]; then
  remove_dotfiles_link .tmux.mac.conf
  remove_dotfiles_link .tmux.mac-studio.conf
  remove_dotfiles_link .mac.zshrc

  ghostty_config="${HOME}/Library/Application Support/com.mitchellh.ghostty/config"
  remove_dotfiles_link "$ghostty_config"
  rmdir "${HOME}/Library/Application Support/com.mitchellh.ghostty" 2>/dev/null
else
  remove_dotfiles_link .config/ghostty/config
  rmdir .config/ghostty 2>/dev/null
fi

[[ -d ~/.zsh/zsh-autosuggestions/.git ]] && rm -rf ~/.zsh/zsh-autosuggestions
