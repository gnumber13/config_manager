# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Also load profile if present, update with source .bashrc
[ -f ~/.profile ] && . ~/.profile

# source files
. ~/.bashrc.d/aliases.rc
. ~/.bashrc.d/functions.rc
. ~/.bashrc.d/prompt.rc
. ~/.bashrc.d/distros.rc

# cd without typing cd
shopt -s autocd

# bash history options
HISTSIZE= HISTFILESIZE= # set to infinite
HISTCONTROL=ignoreboth # no duplicate commands with bash history
shopt -s histappend # only append to history file

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
