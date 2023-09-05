if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

#setterm --blank=5
#setfont /usr/share/consolefonts/Uni1-VGA32x16.psf.gz
#setfont /usr/share/consolefonts/Uni2-Terminus18x10.psf.gz

[ "$(tty)" = "/dev/tty1" ] && exec sway
