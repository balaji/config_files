;;;
;; Package Manager
;;;;
(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(require 'use-package)

(cond
 ((string-equal system-type "gnu/linux")
  (use-package vterm :ensure t)))

(use-package slime :ensure t
  :init
  (setq inferior-lisp-program "sbcl"))

(use-package racket-mode :ensure t)

(use-package projectile
  :ensure t
  :init
  (setq projectile-completion-system 'helm)
  :config
  (projectile-mode t))

(use-package better-defaults :ensure t)

(use-package ag :ensure t)

(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
         ("C-c h" . helm-command-prefix)
         ("M-y" . helm-show-kill-ring)
         ("C-x b" . helm-mini)
         ("C-x C-f" . helm-find-files)
         ("C-c o" . helm-occur)
         ("C-c r b" . helm-filtered-bookmarks))
  :init
  (setq helm-mode-fuzzy-match t
        helm-completion-in-region-fuzzy-match t)
  :config
  (helm-mode 1)
  (helm-autoresize-mode 1))

(use-package helm-projectile
  :ensure t
  :commands (helm-projectile-on)
  :bind (("C-x g" . helm-projectile-grep)
         ("C-x f" . helm-projectile-find-file)))

(use-package helm-ag :ensure t)

(use-package company
  :ensure t
  :hook (after-init . global-company-mode))

(use-package rainbow-delimiters
  :ensure t
  :hook ((prog-mode racket-repl-mode) . rainbow-delimiters-mode))

(use-package paredit
  :ensure t
  :bind (([f7] . paredit-mode))
  :hook ((emacs-lisp-mode racket-mode racket-repl-mode) . paredit-mode))

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

(use-package monokai-theme :ensure t)

;;;;
;; Editor Stuff
;;;;
(tool-bar-mode 0)
(menu-bar-mode 0)
(global-linum-mode t)

(setq backup-directory-alist `(("." . "~/.saves"))
      delete-old-versions t
      version-control t
      vc-follow-symlinks t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Cascadia Code" :foundry "SRC" :slant normal :weight normal :height 100 :width normal)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("d9646b131c4aa37f01f909fbdd5a9099389518eb68f25277ed19ba99adeb7279" default))
 '(package-selected-packages
   '(racket-mode monokai-theme use-package magit rainbow-delimiters paredit helm-projectile helm-ag flycheck company better-defaults ag ace-window)))
