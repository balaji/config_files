(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'load-path "/Users/balaji/Projects/slime")
(add-to-list 'load-path "~/.emacs.d/vendor/powerline")

;;SLIME for Common Lisp
(require 'slime)
(setq inferior-lisp-program "/usr/local/bin/ccl")
(slime-setup)
(slime-setup '(slime-fancy))

;;POWERLINE
(require 'powerline)
(powerline-center-evil-theme)

;;PACKAGES
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(defvar my-packages '(evil
                      starter-kit
                      starter-kit-lisp
                      starter-kit-ruby
                      cider
                      evil-paredit
                      evil-surround
                      rainbow-delimiters
                      projectile
                      helm
                      helm-projectile
                      highlight))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;;HELM
(require 'helm)
(require 'helm-config)
(helm-mode 1)
(helm-autoresize-mode t)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x g") 'helm-projectile-grep)
(global-set-key (kbd "C-x f") 'helm-projectile-find-file)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(require 'color-theme)
(color-theme-monokai)

;;EVIL
(evil-mode)

(global-company-mode)
(global-linum-mode)
(setq linum-format "%d ")

(add-hook 'slime-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(global-set-key [f7] 'paredit-mode)
(global-set-key [f6] 'evil-mode)

(add-hook 'cider-interaction-mode-hook 'cider-turn-on-eldoc-mode)
(setq cider-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "*cider*")
(global-set-key [f9] 'cider-jack-in)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain one such instance.
 ;; If there is more than one, they won't work right.
 )
(set-default-font "Fira Mono-13")
