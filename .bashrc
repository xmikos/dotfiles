#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias ls='LC_COLLATE=C ls --color=auto --group-directories-first'
alias la='ls -alh'
alias pa='ps auxw'
alias h='history'
alias v='vim'
alias mv='mv -i'
alias rm='rm -I'
alias dmesg='dmesg -H -P'

# Use pspg pager for databases
if [ -x "$(command -v pspg)" ]; then
    alias psql='PAGER=pspg psql'
    alias pgcli='PAGER=pspg pgcli'
    alias mysql='PAGER=pspg mysql --pager'
    alias mycli='PAGER=pspg mycli'
fi

# Variables
export PATH=$PATH:/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$HOME/bin
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

# Show git status in prompt
. /usr/share/git/completion/git-prompt.sh
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWDIRTYSTATE=true
#GIT_PS1_SHOWUNTRACKEDFILES=true
#GIT_PS1_SHOWSTASHSTATE=true
#GIT_PS1_SHOWUPSTREAM=auto

# Colorful PS1 with git status
if [[ ${EUID} == 0 ]] ; then
  PROMPT_COMMAND="__git_ps1 '\[\033[01;34m\][\[\033[01;31m\]\u@\h\[\033[01;34m\] \w\[\033[00m\]' '\[\033[01;34m\]]\$\[\033[00m\] ' ' \[\033[00m\]\uE0A0 %s'"
else
  PROMPT_COMMAND="__git_ps1 '\[\033[01;34m\][\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[00m\]' '\[\033[01;34m\]]\$\[\033[00m\] ' ' \[\033[00m\]\uE0A0 %s'"
fi

# Append command to history immediately
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Source ~/.bashrc.local (local customizations)
[[ -f ~/.bashrc.local ]] && . ~/.bashrc.local
