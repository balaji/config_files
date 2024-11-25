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

(tool-bar-mode 0)
(if (version< emacs-version "29")
    (global-linum-mode 1)
  (global-display-line-numbers-mode t))
(setq inhibit-startup-screen 1)
(scroll-bar-mode 0)

(setq backup-directory-alist `(("." . "~/.saves"))
      delete-old-versions t
      version-control t
      vc-follow-symlinks t)

(use-package evil-terminal-cursor-changer)

(if (display-graphic-p)
    (progn (menu-bar-mode 1)
	   (evil-terminal-cursor-changer-deactivate))
  (progn (menu-bar-mode 0)
	 (evil-terminal-cursor-changer-activate)	 ))
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode t))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package projectile
  :init
  (setq projectile-completion-system 'ivy)
  (setq projectile-project-search-path '("~/projects/advent_of_code/"))
  (setq projectile-indexing-method 'native)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :config
  (projectile-mode t))



(use-package paredit
  :hook
  ((emacs-lisp-mode lisp-mode) . paredit-mode)
  :bind
  ("<f7>" . 'paredit-mode))

(use-package rainbow-delimiters
  :hook
  ((prog-mode emacs-lisp-mode lisp-mode erlang-mode) . rainbow-delimiters-mode)
  :config
  (rainbow-delimiters-mode))

(use-package counsel
  :init
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :config
  (ivy-mode)
  :bind
  (("\C-s" . 'swiper)
   ("C-c C-r" . 'ivy-resume)
   ("<f6>" . 'ivy-resume)
   ("M-x" . 'counsel-M-x)
   ("C-x C-f" . 'counsel-find-file)
   ("<f1> f" . 'counsel-describe-function)
   ("<f1> v" . 'counsel-describe-variable)
   ("<f1> o" . 'counsel-describe-symbol)
   ("<f1> l" . 'counsel-find-library)
   ("<f2> i" . 'counsel-info-lookup-symbol)
   ("<f2> u" . 'counsel-unicode-char)
   ("C-c g" . 'counsel-git)
   ("C-c j" . 'counsel-git-grep)
   ("C-c k" . 'counsel-ag)
   ("C-x l" . 'counsel-locate)))

(use-package company
  :hook
  ((after-init) . 'global-company-mode))

(use-package flycheck
  :init
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  :config
  (global-flycheck-mode 1))

					;(setq load-path (cons "/usr/lib64/erlang/lib/tools-3.6/emacs" load-path))
					;(setq erlang-root-dir "/usr/lib64/erlang")
					;(setq exec-path (cons "/usr/lib64/erlang" exec-path))
					;(require 'erlang-start)
					;(add-hook 'erlang-mode-hook '(lambda() (setq indent-tabs-mode nil)))

(use-package erlang)

(setq lsp-keymap-prefix "C-l")
(use-package lsp-mode
  :init
  (setq lsp-log-io t)
  :hook
  ((erlang-mode) . 'lsp))

(use-package yasnippet
  :config
  (yas-global-mode t))

(use-package lsp-ui
  :config
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-position 'bottom))

(use-package origami
  :hook
  ((erlang-mode) . origami-mode))

(use-package lsp-origami
  :after origami
  :hook
  ((origami-mode) . lsp-origami-mode))

(use-package lsp-ivy)

(use-package which-key
  :hook
  ((erlang-mode) . which-key-mode))
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

(use-package solaire-mode
  :config (solaire-global-mode +1))

(use-package doom-themes
  :config (load-theme 'doom-dark+ t))

(use-package ace-window
  :bind
  (("M-o" . ace-window)))

(use-package powerline
  :config
  (powerline-default-theme))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-display-line-numbers-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Cascadia Code" :foundry "SAJA" :slant normal :weight regular :height 102 :width normal)))))
