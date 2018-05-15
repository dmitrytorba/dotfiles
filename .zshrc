
# variables
export GOPATH=$HOME/golang
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
export MAVEN_OPTS="-Xmx6g -Xdebug -Xnoagent -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8000"

# path
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/share/pear/bin

source ~/dotfiles/func.zsh

source ~/torch/install/bin/torch-activate

# https://github.com/sorin-ionescu/prezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
