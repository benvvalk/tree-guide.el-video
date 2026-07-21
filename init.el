;; Use large font for YouTube video
(set-face-attribute 'default nil :height 140)

;; Disable annoying bell sound when pressing C-g, etc.
(setq ring-bell-function #'ignore)

;; Add MELPA (popular third-party package repo)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; Install and load `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Automatically reindent lisp code while editing
(use-package aggressive-indent
  :ensure t
  :hook emacs-lisp-mode)

;; Show tree guides while editing Emacs lisp code
(use-package tree-guide
  ;; first run: `git clone https://github.com/benvvalk/tree-guide.el.git`
  :load-path "~/git/tree-guide.el/"
  :hook emacs-lisp-mode)

;; Highlight current lisp expression
(use-package paren
  :config
  ;; Highlight entire expression, not just matching paren!
  (setq show-paren-style 'expression)
  :hook (emacs-lisp-mode . show-paren-local-mode))

;; Use `lispy' for structural navigation/editing.
(use-package lispy
  :ensure t
  :hook emacs-lisp-mode)

;; Use `hideshow-org' for folding/unfolding lisp expressions
(use-package hideshow-org
  :ensure t
  :config
  ;; Don't move the cursor when folding/unfolding!
  (advice-add #'hs-toggle-hiding
              :around
              (lambda (orig-function)
                (save-excursion
                  (funcall orig-function))))
  :hook (emacs-lisp-mode . hs-org/minor-mode))
