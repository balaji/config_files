;;;
;; Package Manager
;;;;
(require 'package)
(defvar my-packages '(better-defaults
                      projectile
                      ag
                      helm
                      helm-projectile
                      helm-ag
                      company
                      rainbow-delimiters
                      paredit
                      markdown-mode
                      ace-window
                      flycheck
		      powerline
		      solarized-theme
		      ))

(add-to-list 'package-archives
             '("melpa". "https://melpa.org/packages/")
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(dolist (package my-packages)
  (unless (package-installed-p package)
    (package-install package)))

(require 'powerline)
(powerline-center-theme)

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
;;rainbow delimiters everywhere
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(setq ispell-program-name "/usr/local/bin/ispell")
(require 'company) ;;complete anything
(add-hook 'after-init-hook 'global-company-mode)
;; editor stuff.
(setq vc-follow-symlinks t)
(global-linum-mode t)
(setq linum-format "%4d ")
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

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
 '(custom-safe-themes
   (quote
    ("0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" default))))
