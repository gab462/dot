(setq gc-cons-threshold most-positive-fixnum
      initial-major-mode 'fundamental-mode
      default-frame-alist '((fullscreen . maximized)
                            (alpha-background . 95)
                            (font . "EnvyCodeR Nerd Font-21")
                            (reverse . t)))

(set-face-attribute 'mode-line nil :box nil)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
