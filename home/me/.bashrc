[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
    exec sway
fi
