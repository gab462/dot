(setq make-backup-files nil
      create-lockfiles nil

      kill-whole-line t
      show-paren-delay 0
      ring-bell-function 'ignore

      mac-command-modifier 'meta

      mc/always-run-for-all t)

(setq-default tab-always-indent 'complete
              indent-tabs-mode nil)

(put 'dired-find-alternate-file 'disabled nil)

(defalias 'yes-or-no-p 'y-or-n-p)

(dolist (dir (directory-files (string-join (list user-emacs-directory
                                                 "lisp"))
                              t "[^.]"))
  (add-to-list 'load-path dir))

(dolist (pkg '(gcmh no-littering avy multiple-cursors paredit))
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
                      (let ((exec-path (cons "~/.local/bin" exec-path)))
                        (run-lisp "qlenv repl")))
                    . "C-c r")))
  (global-set-key (kbd (cdr binding)) (car binding)))

(electric-pair-mode t)
(delete-selection-mode t)
(show-paren-mode t)
(gcmh-mode t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(when (equal system-type 'darwin)
  (toggle-frame-maximized))
