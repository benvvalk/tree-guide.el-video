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

;; Automatically re-indent code during editing
(use-package aggressive-indent
  :ensure t
  :hook emacs-lisp-mode)

;; Render guides to show parent-child structure of code
(use-package tree-guide
  ;; first run: `git clone https://github.com/benvvalk/tree-guide.el.git`
  :load-path "~/git/tree-guide.el/"
  :hook emacs-lisp-mode)

;; Highlight current lisp expression
(use-package paren
  :config
  (setq show-paren-style 'expression)
  :hook (emacs-lisp-mode . show-paren-local-mode))

;; Awesome structural navigation/editing
(use-package lispy
  :ensure t
  :hook emacs-lisp-mode)

;; Fold/unfold lisp expressions using the TAB key
(use-package hideshow-org
  :ensure t
  :config
  ;; Bugfix: Don't move the cursor when folding/unfolding!
  (advice-add #'hs-toggle-hiding
              :around
              (lambda (orig-fun)
                (save-excursion
                  (funcall orig-fun))))
  :hook (emacs-lisp-mode . hs-org/minor-mode))
