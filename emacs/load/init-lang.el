(setq load-path (cons  (concat erlang-installed-path "/lib/tools-4.1/emacs") load-path))
(setq erlang-root-dir erlang-installed-path)
(setq exec-path (cons (concat erlang-installed-path "/bin") exec-path))
(require 'erlang-start)

(use-package company
  :hook
  ((after-init) . 'global-company-mode))

(use-package flycheck
  :init
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  (setq flycheck-ruby-rubocop-executable "/Users/bala/stripe/pay-server/scripts/bin/rubocop.rb")
  (setq flycheck-ruby-executable "/Users/bala/.rbenv/shims/ruby")
  :config
  (global-flycheck-mode 1))

(use-package ruby-mode
  :config
  (defun my-ruby-mode-hook ()
    (set-fill-column 80)
    (add-hook 'before-save-hook 'delete-trailing-whitespace nil 'local)
    (setq ruby-insert-encoding-magic-comment nil))
  (add-hook 'ruby-mode-hook 'my-ruby-mode-hook))

(use-package which-key
  :config
  (which-key-mode)
  :hook
  ((erlang-mode) . 'which-key-mode)
  )
(use-package origami
  :hook
  ((erlang-mode) . 'origami-mode)
  :config
  (global-origami-mode 1))

(use-package corfu
  :init
  (global-corfu-mode))
(use-package cape)

(setq lsp-keymap-prefix "C-l")
(use-package lsp-mode
  :custom
  (lsp-completion-provider :none) ;; we use Corfu!
  :init
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
  :hook
  ((erlang-mode ruby-mode enh-ruby-mode) . 'lsp)
  (lsp-completion-mode . my/lsp-mode-setup-completion))

(use-package lsp-ui
  :config
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-position 'bottom))

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

(use-package lsp-origami
  :hook
  ((origami-mode) . 'lsp-origami-mode))

(use-package lsp-ivy)

(use-package company-lsp
  :after (company lsp))

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

(use-package elpy)

(use-package lsp-pyright
  :ensure t
  :custom (lsp-pyright-langserver-command "pyright") ;; or basedpyright
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp)))) 

(use-package smartparens
  :bind
  ("<f7>" . 'smartparens-mode)
  :config
  (smartparens-global-mode t))

(use-package rainbow-delimiters
  :hook
  ((prog-mode emacs-lisp-mode lisp-mode erlang-mode) . rainbow-delimiters-mode)
  :config
  (rainbow-delimiters-mode))

