;; Startup speed, annoyance suppression
;; (ht: https://git.sr.ht/~ashton314/emacs-bedrock/tree/main/item/early-init.el)
(setq gc-cons-threshold                        10000000)
(setq byte-compile-warnings                    '(not obsolete))
(setq warning-suppress-log-types               '((comp) (bytecomp)))
(setq native-comp-async-report-warnings-errors 'silent)

(setq load-prefer-newer       t ;; Ensure Emacs loads the most recent byte-compiled files.
      inhibit-startup-message t ;; Turn off startup messages.
      frame-resize-pixelwise  t)

;; Turn off window embellishments
;; (doing here as they don't seem to work when loaded from config.org)
(menu-bar-mode   -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)
(tool-bar-mode   -1)
(tooltip-mode    -1)

;; Make the initial buffer load faster by setting its mode to fundamental-mode
(setq initial-major-mode 'fundamental-mode)
