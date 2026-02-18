;; Startup speed, annoyance suppression
;; (ht: https://git.sr.ht/~ashton314/emacs-bedrock/tree/main/item/early-init.el)
;; (ht: https://github.com/jamescherti/compile-angel.el)
(setq byte-compile-warnings                    '(not obsolete)
      frame-resize-pixelwise                   t
      gc-cons-threshold                        10000000
      inhibit-startup-message                  t ;; Turn off startup messages.
      initial-major-mode                       'fundamental-mode ;; Make the initial buffer load faster by setting its mode to fundamental-mode
      load-prefer-newer                        t ;; Ensure Emacs loads the most recent byte-compiled files.
      native-comp-async-report-warnings-errors 'silent
      native-comp-jit-compilation              t
      warning-suppress-log-types               '((comp) (bytecomp))
      )

;; Turn off window embellishments
;; (doing here as they don't seem to work when loaded from config.org)
(menu-bar-mode   -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)
(tool-bar-mode   -1)
(tooltip-mode    -1)
