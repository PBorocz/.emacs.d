;;; "Compiled" snippets and support files for `org-mode'  -*- lexical-binding:t -*-
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
		     '(("srcp" "#+begin_src python\n  $0\n#+end_src"
			"srcp" nil nil nil
			"/Users/peter/.emacs.d/snippets/org-mode/srcp"
			nil nil)
		       ("srce"
			"#+begin_src emacs-lisp\n  $0\n#+end_src"
			"srce" nil nil nil
			"/Users/peter/.emacs.d/snippets/org-mode/srce"
			nil nil)
		       ("src" "#+begin_src $1\n  $0\n#+end_src" "src"
			nil nil nil
			"/Users/peter/.emacs.d/snippets/org-mode/src"
			nil nil)))


;;; Do not edit! File generated at Sat Feb 21 09:28:06 2026
