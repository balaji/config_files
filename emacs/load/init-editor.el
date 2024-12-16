(use-package ace-window
  :config
  (global-set-key (kbd "M-o") 'ace-window)
  (setq aw-dispatch-always t)
  (ace-window-display-mode))

(use-package consult
  :bind
  (("C-x b" . consult-buffer)
   ("C-s" . consult-line)
   ("C-c r" . consult-recent-file)))

(use-package avy)

(use-package doom-themes
  :config (load-theme 'doom-vibrant t))

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

(use-package expand-region
  :config
  (global-set-key (kbd "C-=") 'er/expand-region)
  (global-set-key (kbd "C--") 'er/contract-region))

(use-package find-file-in-project
  :config
  (setq ffip-use-rust-fd t))

(use-package general
  :ensure t
  :config
  (general-auto-unbind-keys)

  (defconst slk/emacs-leader-global-prefix "C-c")
  (general-define-key
   :states '(emacs insert normal)
   :prefix-map 'custom/prefix
   :global-prefix "C-c"
   :non-normal-prefix "M-SPC"
   :prefix "SPC")

  (general-create-definer leader-global
    :keymaps 'custom/prefix))

(use-package magit)

(use-package marginalia
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package vertico
  :custom
  (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :init
  (vertico-mode))

(use-package solaire-mode
  :config
  (solaire-global-mode +1))

(use-package whaler
  :ensure t
  :config
  (setq whaler-directories-alist projects-path)
  (setq whaler-include-hidden-directories nil)
  (setq whaler-default-working-directory "~")
  (whaler-populate-projects-directories)
  :general
  (leader-global
    "ff" 'find-file-in-project-by-selected
    "sf" 'consult-fd
    "sr" 'consult-ripgrep
    "so" 'consult-outline
    "sc" 'avy-goto-char
    "sw" 'avy-goto-word-1
    "sl" 'avy-goto-line
    "pp" 'whaler
    "wr" 'whaler-populate-projects-directories
    ))

