(setq make-backup-files nil
      create-lockfiles nil

      kill-whole-line t
      show-paren-delay 0
      ring-bell-function 'ignore

      mac-command-modifier 'meta

      mc/always-run-for-all t)

(setq-default tab-always-indent 'complete
              indent-tabs-mode nil
              tab-width 4)

(defvaralias 'c-basic-offset 'tab-width)

(put 'dired-find-alternate-file 'disabled nil)

(defalias 'yes-or-no-p 'y-or-n-p)

(add-to-list 'exec-path "~/.local/bin")
(setenv "PATH" (format "%s:%s" "~/.local/bin" (getenv "PATH")))

(dolist (dir (directory-files (string-join (list user-emacs-directory
                                                 "lisp"))
                              t "[^.]"))
  (add-to-list 'load-path dir))

(dolist (pkg '(gcmh no-littering avy multiple-cursors))
  (require pkg))

(dolist (binding '((hippie-expand . "M-/")
                   (kill-this-buffer . "C-x k")
                   (raise-sexp . "M-*")
                   (mark-sexp . "C-=")

                   (avy-goto-word-1 . "C-;")
                   (avy-goto-char-timer . "C-'")

                   (mc/mark-next-like-this . "C-.")
                   (mc/skip-to-next-like-this . "C-,")

                   ((lambda ()
                      (interactive)
                      (find-file user-emacs-directory))
                    . "C-c i")

                   ((lambda ()
                      (interactive)
                      (run-lisp "qlenv repl"))
                    . "C-c r")))
  (global-set-key (kbd (cdr binding)) (car binding)))

(electric-pair-mode t)
(delete-selection-mode t)
(show-paren-mode t)
(gcmh-mode t)

(when (equal system-type 'darwin)
  (toggle-frame-maximized))
