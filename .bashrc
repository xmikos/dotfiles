#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias grep='grep --color=auto'
alias ls='LC_COLLATE=C ls --color=auto --group-directories-first'
alias la='ls -alh'
alias h='history'
alias v='vim'
alias mv='mv -i'
alias rm='rm -I'
alias dmesg='dmesg -H -P'

# Variables
export PATH=$PATH:/usr/local/bin:/usr/local/sbin:$HOME/bin
export EDITOR=vim
export PAGER=less
export LESS=-R
export HISTSIZE=10000
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoreboth

# Shell options
shopt -s cmdhist        # Save all lines of a multiple-line command in the same history entry
shopt -s histappend     # Append history to the history file, rather than overwriting it
shopt -s checkwinsize   # Check the window size after each command
shopt -s dotglob        # Include filenames beginning with a . in the results of pathname expansion

# Disable XON/XOFF (CTRL+S/CTRL+Q)
stty -ixon

# Append command to history immediately
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Colorful PS1
if [[ ${EUID} == 0 ]] ; then
  PS1='\[\033[01;34m\][\[\033[01;31m\]\u@\h\[\033[01;34m\] \w]\$\[\033[00m\] '
else
  PS1='\[\033[01;34m\][\[\033[01;32m\]\u@\h\[\033[01;34m\] \w]\$\[\033[00m\] '
fi
