# 
# .zshrc
# Author: Jair Trejo <jair@jairtrejo.mx>
#

# Basic oh-my-zsh configuration
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="refined"
DISABLE_AUTO_UPDATE="true"

plugins=(gitfast python brew npm pyenv)

source $ZSH/oh-my-zsh.sh

# Aliases

if [[ `uname` == 'Darwin' ]]; then
    alias ls='ls -G'
    alias love="/Applications/love.app/Contents/MacOS/love"
    alias vim='nvim'
else
    alias tmux='tmux -u'
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
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export NVM_DIR="/Users/jair/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$HOME/Library/Haskell/bin:$PATH" # Add Haskell PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(direnv hook zsh)"
#
# ASDF
echo -e "\n. $(brew --prefix asdf)/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc

. /usr/local/opt/asdf/asdf.sh
