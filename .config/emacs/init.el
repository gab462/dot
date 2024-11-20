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

(use-package use-package-ensure
  :init (setq use-package-always-ensure t))

(use-package package
  :config (add-to-list 'package-archives
                       '("melpa" . "https://melpa.org/packages/") t))

(use-package gcmh
  :config (gcmh-mode t))

(use-package avy
  :bind (("C-;" . avy-goto-word-1)
         ("C-'" . avy-goto-char-timer)))

(use-package multiple-cursors
  :init (setq mc/always-run-for-all t)
  :bind (("C-." . mc/mark-next-like-this)
         ("C-," . mc/skip-to-next-like-this)))

(use-package corfu
  :hook (eglot-managed-mode . corfu-mode))

(use-package eldoc-box
  :hook (eglot-managed-mode . eldoc-box-hover-mode))

(use-package magit)

(use-package rust-mode)
