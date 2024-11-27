(use-package expand-region
  :config
  (global-set-key (kbd "C-=") 'er/expand-region)
  (global-set-key (kbd "C--") 'er/contract-region))

(use-package fzf
  :bind
  (("C-s" . 'fzf-find-in-buffer)))

(use-package winum
  :init
  (winum-set-keymap-prefix (kbd "C-c"))
  :config
  (winum-mode))

(use-package solaire-mode
  :config(solaire-global-mode +1))

(use-package doom-themes
  :config (load-theme 'doom-dark+ t))

(use-package powerline
  :config
  (powerline-default-theme))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode t))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

