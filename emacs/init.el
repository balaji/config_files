;;PACKAGE MANAGER
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
		      ))
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa". "http://melpa.org/packages/"))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(dolist (package my-packages)
  (unless (package-installed-p package)
    (package-install package)))

;;Helm. Dear Helm.
(require 'helm-config)
(helm-mode 1)
(helm-autoresize-mode t)
(setq helm-buffers-fuzzy-matching t
      helm-apropos-fuzzy-match t
      helm-M-x-fuzzy-match t
      helm-recentf-fuzzy-match t)
(projectile-mode t)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x g") 'helm-projectile-grep)
(global-set-key (kbd "C-x f") 'helm-projectile-find-file)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-x o") 'ace-window)

(global-company-mode)
(setq vc-follow-symlinks t)

;;vim, dear vim.
(evil-mode)

(add-hook 'racket-repl-mode-hook 'paredit-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;;Global key maps
(global-set-key [f7] 'paredit-mode)
(global-set-key [f6] 'evil-mode)

;;Editor customizations
(global-display-line-numbers-mode)
(when (display-graphic-p) 
  (set-default-font "Consolas-13"))
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

(setq racket-program "/usr/bin/racket")
(setq tab-always-indent 'complete)
(load-theme 'zenburn t)
;; For elpy
(setq elpy-rpc-python-command "python3")
;; For interactive shell
(setq python-shell-interpreter "python3")

;;;;
;; Clojure
;;;;

;; Enable paredit for Clojure
(add-hook 'clojure-mode-hook 'enable-paredit-mode)

;; This is useful for working with camel-case tokens, like names of
;; Java classes (e.g. JavaClassName)
(add-hook 'clojure-mode-hook 'subword-mode)

;; A little more syntax highlighting
(require 'clojure-mode-extra-font-locking)

;;;;
;; Cider
;;;;

;; provides minibuffer documentation for the code you're typing into
;; the repl
(add-hook 'cider-mode-hook 'eldoc-mode)

;; go right to the REPL buffer when it's finished connecting
(setq cider-repl-pop-to-buffer-on-connect t)

;; When there's a cider error, show its buffer and switch to it
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)

;; Where to store the cider history.
(setq cider-repl-history-file "~/.emacs.d/cider-history")

;; Wrap when navigating history.
(setq cider-repl-wrap-history t)

;; enable paredit in your REPL
(add-hook 'cider-repl-mode-hook 'paredit-mode)
;; enable line numbers mode in repl immediately
;;(add-hook 'cider-repl-mode-hook 'display-line-numbers-mode)

;; Use clojure mode for other extensions
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))

;;disable evil for cider repl
(evil-set-initial-state 'cider-repl-mode 'emacs)
