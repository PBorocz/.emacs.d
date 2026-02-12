;;; "Compiled" snippets and support files for `org-mode'  -*- lexical-binding:t -*-
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
		     '(("blockp"
			"#+begin_src python\n  $0\n#+end_src\n"
			"#+beginp_ <lang> ...#+end_" nil nil nil
			"/Users/peter/.emacs.d/snippets/org-mode/blockp"
			nil nil)
		       ("blocke"
			"#+begin_src emacs-lisp\n  $0\n#+end_src\n"
			"#+begin <lang> ...#+end_" nil nil nil
			"/Users/peter/.emacs.d/snippets/org-mode/blocke"
			nil nil)
		       ("block_" "#+begin_src $0\n  $1\n#+end_src\n"
			"#+begin <lang> ...#+end_" nil nil nil
			"/Users/peter/.emacs.d/snippets/org-mode/block_"
			nil nil)))


;;; Do not edit! File generated at Thu Feb  5 11:34:40 2026
