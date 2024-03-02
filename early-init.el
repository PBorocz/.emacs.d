;; 2024-01-23: https://zenodo.org/records/10518083 seems to indicate this would help.
;;             (specifically, by increasing this we trade off RAM for less frequent GC's)
;; 2024-02-02: Also from https://github.com/jwiegley/dot-emacs/blob/master/init.org
(setq gc-cons-percentage 0.6
      gc-cons-threshold (* 128 1024 1024))

;; Prefer loading newest compiled .el file and turn off
(setq load-prefer-newer noninteractive
      package-enable-at-startup t
      inhibit-startup-message   t)

(set-window-scroll-bars (minibuffer-window) nil nil)
(set-default-coding-systems 'utf-8)

(menu-bar-mode         -1)
(scroll-bar-mode       -1)
(tool-bar-mode         -1)
(tooltip-mode          -1)

;; Theme setting
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Make the initial buffer load faster by setting its mode to fundamental-mode
(setq initial-major-mode 'fundamental-mode)
