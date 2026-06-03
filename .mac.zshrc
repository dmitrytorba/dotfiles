autoload -Uz compinit
compinit

# pnpm
export PNPM_HOME="/Users/dmitry.torba/Library/pnpm"


[[ -f "$HOME/.local/bin/env" ]] && . "$HOME/.local/bin/env"
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"