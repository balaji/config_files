(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-o") 'ace-window)
  (setq aw-dispatch-always t)
  (ace-window-display-mode))

(use-package avy
  :ensure t)

(use-package cape
  :ensure t
  :bind ("C-c p" . cape-prefix-map))

(use-package consult
  :ensure t
  :bind
  (("C-x b" . consult-buffer)
   ("C-s" . consult-line)
   ("C-c r" . consult-recent-file)))

(use-package corfu
  :ensure t
  :bind
  (:map corfu-map ("SPC" . corfu-insert-separator))
  :init
  (global-corfu-mode))

(use-package doom-themes
  :ensure t
  :config (load-theme 'doom-vibrant t))

(use-package doom-modeline
  :ensure t
  :config
  (doom-modeline-mode))

(elpaca
    (eat :type git
         :host codeberg
         :repo "akib/emacs-eat"
         :files ("*.el" ("term" "term/*.el") "*.texi"
                 "*.ti" ("terminfo/e" "terminfo/e/*")
                 ("terminfo/65" "terminfo/65/*")
                 ("integration" "integration/*")
                 (:exclude ".dir-locals.el" "*-tests.el"))))

(use-package elpy
  :ensure t)

(use-package embark
  :ensure t
  :bind
  (("C-'" . embark-act)
   ("C-;" . embark-dwim)
   ("C-h b" . embark-bindings))
  :init
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(use-package embark-consult
  :ensure t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package erlang
  :ensure t)

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-fine-undo t)
  (setq evil-undo-system 'undo-redo)
  :config
  (evil-mode t))

(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region)
  (global-set-key (kbd "C--") 'er/contract-region))

(use-package find-file-in-project
  :ensure t
  :config
  (setq ffip-match-path-instead-of-filename t)
  (setq ffip-use-rust-fd t))

(use-package flycheck
  :ensure t
  :init
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  (setq flycheck-ruby-rubocop-executable "/Users/bala/stripe/pay-server/scripts/bin/rubocop.rb")
  (setq flycheck-ruby-executable "/Users/bala/.rbenv/shims/ruby")
  :config
  (global-flycheck-mode 1))

(use-package general
  :ensure t
  :config
  (general-auto-unbind-keys)
  (general-define-key
   :states '(emacs insert normal)
   :prefix-map 'custom/prefix
   :global-prefix "C-c"
   :non-normal-prefix "M-SPC"
   :prefix "SPC"
   "ff" 'find-file-in-project-by-selected
   "sf" 'consult-fd
   "sr" 'consult-ripgrep
   "so" 'consult-outline
   "sc" 'avy-goto-char
   "sw" 'avy-goto-word-1
   "sl" 'avy-goto-line
   "pp" 'whaler
   "wr" 'whaler-populate-projects-directories)

  (general-create-definer leader-global :keymaps 'custom/prefix))

(use-package lsp-mode
  :ensure t
  :custom
  (lsp-completion-provider :none) ;; we use Corfu!
  :init
  (setq lsp-keymap-prefix "C-l")
  (setq lsp-log-io t)
  (defun my/orderless-dispatch-flex-first (_pattern index _total)
    (and (eq index 0) 'orderless-flex))

  (defun my/lsp-mode-setup-completion ()
    (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
          '(orderless))
    ;; Optionally configure the first word as flex filtered.
    (add-hook 'orderless-style-dispatchers #'my/orderless-dispatch-flex-first nil 'local)
    ;; Optionally configure the cape-capf-buster.
    (setq-local completion-at-point-functions (list (cape-capf-buster #'lsp-completion-at-point))))
  :config
  ;; Decides if the buffer is Ruby and in pay server
  (defun activate-pay-server-sorbet-p (filename mode)
    (and
     (string-prefix-p (expand-file-name "~/stripe/pay-server")
                      filename)
     (or (eq major-mode 'ruby-mode) (eq major-mode 'enh-ruby-mode))))

  ;; Configure the connection to Sorbet
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("pay" "exec" "scripts/bin/typecheck" "--lsp" "--enable-all-experimental-lsp-features"))
                    :major-modes '(ruby-mode enh-ruby-mode)
                    :priority 25
                    :activation-fn 'activate-pay-server-sorbet-p
                    :server-id 'stripe-sorbet-lsp))

  :hook
  ((erlang-mode ruby-mode enh-ruby-mode) . 'lsp)
  (lsp-completion-mode . my/lsp-mode-setup-completion))

(use-package lsp-pyright
  :ensure t
  :custom (lsp-pyright-langserver-command "pyright") ;; or basedpyright
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))

(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-position 'bottom))

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

(use-package magit
  :ensure t)

(use-package marginalia
  :ensure t
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package rainbow-delimiters
  :ensure t
  :hook
  ((prog-mode emacs-lisp-mode lisp-mode erlang-mode) . rainbow-delimiters-mode)
  :config
  (rainbow-delimiters-mode))

(use-package ruby-mode
  :config
  (defun my-ruby-mode-hook ()
    (set-fill-column 80)
    (add-hook 'before-save-hook 'delete-trailing-whitespace nil 'local)
    (setq ruby-insert-encoding-magic-comment nil))
  (add-hook 'ruby-mode-hook 'my-ruby-mode-hook))

(use-package smartparens
  :ensure t
  :bind
  ("<f7>" . 'smartparens-mode)
  :config
  (require 'smartparens-config)
  (smartparens-global-mode t))

(use-package solaire-mode
  :ensure t
  :config
  (solaire-global-mode +1))

(use-package transient
  :ensure t)

(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t)
  :config
  (vertico-multiform-mode)
  (setq vertico-multiform-categories '((embark-keybinding grid)))
  :init
  (vertico-mode))

(use-package whaler
  :ensure t
  :config
  (setq whaler-directories-alist projects-path)
  (setq whaler-include-hidden-directories nil)
  (setq whaler-default-working-directory "~")
  (whaler-populate-projects-directories))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))
