(use-package expand-region
  :config
  (global-set-key (kbd "C-=") 'er/expand-region)
  (global-set-key (kbd "C--") 'er/contract-region))

(use-package fzf)

(use-package ace-window
  :config
  (global-set-key (kbd "M-o") 'ace-window)
  (ace-window-display-mode))

(use-package avy)

(use-package solaire-mode
  :config(solaire-global-mode +1))

(use-package doom-themes
  :config (load-theme 'doom-one t))

(use-package doom-modeline
  :config
  (doom-modeline-mode))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-fine-undo t)
  (setq evil-undo-system 'undo-redo)
  :config
  (evil-mode t))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package magit)
