# 
# .zshrc
# Author: Jair Trejo <jair@jairtrejo.mx>
#

# Basic oh-my-zsh configuration

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="jair"
DISABLE_AUTO_UPDATE="true"

plugins=(git,svn,python,vagrant,django)

source $ZSH/oh-my-zsh.sh

# Aliases

alias v='gvim .'
if [[ `uname` == 'Darwin' ]]; then
    alias tmux='TERM=xterm-256color tmux -u'
    alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
    alias ls='ls -G'
    alias octave='exec "/Applications/Octave.app/Contents/Resources/bin/octave"'
else
    alias tmux='TERM=screen-256color-bce tmux -u'
    alias ls='ls -G --color=auto'
fi
alias effuse='effuse --prefix="."'
alias ssh='TERM=xterm-256color ssh'

# Functions

# Colours python stack traces.
function pst () {
    $* | discoball '"/home/.*"' '==[=]+' '\w+Error' 'line \d+' 'failures=\d+' 'errors=\d+'
}

# I am sick and tired of writing "fab vagrant".
function fv () {
    fab vagrant $*
}

# Environment variables
export EDITOR="vim"
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export LESSCHARSET=UTF-8
if [[ `uname` == 'Darwin' ]]; then
    export PATH=$PATH:/Applications/Mozart.app/Contents/Resources/bin
fi
