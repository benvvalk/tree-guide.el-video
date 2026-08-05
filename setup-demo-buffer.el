(use-package tree-guide
    :load-path "~/git/tree-guide.el/")

(with-current-buffer (get-buffer-create "*tree-guide video: final config preview*")
  (insert-file "~/git/tree-guide.el/tree-guide.el")
  (emacs-lisp-mode)
  (use-package tree-guide
    :load-path "~/git/tree-guide.el/")
  (tree-guide-mode)
  (use-package aggressive-indent
    :ensure t)
  (aggressive-indent-mode)
  (use-package paren)
  (setq-local show-paren-style 'expression)
  (show-paren-local-mode)
  (use-package lispy
    :ensure t)
  (lispy-mode)
  (use-package hideshow-org
    :ensure t)
  (hs-org/minor-mode)
  (setq final-config-preview-buffer (current-buffer))
  (advice-add #'hs-toggle-hiding
	      :around
	      (lambda (orig-function)
		;; Make the advice local to the demo buffer, so
		;; I can demonstrate implementing the same advice
		;; later in the video.
		(if (eq (current-buffer) final-config-preview-buffer)
		    (save-excursion
		      (funcall orig-function))
		  (funcall orig-function)))))
