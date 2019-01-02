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
                      ace-window
                      fsharp-mode
		      ))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa". "https://melpa.org/packages/"))
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
(setq racket-program "/usr/local/bin/racket")
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
(setq inferior-fsharp-program "/usr/local/bin/fsharpi --readline-")
(setq fsharp-compiler "/usr/local/bin/fsharpc")
(add-hook 'fsharp-mode-hook 'highlight-indentation-mode)

;;;;
;; Lisp misc
;;;;
(require 'paredit)
(require 'rainbow-delimiters)
(require 'flycheck)
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
(load-theme 'solarized t)
(global-display-line-numbers-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (starter-kit-lisp rainbow-delimiters racket-mode markdown-mode helm-projectile helm-ag fsharp-mode evil elpy elein clojure-mode-extra-font-locking cider better-defaults ag ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'after-make-frame-functions
          (lambda (frame)
            (let ((mode (if (display-graphic-p frame) 'dark 'light)))
              (set-frame-parameter frame 'background-mode mode)
              (set-terminal-parameter frame 'background-mode mode))
            (enable-theme 'solarized)))
