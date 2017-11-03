;;SLIME
(add-to-list 'load-path "~/Projects/slime")
(require 'slime)
(setq inferior-lisp-program "/usr/local/bin/sbcl")
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
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x o") 'helm-occur)

(global-company-mode)
(setq vc-follow-symlinks t)

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
(global-linum-mode)
(setq linum-format "%d ")
(when (display-graphic-p) 
  (set-default-font "Consolas-13")
  (require 'powerline)
  (powerline-center-evil-theme)
  (require 'color-theme)
  (color-theme-monokai))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (org-magit evil-magit color-theme-solarized solaire-mode starter-kit-lisp rainbow-delimiters powerline helm-projectile helm-ag evil company color-theme-monokai better-defaults ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
