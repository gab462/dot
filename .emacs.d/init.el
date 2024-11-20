;; Options

(setq make-backup-files nil
      create-lockfiles nil
      auto-save-default nil
      auto-save-list-file-prefix nil)

(setq inhibit-startup-screen t
      inhibit-startup-echo-area-message (user-login-name)
      initial-scratch-message nil)

(put 'inhibit-startup-echo-area-message 'saved-value t)

(setq kill-whole-line t
      show-paren-delay 0
      ring-bell-function 'ignore)

(setq browse-url-browser-function 'eww-browse-url
      shr-inhibit-images t
      shr-use-fonts nil
      shr-use-colors nil
      shr-cookie-policy nil
      eww-history-limit -1
      shr-indentation 2
      shr-width 70)

(setq-default tab-always-indent 'complete
              indent-tabs-mode nil
              c-default-style "gnu")

(put 'dired-find-alternate-file 'disabled nil)

(require 'ansi-color)
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

;; Minor modes

(electric-pair-mode t)
(delete-selection-mode t)
(show-paren-mode t)

;; (windmove-default-keybindings)

;; Remaps / Aliases

;; Used keybindings: C-= C-, C-. C-; C-' M-*
;; Unused editing keybindings: M-+ M-_ M-#
;; C-z - remappable as already bound to C-x C-z

(defalias 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; (global-set-key (kbd "C-=") 'mark-sexp)
(global-set-key (kbd "M-*") 'raise-sexp)

;; Packages

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package no-littering
  :config (setq custom-file
                (no-littering-expand-etc-file-name
                 "custom.el")))

(use-package gcmh
  :config (gcmh-mode 1))

(use-package treesit-auto
  :init (setq treesit-auto-install 'prompt)
  :config (global-treesit-auto-mode 1))

(use-package magit)

(use-package multiple-cursors
  :init (setq mc/always-run-for-all t)
  :bind (("C-." . mc/mark-next-like-this)
         ("C-," . mc/skip-to-next-like-this)))

(use-package avy
  :bind (("C-;" . avy-goto-word-1)
         ("C-'" . 'avy-goto-char-timer)))

(use-package expreg
  :bind (("C-=" . expreg-expand)))
