;; -----------------------------------------------------------------------------
;; Nicer handling of setting GC threshold for initialisation only
;; (reset afterwards for normal operation)
;;
;; Both of the following from:
;; https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/
;; -----------------------------------------------------------------------------
;; Set garbage collection threshold
(setq gc-cons-threshold-original gc-cons-threshold)
(setq gc-cons-threshold most-positive-fixnum)

(setq file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)

;; Set deferred timer to reset them
(run-with-idle-timer 2 nil
 (lambda ()
   (setq gc-cons-threshold gc-cons-threshold-original)
   (setq file-name-handler-alist file-name-handler-alist-original)
   (makunbound 'gc-cons-threshold-original)
   (makunbound 'file-name-handler-alist-original)
   (message "(...restored original values of 'gc-cons-threshold' and 'file-name-handler-alist')")))
;; -----------------------------------------------------------------------------

;; Native compilation settings
(when (fboundp 'native-comp-available-p)
  ;; Set the right directory to store the native compilation cache
  (let ((path (expand-file-name "eln-cache/" user-emacs-directory)))
    (setq native-comp-eln-load-path (list path)
          native-compile-target-directory path))
  (setq native-comp-async-report-warnings-errors nil ;; Silence compiler warnings as they can be pretty disruptive
        inhibit-automatic-native-compilation     t)  ;; Make native compilation happens asynchronously
  )

;; Theme setting
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'monokai t)

;; Reduce the font-size differences of org-mode headlines.
(setq monokai-height-plus-4 1.2
      monokai-height-plus-3 1.1
      monokai-height-plus-2 1.0)

;; Prefer loading newest compiled .el file
(setq load-prefer-newer         noninteractive
      package-enable-at-startup t
      inhibit-startup-message   t)

(set-window-scroll-bars (minibuffer-window) nil nil)
(set-default-coding-systems 'utf-8) ;; Set default coding system (especially for Windows)

(blink-cursor-mode     1)
(column-number-mode    t)
(global-font-lock-mode 1)
(menu-bar-mode         -1)
(scroll-bar-mode       -1)
(tool-bar-mode         -1)
(tooltip-mode          -1)

(put 'downcase-region 'disabled nil)
(put 'upcase-region   'disabled nil)

;; Make the initial buffer load faster by setting its mode to fundamental-mode
(setq initial-major-mode 'fundamental-mode)
