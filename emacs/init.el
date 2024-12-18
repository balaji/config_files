(defvar elpaca-installer-version 0.8)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))
(elpaca elpaca-use-package
  ;; Enable use-package :ensure support for Elpaca.
  (elpaca-use-package-mode))

(if (eq system-type 'darwin)
    ;;; mac osx
    (progn
      (setq projects-path '("~/projects" "~/stripe"))
      )
  (if (eq system-type 'gnu/linux)
      ;;; linux
      (progn
	(setq projects-path '("~/projects"))
	)
    ;;; windows
    (progn
      (setq lsp-erlang-ls-server-path "c:/users/balaj/bin/erlang_ls.cmd")
      (setq projects-path '("~/projects"))
      )))
(use-package better-defaults :ensure t)

(add-to-list 'load-path "~/projects/config_files/emacs/modules/")
(require 'vim-tab-bar)
(use-package emacs
  :custom
  (enable-recursive-minibuffers t)
  (read-extended-command-predicate #'command-completion-default-include-p)
  (tab-always-indent 'complete)
  (text-mode-ispell-word-completion nil)

  :init
  (setq inhibit-startup-screen 1)
  (setq vc-follow-symlinks t)
  (cua-mode t)
  (recentf-mode t)
  (global-display-line-numbers-mode t)
  (add-to-list 'default-frame-alist '(fullscreen . maximized))
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  (defun my/on-window-display ()
    (if (display-graphic-p)
        (progn
          (set-frame-font "Cascadia Mono 11" nil t)
          (vim-tab-bar-mode 1)
          )
      (progn
        (vim-tab-bar-mode 0)
	)))

  (add-hook 'after-make-frame-functions
            (lambda (frame)
              (select-frame frame)
              (my/on-window-display)))
  (add-hook 'after-init-hook #'my/on-window-display))

(mapc 'load (file-expand-wildcards "~/projects/config_files/emacs/load/*.el"))
