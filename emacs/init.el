;;straight.el, emacs package manager
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(use-package straight
  :custom
  (straight-use-package-by-default t))

(use-package slime
  :config (setq inferior-lisp-program "sbcl"))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package auto-complete
  :after slime
  :config (ac-config-default))

(use-package ac-slime
  :hook ((slime-mode slime-repl-mode) . set-up-slime-ac)
  :after auto-complete
  :config (add-to-list 'ac-modes 'slime-repl-mode))

(use-package powerline
  :config
  (powerline-center-evil-theme))

(use-package counsel
  :init
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  :bind
  ("C-s" . swiper-isearch)
  ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("M-y" . counsel-yank-pop)
  ("<f1> f" . counsel-describe-function)
  ("<f1> v" . counsel-describe-variable)
  ("<f1> l" . counsel-find-library)
  ("<f2> i" . counsel-info-lookup-symbol)
  ("<f2> u" . counsel-unicode-char)
  ("<f2> j" . counsel-set-variable)
  ("C-x b" . ivy-switch-buffer)
  ("C-c v" . ivy-push-view)
  ("C-c V" . ivy-pop-view)
  ("C-c z" . counsel-fzf)
  :config
  (ivy-mode 1))

(use-package projectile
  :init
  (setq projectile-completion-system 'ivy)
  :bind-keymap
  ("s-p" . projectile-command-map)
  :config
  (projectile-mode t))

(use-package rainbow-delimiters
  :hook ((prog-mode slime-repl-mode) . rainbow-delimiters-mode))

(use-package paredit
  :bind (([f7] . paredit-mode))
  :hook ((prog-mode slime-repl-mode) . paredit-mode))

(use-package ace-window
  :bind (("M-o" . ace-window)))

(use-package flycheck
  :init
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  :config
  (global-flycheck-mode 1))

(use-package magit)

(use-package dired-sidebar
  :commands (dired-sidebar-toggle-sidebar)
  :bind ("C-x C-n" . dired-sidebar-toggle-sidebar)
  :init
  (add-hook 'dired-sidebar-mode-hook
	    (lambda ()
	      (unless (file-remote-p default-directory)
		(auto-revert-mode)))))

(use-package monokai-theme
  :config (load-theme 'monokai t))

(tool-bar-mode 0)
(menu-bar-mode 0)
; on v29
(global-display-line-numbers-mode t)
(scroll-bar-mode 0)

(setq backup-directory-alist `(("." . "~/.saves"))
      delete-old-versions t
      version-control t
      vc-follow-symlinks t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "SRC" :slant normal :weight normal :height 130 :width normal)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" default))
 '(package-selected-packages
   '(powerline expand-region projectile ac-slime auto-complete slime)))
