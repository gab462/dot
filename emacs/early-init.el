(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(add-to-list 'default-frame-alist '(font . "iA Writer Quattro S-18"))
(add-to-list 'default-frame-alist '(alpha-background . 90))
(add-to-list 'default-frame-alist '(reverse . t))
(set-face-attribute 'mode-line nil :box nil)

(setq package-enable-at-startup nil)

(when (fboundp 'startup-redirect-eln-cache)
  (startup-redirect-eln-cache
   (convert-standard-filename
    (expand-file-name  "var/eln-cache/" user-emacs-directory))))

(setq gc-cons-threshold (* 50 1000 1000))

(setq initial-major-mode 'fundamental-mode)
