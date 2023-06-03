(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(require 'package)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(use-package slime
  :ensure t
  :config (setq inferior-lisp-program "sbcl"))

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package auto-complete
  :ensure t
  :after slime
  :config (ac-config-default))

(use-package ac-slime
  :ensure t
  :hook ((slime-mode slime-repl-mode) . set-up-slime-ac)
  :after auto-complete
  :config (add-to-list 'ac-modes 'slime-repl-mode))

(use-package powerline
  :ensure t
  :config
  (powerline-center-evil-theme))

(use-package counsel
  :ensure t
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
  :ensure t
  :init
  (setq projectile-completion-system 'ivy)
  :config
  (projectile-mode t))
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)

(use-package rainbow-delimiters
  :ensure t
  :hook ((prog-mode slime-repl-mode) . rainbow-delimiters-mode))

(use-package paredit
  :ensure t
  :bind (([f7] . paredit-mode))
  :hook ((prog-mode slime-repl-mode) . paredit-mode))

(use-package ace-window
  :ensure t
  :bind (("C-x o" . ace-window)))

(use-package flycheck
  :ensure t
  :init
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  :config
  (global-flycheck-mode 1))

(use-package magit :ensure t)

(use-package solarized-theme
  :ensure t
  :after powerline
  :config
  (load-theme 'solarized-light t)
  :init
  (setq powerline-color1 "#657b83")
  (setq powerline-color2 "#839496")
  (set-face-attribute 'mode-line nil
		      :foreground "#fdf6e3"
		      :background "#859900"
		      :box nil)
  (set-face-attribute 'mode-line-inactive nil
		      :box nil))

;;;;
;; Editor Stuff
;;;;
(tool-bar-mode 0)
(menu-bar-mode 0)
(global-linum-mode t)
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
 '(default ((t (:family "Monaco" :foundry "SRC" :slant normal :weight normal :height 115 :width normal)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" default))
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
   '(fzf solarized solarized-theme powerline expand-region projectile ac-slime auto-complete slime use-package)))
