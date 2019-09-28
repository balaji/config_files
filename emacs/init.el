;;;
;; Package Manager
;;;;

(require 'cc-mode)
(condition-case nil
    (require 'use-package)
  (file-error
   (require 'package)
 
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
   (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
   (package-initialize)
   (package-refresh-contents)
   (package-install 'use-package)
   (require 'use-package)))

(use-package projectile :ensure t)
(use-package yasnippet :ensure t)
(use-package better-defaults :ensure t)
(use-package ag :ensure t)
(use-package helm :ensure t)
(use-package helm-projectile :ensure t)
(use-package helm-ag :ensure t)
(use-package company :ensure t)
(use-package rainbow-delimiters :ensure t)
(use-package paredit :ensure t)
(use-package markdown-mode :ensure t)
(use-package ace-window :ensure t)
(use-package flycheck :ensure t)
(use-package magit :ensure t)
(use-package monokai-theme :ensure t)

;;;;
;; Helm
;;;;
(require 'helm-config)
(helm-mode 1)
(helm-autoresize-mode 1)
(setq helm-buffers-fuzzy-matching t
      helm-apropos-fuzzy-match t
      helm-M-x-fuzzy-match t
      helm-recentf-fuzzy-match t)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-c r b") 'helm-filtered-bookmarks)

;;;;
;; Projectile
;;;;
(require 'projectile)
(require 'helm-projectile)
(projectile-mode t)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(global-set-key (kbd "C-x g") 'helm-projectile-grep)
(global-set-key (kbd "C-x f") 'helm-projectile-find-file)

;;;;
;; Ace Window
;;;;
(global-set-key (kbd "C-x o") 'ace-window)

;;;;
;; Lisp misc
;;;;
(require 'paredit)
(require 'rainbow-delimiters)
(require 'flycheck)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
(global-flycheck-mode)
(tool-bar-mode 0)
(menu-bar-mode 0)
(global-set-key [f7] 'paredit-mode)
(load-theme 'monokai t)
(setq backup-directory-alist `(("." . "~/.saves"))
      delete-old-versions t
      version-control t)

;;rainbow delimiters everywhere
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(setq ispell-program-name "/usr/local/bin/ispell"
      inferior-lisp-program "/usr/local/acl10.1express/alisp"
      slime-contribs '(slime-fancy))
(require 'company) ;;complete anything
(add-hook 'after-init-hook 'global-company-mode)
;; editor stuff.
(setq vc-follow-symlinks t)
(global-linum-mode t)
(setq linum-format "%4d \u2502 ")
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)

;;org-mode
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-directory "~/Dropbox/Personal"
      org-default-notes-file (concat org-directory "/inbox.org"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "SRC" :slant normal :weight normal :height 110 :width normal)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (use-package yasnippet monokai-theme magit rainbow-delimiters paredit markdown-mode helm-projectile helm-ag flycheck company better-defaults ag ace-window))))

