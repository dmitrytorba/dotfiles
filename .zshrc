
# variables
export GOPATH=$HOME/golang
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
export MAVEN_OPTS="-Xmx6g -Xdebug -Xnoagent -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8000"
export GRADLE_HOME=/opt/gradle/gradle-6.8.1
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$HOME/Android/Sdk

# path
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/share/pear/bin
export PATH=$PATH:/home/d/.npm/bin
export PATH=$PATH:/home/d/.local/bin
export PATH=$PATH:/home/d/liquibase
export PATH=$PATH:/home/d/.config/Code/User/globalStorage/evaera.vscode-rojo/rojo-v0.5.4/bin
export PATH=$PATH:${GRADLE_HOME}/bin
export PATH=$PATH:$HOME/.dotnet
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools


source ~/dotfiles/func.zsh

[[ -a ~/torch ]] && source ~/torch/install/bin/torch-activate
[[ -a ~/.cargo ]] && export PATH=$PATH:$HOME/.cargo/bin
# https://github.com/sorin-ionescu/prezto
[[ -a ~/.zprezto ]] && source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

[[ -a .keys.zsh ]] && source .keys.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/d/.sdkman"
[[ -s "/home/d/.sdkman/bin/sdkman-init.sh" ]] && source "/home/d/.sdkman/bin/sdkman-init.sh"

[ -s "/home/d/.jabba/jabba.sh" ] && source "/home/d/.jabba/jabba.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/d/google-cloud-sdk/path.zsh.inc' ]; then . '/home/d/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/d/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/d/google-cloud-sdk/completion.zsh.inc'; fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

eval "$(starship init zsh)"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh