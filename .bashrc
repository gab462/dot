if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

unset HISTFILE

alias nvim="flatpak run io.neovim.nvim"
alias emacs="emacs --init-directory $HOME/Projects/emacs"

function pwget() {
	flatpak run --command=bw com.bitwarden.desktop \
		get password "$1" \
		| flatpak run app.getclipboard.Clipboard copy
	sleep 3
	killall cb
}

function pwclear() {
	flatpak run app.getclipboard.Clipboard clear
	sleep 3
	killall cb
}
