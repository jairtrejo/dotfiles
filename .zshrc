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
