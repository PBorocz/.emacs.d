;; Startup time
(defun pb/_display-startup-time ()
  (message
   "Emacs loaded in %s with %d garbage collections."
   (format "%.2f seconds" (float-time (time-subtract after-init-time before-init-time)))
   gcs-done)
  )
(add-hook 'emacs-startup-hook #'pb/_display-startup-time)

;; Start "standard"
(let ((gc-cons-threshold most-positive-fixnum))

  ;; Do this right up front to allow us to use VC-controlled
  ;; configuration files later on in the startup process [as by the
  ;; time we hit the same setting in the tangled config file
  ;; (config.el), it's too late].
  (setq vc-follow-symlinks t)

  ;; Emacs by default caps the number of bytes read from a subprocess
  ;; in a single chunk to 4KB. However, modern machines can take on a
  ;; lot more. I'll set it to 1MB which is equal to the limit defined
  ;; in /proc/sys/fs/pipe-max-size/.
  ;; ht: https://grtcdr.tn/dotfiles/emacs/emacs.html#orgdb7d3a6
  (setq read-process-output-max (* 1024 1024))

  ;; Set up repositories
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  (add-to-list 'package-archives '("org"   . "https://orgmode.org/elpa/"))
  (package-initialize)

  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

  (eval-and-compile
    (setq use-package-always-ensure    t
          use-package-expand-minimally t))

  ;; Set the location of a separate "custom" file (ie. custom-set-variables and custom-set-faces).
  ;; (we don't want it stored below ;-()
  (use-package cus-edit
    :custom
    (custom-file (expand-file-name "custom.el" user-emacs-directory))
    :config
    (load custom-file 'noerror))

  ;; Tangle and get our configuration from our config.org file:
  (require 'org)
  (org-babel-load-file (expand-file-name (concat user-emacs-directory "config.org")))

  ;; Cleanup and we're done!
  (garbage-collect)

  )
