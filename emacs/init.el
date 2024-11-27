(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
	"straight/repos/straight.el/bootstrap.el"
	(or (bound-and-true-p straight-base-dir)
	    user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(setq straight-use-package-by-default t)
(straight-use-package 'use-package)

(tool-bar-mode 0)
(cua-mode t)
(if (version< emacs-version "29")
    (global-linum-mode 1)
  (global-display-line-numbers-mode t))
(setq inhibit-startup-screen 1)
(scroll-bar-mode 0)
(setq visible-bell 1)
(setq backup-directory-alist `(("." . "~/.saves"))
      delete-old-versions t
      version-control t
      vc-follow-symlinks t)

(use-package evil-terminal-cursor-changer)

(if (display-graphic-p)
    (progn (menu-bar-mode 1)
	   (evil-terminal-cursor-changer-deactivate))
  (progn (menu-bar-mode 0)
	 (evil-terminal-cursor-changer-activate)))
(custom-set-faces
 '(default ((t (:family "Cascadia Code" :foundry "SAJA" :slant normal :weight regular :height 102 :width normal)))))


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
  (setq projectile-globally-ignored-file-suffixes '("beam"))
  (setq projectile-globally-ignored-directories '("_build"))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :config
  (projectile-mode t))

(use-package paredit
  :hook
  ((emacs-lisp-mode lisp-mode erlang-mode) . paredit-mode)
  :bind
  ("<f7>" . 'paredit-mode))

(use-package rainbow-delimiters
  :hook
  ((prog-mode emacs-lisp-mode lisp-mode erlang-mode) . rainbow-delimiters-mode)
  :config
  (rainbow-delimiters-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package counsel
  :after orderless
  :init
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-re-builders-alist '((t . orderless-ivy-re-builder)))
  :config
  (ivy-mode)
  (add-to-list 'ivy-highlight-functions-alist '(orderless-ivy-re-builder . orderless-ivy-highlight))
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

(setq load-path (cons  "/home/linuxbrew/.linuxbrew/lib/erlang/lib/tools-4.1/emacs" load-path))
(setq erlang-root-dir "/home/linuxbrew/.linuxbrew/lib/erlang")
(setq exec-path (cons "/home/linuxbrew/.linuxbrew/lib/erlang/bin" exec-path))
(require 'erlang-start)

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-l")
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
  ((erlang-mode) . origami-mode)
  :config
  (global-origami-mode 1))

(use-package lsp-ivy)

(use-package which-key
  :config
  (which-key-mode 1))

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

(use-package solaire-mode
  :config(solaire-global-mode +1))

(use-package doom-themes
  :config (load-theme 'doom-dark+ t))

(use-package powerline
  :config
  (powerline-default-theme))

(use-package magit)

(use-package winum
  :init
  (winum-set-keymap-prefix (kbd "C-c"))
  :config
  (winum-mode))

(use-package marginalia
  :bind
  (:map minibuffer-local-map
	("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package expand-region
  :config
  (global-set-key (kbd "C-=") 'er/expand-region)
  (global-set-key (kbd "C--") 'er/contract-region))
