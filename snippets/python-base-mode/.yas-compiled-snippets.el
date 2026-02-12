;;; "Compiled" snippets and support files for `python-base-mode'  -*- lexical-binding:t -*-
;;; Snippet definitions:
;;;
(yas-define-snippets 'python-base-mode
		     '(("super"
			"super(`(replace-regexp-in-string \"\\\\([.]\\\\)[^.]+$\" \", self).\" (python-info-current-defun) nil nil 1)`($1)\n$0\n"
			"super" nil ("object oriented") nil
			"/Users/peter/.emacs.d/snippets/python-base-mode/super"
			nil nil)
		       ("print_" "print(f\"{$0}\")\n" "print" nil nil
			nil
			"/Users/peter/.emacs.d/snippets/python-base-mode/print_"
			nil nil)
		       ("pp" "from pprint import pprint as pp\n"
			"import_pprint" nil ("debug") nil
			"/Users/peter/.emacs.d/snippets/python-base-mode/pp"
			nil nil)
		       ("main_"
			"def main():\n    $0\n\nif __name__ == \"__main__\":\n   main()\n"
			"main_" nil nil nil
			"/Users/peter/.emacs.d/snippets/python-base-mode/main_"
			nil nil)
		       ("for" "for ${var} in ${collection}:\n    $0\n"
			"for ... in ... : ..." nil
			("control structure") nil
			"/Users/peter/.emacs.d/snippets/python-base-mode/for"
			nil nil)
		       ("ds_" "\"\"\"$0.\"\"\"\n" "docstring" nil nil
			nil
			"/Users/peter/.emacs.d/snippets/python-base-mode/ds_"
			nil nil)
		       ("dataclass"
			"from dataclasses import dataclass\n\n@dataclass\nclass ${1:class}:\n    $0\n"
			"dataclass" nil ("object oriented") nil
			"/Users/peter/.emacs.d/snippets/python-base-mode/dataclass"
			nil nil)
		       ("bp" "breakpoint()\n" "breakpoint" nil nil nil
			"/Users/peter/.emacs.d/snippets/python-base-mode/bp"
			nil nil)
		       ("#!" "#!/usr/bin/env python" "#!" nil nil nil
			"/Users/peter/.emacs.d/snippets/python-base-mode/#!"
			nil nil)))


;;; Do not edit! File generated at Thu Feb  5 11:34:40 2026
