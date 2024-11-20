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

function opamenv() {
	case "$1" in
		init)
			opam init --root=.opam --bare -n
			opam switch create . --root=.opam
			eval $(opam env --root=.opam --set-root)
			opam install dune
			dune init proj "$(basename $PWD)"
			mv "$(basename $PWD)"/* . && rm -r "$(basename $PWD)" # https://github.com/ocaml/dune/pull/9447
			;;
		dev)
			eval $(opam env --root=.opam --set-root)
			;;
		*)
			echo "Invalid arguments"
			return 1
			;;
	esac
}
