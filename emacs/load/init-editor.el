(use-package orderless
  :custom
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

;; Enable rich annotations using the Marginalia package
(use-package marginalia
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))

  ;; The :init section is always executed.
  :init

  ;; Marginalia must be activated in the :init section of use-package such that
  ;; the mode gets enabled right away. Note that this forces loading the
  ;; package.
  (marginalia-mode))

(use-package vertico
  :custom
  ;; (vertico-scroll-margin 0) ;; Different scroll margin
  ;; (vertico-count 20) ;; Show more candidates
  ;; (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :init
  (vertico-mode))

(use-package consult
  :bind
  (("C-x b" . consult-buffer)
   ("C-s" . consult-line)
   ("C-c r" . consult-recent-file)))

(use-package expand-region
  :config
  (global-set-key (kbd "C-=") 'er/expand-region)
  (global-set-key (kbd "C--") 'er/contract-region))

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

(use-package counsel-fd)

(use-package find-file-in-project
  :config
  (setq ffip-use-rust-fd t))

(use-package whaler
  :ensure t
  :config
  (setq whaler-directories-alist projects-path)
					;(setq whaler-oneoff-directories-alist '("~/.config/emacs")) ;; List of projects to add directly.
  (setq whaler-include-hidden-directories nil)
  (setq whaler-default-working-directory "~")
  (whaler-populate-projects-directories)
  :general
  (leader-global
    "ff" 'find-file-in-project-by-selected
    "zf" 'consult-fd
    "ss" 'consult-ripgrep
    "sh" 'consult-outline
    "pp" 'whaler
    "pv" 'custom/whaler-dired-root
    "cc" 'custom/whaler-compile
    "co" 'custom/whaler-compile-other
    "wr" 'whaler-populate-projects-directories
    )
  )

;; Custom functions to extend whaler
(cl-defun custom/whaler-prompt (&optional (post " >> ") (dir default-directory))
  "Whaler prompt. A custom prompt for each function."
  (concat "[" (f-filename dir) "]" post))

(defun custom/whaler-compile()
  "Execute `compile' function for `whaler.el' in the cwd."
  (interactive)
  (whaler-execute-function-on-current-working-directory
   (lambda (dir)
     (interactive)
     (let (
	   (compilation-command
	    (read-string (custom/whaler-prompt " -- Compile commmand >> " dir)
			 )
	    ))
       (compile compilation-command)))))

(defun custom/whaler-dired-root ()
  "Open root project in dired for `whaler.el'"
  (interactive)
  (whaler-execute-function-on-current-working-directory 'dired ))

(defun custom/whaler-compile-other ()
  "Wrapper for executing `compile' in another directory."
  (interactive)
  (let (
	(compilation-command
	 (read-string (custom/whaler-prompt " -- Compile commmand >> "))))
    (compile compilation-command)))

