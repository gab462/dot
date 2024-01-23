(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(setq default-frame-alist '((font . "iA Writer Quattro S-18")
                            (alpha-background . 90)
                            (reverse . t)
                            (set-face-attribute 'mode-line nil :box nil)))

(setq package-enable-at-startup nil)

(when (fboundp 'startup-redirect-eln-cache)
  (startup-redirect-eln-cache
   (convert-standard-filename
    (expand-file-name  "var/eln-cache/" user-emacs-directory))))

(setq gc-cons-threshold (* 50 1000 1000))

(setq initial-major-mode 'fundamental-mode)
