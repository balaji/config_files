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
                      evil
                      rainbow-delimiters
                      elpy
                      cider
                      clojure-mode
                      clojure-mode-extra-font-locking
                      paredit
                      racket-mode
                      markdown-mode
                      ace-window
                      fsharp-mode
                      flycheck
                      haskell-mode
                      intero
                      hindent
                      zenburn-theme
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
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (let ((mode (if (display-graphic-p frame) 'dark 'light)))
              (set-frame-parameter frame 'background-mode mode)
              (set-terminal-parameter frame 'background-mode mode))
            (enable-theme 'zenburn)))

(setq ispell-program-name "/usr/local/bin/ispell")


;;;;
;; Misc
;;;;
(require 'company) ;;complete anything
(add-hook 'after-init-hook 'global-company-mode)
;; editor stuff.
(setq vc-follow-symlinks t)
(load-theme 'zenburn t)
(global-display-line-numbers-mode)

;;;;
;; Haskell
;;;;
(require 'intero)
(require 'haskell-mode)
(require 'haskell-interactive-mode)
(require 'haskell)
(require 'hindent)
(add-hook 'haskell-mode-hook 'hindent-mode)
(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat my-cabal-path path-separator (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   (quote
    ("84890723510d225c45aaff941a7e201606a48b973f0121cb9bcb0b9399be8cba" default)))
 '(fci-rule-color "#383838")
 '(haskell-tags-on-save t)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (zenburn-theme starter-kit-lisp rainbow-delimiters racket-mode markdown-mode helm-projectile helm-ag fsharp-mode evil elpy elein clojure-mode-extra-font-locking cider better-defaults ag ace-window)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
