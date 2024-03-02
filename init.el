;; Do this right up front to allow us to use VC-controlled configuration files later on in the startup process [as by the
;; time we hit the same setting in the tangled config file (config.el), it's too late].
(setq vc-follow-symlinks t)

  ;; Set up repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org"   . "https://orgmode.org/elpa/"))
(package-initialize)

;; Setup use of use-package macro(s) for the rest of our package installs.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure         t
        use-package-expand-minimally      t
        use-package-verbose               t
        use-package-compute-statistics    t
        use-package-minimum-reported-time 0.1
        debug-on-error                    nil
        )
  )

;; Set the location of a separate "custom" file (ie. custom-set-variables and custom-set-faces)
;; (ie. we don't want it stored below in *this* file. ;-()
(use-package cus-edit
  :custom
  (custom-file (expand-file-name "custom.el" user-emacs-directory))

  :config
  (load custom-file 'noerror))

;; In case we run into any issues debugging our tangled config file:
(setq debug-on-error 1)
(setq debug-on-quit  t)

;; -----------------------------------------------------------------------------
;; Get the rest of our configuration from our tangled config.org file!
(org-babel-load-file "~/.emacs.d/config.org")

;; -----------------------------------------------------------------------------

;; How long did our startup take?
(defun pb/_display-startup-time ()
  (message
   "Emacs loaded in %s with %d garbage collections."
   (format "%.2f seconds" (float-time (time-subtract after-init-time before-init-time)))
   gcs-done)
  )
(add-hook 'emacs-startup-hook #'pb/_display-startup-time)
