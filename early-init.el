;; 2024-01-23: https://zenodo.org/records/10518083 seems to indicate this would help.
;;             (specifically, by increasing this we trade off RAM for less frequent GC's)
;; 2024-02-02: Also from https://github.com/jwiegley/dot-emacs/blob/master/init.org
;; 2024-05-27: Try out GCMH https://gitlab.com/koral/gcmh
;; (setq garbage-collection-messages t
;;       gc-cons-percentage 0.6
;;       gc-cons-threshold (* 8 1024 1024 1024)) ; 8GB

;; Prefer loading newest compiled .el file and turn off
(setq load-prefer-newer       noninteractive
      inhibit-startup-message t
      frame-resize-pixelwise  t
      )

(blink-cursor-mode 0)
(menu-bar-mode    -1)
(scroll-bar-mode  -1)
(set-fringe-mode  10)
(tool-bar-mode    -1)
(tooltip-mode     -1)

;; Setting background color here to prevent color flash as the theme gets activated.
(setq default-frame-alist '((background-color        . "#1d2021") ;; Same background color as our theme
			    (ns-appearance           . dark)
			    (ns-transparent-titlebar . t)))

(set-window-scroll-bars (minibuffer-window) nil nil)
(set-default-coding-systems 'utf-8)

;; Make the initial buffer load faster by setting its mode to fundamental-mode
(setq initial-major-mode 'fundamental-mode)
