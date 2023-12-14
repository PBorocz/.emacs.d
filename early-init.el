
;; As of 2023-12-06 (and almost daily lockups, don't worry about startup speed and focus on stability)
;; (this has only been an issue with v29+, never had a problem with 28!)
;; https://lists.gnu.org/archive/html/help-gnu-emacs/2007-06/msg00243.html

;; As of 2023-12-14, still suffering from buffer lockups...go back to NOTHING for a while..
;; (setq gc-cons-percentage 0.6)

;; -----------------------------------------------------------------------------
;; Nicer handling of setting GC threshold for initialisation only
;; (reset afterwards for normal operation)
;;
;; Both of the following from:
;; https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/
;; -----------------------------------------------------------------------------
;; Save the current threshold and set garbage collection threshold to large num..
;; (setq gc-cons-threshold-original gc-cons-threshold)
;; (setq gc-cons-threshold most-positive-fixnum)

;; ??
;; (setq file-name-handler-alist-original file-name-handler-alist)
;; (setq file-name-handler-alist nil)

;; ;; Set deferred timer to reset them both back to original values..
;; (run-with-idle-timer 2 nil
;;  (lambda ()
;;    (setq gc-cons-threshold gc-cons-threshold-original)
;;    (setq file-name-handler-alist file-name-handler-alist-original)
;;
;;    (makunbound 'gc-cons-threshold-original)
;;    (makunbound 'file-name-handler-alist-original)
;;    )
;;  )
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

;; Load monokai theme and reduce the font-size differences of org-mode headlines.
(load-theme 'monokai t)
(setq monokai-height-plus-4 1.2
      monokai-height-plus-3 1.1
      monokai-height-plus-2 1.0)

;; Prefer loading newest compiled .el file and turn off
(setq load-prefer-newer         noninteractive
      package-enable-at-startup t
      inhibit-startup-message   t)

(set-window-scroll-bars (minibuffer-window) nil nil)
(set-default-coding-systems 'utf-8)

(blink-cursor-mode      1)
(column-number-mode     t)
(global-font-lock-mode  1)
(menu-bar-mode         -1)
(scroll-bar-mode       -1)
(tool-bar-mode         -1)
(tooltip-mode          -1)

;; Turn these off for now; later, we'll use pb/toggle-letter-case to do this a bit better.
(put 'downcase-region 'disabled nil)
(put 'upcase-region   'disabled nil)

;; Make the initial buffer load faster by setting its mode to fundamental-mode
(setq initial-major-mode 'fundamental-mode)
