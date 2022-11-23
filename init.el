;; Startup time
(defun pb/_display-startup-time ()
  (message
   "Emacs loaded in %s with %d garbage collections."
   (format "%.2f seconds" (float-time (time-subtract after-init-time before-init-time)))
   gcs-done))
(add-hook 'emacs-startup-hook #'pb/_display-startup-time)

;; Start "standard"
(let ((gc-cons-threshold most-positive-fixnum))

  ;; Do this right up front to allow us to use VC-controlled
  ;; configuration files later on in the startup process (by the time
  ;; we hit the same setting in the tangled config file (config.el),
  ;; it's too late.
  (setq vc-follow-symlinks t)

  ;; Set repositories
  (require 'package)
  (add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  (package-initialize)

  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

  (eval-and-compile
    (setq use-package-always-ensure t
          use-package-expand-minimally t))

  (setq vc-follow-symlinks "t")

  ;; Tangle and get our configuration from org file:
  ;; (add-to-list 'load-path "~/.emacs.d/lisp/org-menu")
  ;; (org-babel-load-file (expand-file-name "config.org" user-emacs-directory))
  (require 'org)
  (org-babel-load-file (expand-file-name (concat user-emacs-directory "config.org")))

  ;; Cleanup
  (garbage-collect)
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(org-cliplink zygospore web-mode vterm vlf use-package smart-jump rg rainbow-mode rainbow-delimiters pyvenv-auto pdf-tools org-modern org-bullets markdown-mode magit hungry-delete gruvbox-theme graphviz-dot-mode git-timemachine git-gutter esup elm-mode eglot editorconfig doom-modeline diredfl dired-narrow dimmer diminish counsel company beacon apples-mode anzu all-the-icons-ivy-rich)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
