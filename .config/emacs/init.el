(setq make-backup-files nil
      create-lockfiles nil

      kill-whole-line t
      show-paren-delay 0
      ring-bell-function 'ignore

      custom-file (expand-file-name "custom.el" user-emacs-directory)

      mac-command-modifier 'meta)

(setq-default tab-always-indent 'complete
              indent-tabs-mode nil)

(put 'dired-find-alternate-file 'disabled nil)

(defalias 'yes-or-no-p 'y-or-n-p)

(add-to-list 'exec-path "~/.local/bin")
(setenv "PATH" (format "%s:%s" "~/.local/bin" (getenv "PATH")))

(dolist (binding '((hippie-expand . "M-/")
                   (kill-this-buffer . "C-x k")
                   (raise-sexp . "M-*")
                   (mark-sexp . "C-=")

                   ((lambda ()
                      (interactive)
                      (find-file user-emacs-directory))
                    . "C-c i")))
  (global-set-key (kbd (cdr binding)) (car binding)))

(electric-pair-mode t)
(delete-selection-mode t)
(show-paren-mode t)

(when (equal system-type 'darwin)
  (toggle-frame-maximized))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package gcmh
  :config (gcmh-mode t))

(use-package avy
  :bind (("C-;" . avy-goto-word-1)
         ("C-'" . avy-goto-char-timer)))

(use-package multiple-cursors
  :init (setq mc/always-run-for-all t)
  :bind (("C-." . mc/mark-next-like-this)
         ("C-," . mc/skip-to-next-like-this)))

(use-package inf-clojure
  :bind ("C-c r" . inf-clojure))
