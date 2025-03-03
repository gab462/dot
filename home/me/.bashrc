[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias nnn='nnn -e'
alias vi=neatvi

PS1='[\e[0;32m\u\e[m@\e[0;34m\h\e[m \e[0;33m\W\e[m]\$ '

goenv() {
	GOPATH=$PWD/.goenv go $@
}

if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
    exec sway
    # exec startx $HOME/bin/riostart
fi
