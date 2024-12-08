(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(setq straight-use-package-by-default t)
(straight-use-package 'use-package)

(use-package better-defaults)

(use-package emacs
  :custom
  ;; TAB cycle if there are only few candidates
  ;; (completion-cycle-threshold 3)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (tab-always-indent 'complete)

  ;; Emacs 30 and newer: Disable Ispell completion function.
  ;; Try `cape-dict' as an alternative.
  (text-mode-ispell-word-completion nil)

  ;; Hide commands in M-x which do not apply to the current mode.  Corfu
  ;; commands are hidden, since they are not used via M-x. This setting is
  ;; useful beyond Corfu.
  (read-extended-command-predicate #'command-completion-default-include-p)

  :config
  (setq inhibit-startup-screen 1)
  (savehist-mode t)
  (cua-mode t)
  (recentf-mode t)
  (if (version< emacs-version "29")
      (global-linum-mode 1)
    (global-display-line-numbers-mode t))

  (setq auto-save-file-name-transforms
        `((".*" ,(concat user-emacs-directory "auto-save/") t)))

  (if (eq system-type 'darwin)
    ;;; mac osx
      (progn
        (setq erlang-installed-path "/opt/homebrew/lib/erlang")
        (setq rebar3-installed-path "~/.cache/rebar3/bin/rebar3")
        (setq projects-path '("~/projects" "~/stripe"))
        (use-package vterm)
        )
    (if (eq system-type 'gnu/linux)
      ;;; linux
        (progn
	  (setq erlang-installed-path "/usr/local/lib/erlang")
	  (setq rebar3-installed-path "~/.cache/rebar3/bin/rebar3")
	  (setq projects-path '("~/projects"))
          (use-package vterm)
	  )
    ;;; windows
      (progn
        (setq erlang-installed-path "c:/users/balaj/scoop/apps/erlang/current")
        (setq rebar3-installed-path "c:/users/balaj/bin/rebar3.cmd")
        (setq lsp-erlang-ls-server-path "c:/users/balaj/bin/erlang_ls.cmd")
        (setq projects-path '("~/projects"))
        )))
  (custom-set-faces
   '(default ((t (:family "Cascadia Code" :foundry "SAJA" :slant normal :weight regular :height 115 :width normal))))))


(mapc 'load (file-expand-wildcards "~/projects/config_files/emacs/load/*.el"))
