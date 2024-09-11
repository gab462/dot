(setq gc-cons-threshold most-positive-fixnum)

(set-face-attribute 'mode-line nil :box nil)
(set-frame-parameter nil 'alpha-background 90)

(add-to-list 'default-frame-alist '(font . "MesloLGM Nerd Font-18"))
(add-to-list 'default-frame-alist '(reverse . t))

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
