(setq gc-cons-threshold most-positive-fixnum)

;(when (fboundp 'startup-redirect-eln-cache)
;  (startup-redirect-eln-cache
;    (convert-standard-filename
;      (expand-file-name  "var/eln-cache/" user-emacs-directory))))

(set-face-attribute 'mode-line nil :box nil)
;(set-frame-parameter nil 'alpha-background 90)

(add-to-list 'default-frame-alist '(font . "Monospace-18"))
(add-to-list 'default-frame-alist '(reverse . t))

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
