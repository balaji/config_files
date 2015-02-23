(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'load-path "~/.emacs.d/vendor/powerline")

;;SLIME
(add-to-list 'load-path "~/Projects/slime")
(require 'slime)
(setq inferior-lisp-program "/usr/local/bin/ccl")
(slime-setup)
(slime-setup '(slime-fancy))

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
                      clojure-mode))
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa". "http://melpa.org/packages/"))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;;Helm. Dear Helm.
(require 'helm)
(require 'helm-config)
(helm-mode 1)
(helm-autoresize-mode t)
(setq helm-buffers-fuzzy-matching t
      helm-apropos-fuzzy-match t
      helm-M-x-fuzzy-match t
      helm-recentf-fuzzy-match t)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x g") 'helm-projectile-grep)
(global-set-key (kbd "C-x f") 'helm-projectile-find-file)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x o") 'helm-occur)

(global-company-mode)

;;vim, dear vim.
(evil-mode)

(add-hook 'slime-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;;Global key maps
(global-set-key [f7] 'paredit-mode)
(global-set-key [f6] 'evil-mode)
(global-set-key [f9] 'cider-jack-in)

;;Editor customizations
(set-default-font "Fira Mono-13")
(require 'color-theme)
(color-theme-monokai)
(global-linum-mode)
(setq linum-format "%d ")
(require 'powerline)
(powerline-center-evil-theme)
(menu-bar-mode)
