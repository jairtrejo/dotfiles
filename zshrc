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
alias tmux='TERM=screen-256color-bce tmux'
alias effuse='effuse --prefix="."'
alias ls='ls -G'

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

