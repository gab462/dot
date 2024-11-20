(setq make-backup-files nil
      create-lockfiles nil

      kill-whole-line t
      show-paren-delay 0
      ring-bell-function 'ignore

      mc/always-run-for-all t)

(setq-default tab-always-indent 'complete
              indent-tabs-mode nil)

(load-theme 'gruvbox t)

(set-frame-parameter nil 'alpha-background 90)
(set-frame-parameter nil 'font "Roboto Mono Medium-18")
(set-face-attribute 'mode-line nil :box nil)

(put 'dired-find-alternate-file 'disabled nil)

(defalias 'yes-or-no-p 'y-or-n-p)

(dolist (binding '((hippie-expand . "M-/")
                   (kill-this-buffer . "C-x k")
                   (raise-sexp . "M-*")
                   (mark-sexp . "C-=")

                   (avy-goto-word-1 . "C-;")
                   (avy-goto-char-timer . "C-'")

                   (mc/mark-next-like-this . "C-.")
                   (mc/skip-to-next-like-this . "C-,")))
  (global-set-key (kbd (cdr binding)) (car binding)))

(electric-pair-mode t)
(delete-selection-mode t)
(show-paren-mode t)
(gcmh-mode t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
