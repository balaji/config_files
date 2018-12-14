;;;;
;; Package Manager
;;;;
(require 'package)
(defvar my-packages '(better-defaults
                      starter-kit
                      starter-kit-lisp
                      projectile
                      ag
                      helm
                      helm-projectile
                      helm-ag
                      company
                      evil
                      rainbow-delimiters
                      racket-mode
                      elpy
                      cider
                      clojure-mode
                      clojure-mode-extra-font-locking
                      elein
                      markdown-mode
                      zenburn-theme
                      ace-window
                      fsharp-mode
                      flycheck
		      ))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa". "http://melpa.org/packages/"))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(dolist (package my-packages)
  (unless (package-installed-p package)
    (package-install package)))

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
;; Evil
;;;;
(setq evil-toggle-key "<f6>") ;;set this before loading evil
(require 'evil)
(evil-mode)
;;disable evil for cider repl
(evil-set-initial-state 'cider-repl-mode 'emacs)

;;;;
;; Racket
;;;;
(require 'racket-mode)
(cond
 ((eq system-type 'darwin)
  (setq racket-program "/usr/local/bin/racket"))
 ((eq system-type 'gnu/linux)
  (setq racket-program "/usr/bin/racket")))
(setq tab-always-indent 'complete)
(add-hook 'racket-repl-mode-hook 'paredit-mode)

;;;;
;; Elpy
;;;;
(require 'elpy)
(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3")

;;;;
;; Clojure
;;;;
(require 'clojure-mode)
(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'clojure-mode-hook 'subword-mode)
(require 'clojure-mode-extra-font-locking)
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))

;;;;
;; Cider
;;;;
(require 'cider)
(add-hook 'cider-mode-hook 'eldoc-mode)
(setq cider-repl-pop-to-buffer-on-connect t)
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)
(setq cider-repl-history-file "~/.emacs.d/cider-history")
(setq cider-repl-wrap-history t)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

;;;;
;; Fsharp
;;;;
(cond
 ((eq system-type 'darwin)
  (setq inferior-fsharp-program "/usr/local/bin/fsharpi --readline-")
  (setq fsharp-compiler "/usr/local/bin/fsharpc"))
 ((eq system-type 'gnu/linux)
  (setq inferior-fsharp-program "/usr/bin/fsharpi --readline-")
  (setq fsharp-compiler "/usr/bin/fsharpc")))
(add-hook 'fsharp-mode-hook 'highlight-indentation-mode)

;;;;
;; Lisp misc
;;;;
(require 'paredit)
(require 'rainbow-delimiters)
(require 'flycheck)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
(global-flycheck-mode)
(global-set-key [f7] 'paredit-mode)
;;rainbow delimiters everywhere
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;;;;
;; Misc
;;;;
(require 'company) ;;complete anything
(add-hook 'after-init-hook 'global-company-mode)
;; editor stuff.
(setq vc-follow-symlinks t)
(load-theme 'zenburn t)
(global-display-line-numbers-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" default)))
 '(package-selected-packages
   (quote
    (ace-window markdown-mode zenburn-theme org-magit evil-magit starter-kit-lisp rainbow-delimiters powerline helm-projectile helm-ag evil company better-defaults ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
