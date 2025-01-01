;; Prefer loading newest compiled .el file and turn off startup messages
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
