(setq gc-cons-threshold most-positive-fixnum
      initial-major-mode 'fundamental-mode
      default-frame-alist '((fullscreen . maximized)
                            ;; (alpha-background . 95)
                            (font . "Monospace-18")
                            (reverse . t)))

(set-face-attribute 'mode-line nil :box nil)
(setq-default mode-line-format nil)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(global-font-lock-mode -1)
