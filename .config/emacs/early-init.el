(setq gc-cons-threshold most-positive-fixnum)

;(when (fboundp 'startup-redirect-eln-cache)
;  (startup-redirect-eln-cache
;    (convert-standard-filename
;      (expand-file-name  "var/eln-cache/" user-emacs-directory))))

(load-theme 'wombat t)
(set-face-attribute 'mode-line nil :box nil)
;(set-frame-parameter nil 'alpha-background 90)

(add-to-list 'default-frame-alist '(font . "Monospace-18"))
