export EDITOR=neatvi
export MANPAGER=less
export AUR_PAGER='nnn -e'
export PATH=$PATH:/home/me/bin
export HISTCONTROL=ignorespace

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias nnn='nnn -e'
alias vi=neatvi

PS1='[\e[0;32m\u\e[m@\e[0;34m\h\e[m \e[0;33m\W\e[m]\$ '
