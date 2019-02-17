# 
# .zshrc
# Author: Jair Trejo <jair@jairtrejo.mx>
#

# Basic oh-my-zsh configuration
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="refined"
DISABLE_AUTO_UPDATE="true"

plugins=(gitfast,python,brew,npm,pyenv)

source $ZSH/oh-my-zsh.sh

# Aliases

if [[ `uname` == 'Darwin' ]]; then
    alias ls='ls -G'
    alias love="/Applications/love.app/Contents/MacOS/love"
    alias vim='nvim'
else
    alias tmux='TERM=screen-256color-bce tmux -u'
    alias ls='ls -G --color=auto'
fi

# Functions

# Environment variables
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR="vim"
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export LESSCHARSET=UTF-8
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
if [[ `uname` == 'Darwin' ]]; then
    export ANDROID_HOME=/Users/jair/Library/Android/sdk
    export PATH=$HOME/bin:/usr/local/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
fi

# PyEnv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export NVM_DIR="/Users/jair/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$HOME/Library/Haskell/bin:$PATH" # Add Haskell PATH

# HyperTerm.app runs `bash -ilc env` in an attempt to find npm
if [[ "$(ps -o command= $$)" =~ bash\ -ilc\ env &&
      "$(ps -o command= $PPID)" =~ HyperTerm\.app ]]; then
  nvm use stable
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(direnv hook zsh)"

# added by travis gem
[ -f /Users/jair/.travis/travis.sh ] && source /Users/jair/.travis/travis.sh
