;; Do this right up front to allow us to use VC-controlled configuration files (as they're
;; soft-linked from another location) later on in the startup process [as by the time we hit the
;; same setting in the tangled config file (config.el), it's too late].
(setq vc-follow-symlinks t)

;; -----------------------------------------------------------------------------
;; Use "straight" for package management/installation:
;; -----------------------------------------------------------------------------
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
	"straight/repos/straight.el/bootstrap.el"
	(or (bound-and-true-p straight-base-dir)
	    user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(setq straight-use-package-by-default t)

;; -----------------------------------------------------------------------------
;; We don't need a "custom" file, anything worthwhile should be in config.org.
;; -----------------------------------------------------------------------------
(setq custom-file "~/.emacs.d/garbage.el")

;; -----------------------------------------------------------------------------
;; In case we run into any issues debugging our tangled config file:
;; -----------------------------------------------------------------------------
(setq debug-on-error 1)
(setq debug-on-quit  t)

;; -----------------------------------------------------------------------------
;; Get the rest of our configuration from our tangled config.org file!
;; 2024-05-06 Testing shows that leaving this to tangle/load vs.
;;            just loading the config.el is a non-perceptible change in startup time.
;;            Thus, to ease the few times we DO make config changes, this'll ensure
;;            they always get picked up.
;; -----------------------------------------------------------------------------
(org-babel-load-file "~/.emacs.d/config.org")
