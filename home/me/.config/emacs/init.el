(setq make-backup-files nil
      create-lockfiles nil

      kill-whole-line t
      show-paren-delay 0
      ring-bell-function 'ignore

      inhibit-startup-screen t
      inhibit-startup-echo-area-message (user-login-name)
      initial-scratch-message nil

      custom-file (expand-file-name "custom.el" user-emacs-directory)

      browse-url-browser-function 'eww-browse-url
      eww-history-limit -1
      shr-inhibit-images t
      shr-use-fonts nil
      shr-use-colors nil
      shr-cookie-policy nil
      shr-indentation 2
      shr-width 70

      dired-dwim-target t

      mac-command-modifier 'meta

      inferior-lisp-program "sbcl --load ./scripts/repl.lisp")

(put 'dired-find-alternate-file 'disabled nil)
(put 'inhibit-startup-echo-area-message 'saved-value t)

(defalias 'yes-or-no-p 'y-or-n-p)

(add-to-list 'auto-mode-alist (cons "\\.paren\\'" 'lisp-mode))

(use-package emacs
  :init (setq-default tab-always-indent 'complete
                      indent-tabs-mode nil)
  :bind (("C-x k" . kill-this-buffer)
         ("M-*" . raise-sexp)
         ("C-=" . mark-sexp))
  :config
  (electric-pair-mode t)
  (delete-selection-mode t)
  (show-paren-mode t))

(use-package ansi-color
  :config (add-hook 'compilation-filter-hook 'ansi-color-compilation-filter))

(use-package package
  :config (add-to-list 'package-archives
                       '("melpa" . "https://melpa.org/packages/")))

(use-package use-package-ensure
  :init (setq use-package-always-ensure t))

(use-package gcmh
  :config (gcmh-mode t))

(use-package magit)

(use-package multiple-cursors
  :init (setq mc/always-run-for-all t)
  :bind (("C-." . mc/mark-next-like-this)
         ("C-," . mc/skip-to-next-like-this)))

(use-package slime)

(use-package trident-mode
  :config
  (add-hook
   'lisp-mode-hook
   (lambda ()
     (when (and buffer-file-name
                (string-match-p "\\.paren\\>" buffer-file-name)
                (slime-connected-p))
       (trident-mode t)

       (unless (httpd-running-p)
         (httpd-start))

       (make-local-variable 'slime-mode-map)
       (let ((map slime-mode-map))
         (define-key map (kbd "C-x C-e") nil)
         (define-key map (kbd "C-c C-r") nil)
         (define-key map (kbd "C-M-x")   nil)
         (define-key map (kbd "C-c C-k") nil)
         (define-key map (kbd "C-c C-m") nil))
       (let ((map trident-mode-map))
         (define-key map (kbd "C-x C-e") 'trident-eval-last-expression)
         (define-key map (kbd "C-c C-r") 'trident-eval-region)
         (define-key map (kbd "C-M-x")   'trident-eval-defun)
         (define-key map (kbd "C-c C-k") 'trident-eval-buffer)
         (define-key map (kbd "C-c C-m") 'trident-expand-sexp)))))) 
