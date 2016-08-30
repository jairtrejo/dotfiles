# 
# .zshrc
# Author: Jair Trejo <jair@jairtrejo.mx>
#

# Basic oh-my-zsh configuration
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="jair"
DISABLE_AUTO_UPDATE="true"

plugins=(gitfast,python,brew,npm,pyenv)

source $ZSH/oh-my-zsh.sh

# Aliases

if [[ `uname` == 'Darwin' ]]; then
    alias tmux='TERM=xterm-256color tmux -u'
    alias ls='ls -G'
    alias love='/Applications/love.app/Contents/MacOS/love'
else
    alias tmux='TERM=screen-256color-bce tmux -u'
    alias ls='ls -G --color=auto'
fi
alias effuse='effuse --prefix="."'
alias ssh='TERM=xterm-256color ssh'

# Functions

# Environment variables
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR="vim"
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export LESSCHARSET=UTF-8
if [[ `uname` == 'Darwin' ]]; then
    export PATH=/usr/local/bin:/usr/local/opt/android-sdk/build-tools/:$PATH
    export ANDROID_HOME=/usr/local/opt/android-sdk
fi

# PyEnv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export NVM_DIR="/Users/jair/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$HOME/Library/Haskell/bin:$PATH" # Add Haskell PATH
