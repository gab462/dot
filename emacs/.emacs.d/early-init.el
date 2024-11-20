(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-18"))

(setq package-enable-at-startup nil)

;; no-littering
(when (fboundp 'startup-redirect-eln-cache)
  (startup-redirect-eln-cache
   (convert-standard-filename
    (expand-file-name  "var/eln-cache/" user-emacs-directory))))

;; Speed up initialization
(setq gc-cons-threshold (* 50 1000 1000))

(setq initial-major-mode 'fundamental-mode)
