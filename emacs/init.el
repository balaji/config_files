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
  :config
  (setq inhibit-startup-screen 1)
  (savehist-mode t)
  (if (memq window-system '(w32 x ns pc mac))
      (menu-bar-mode 1))
  (cua-mode t)
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
        )
    (if (eq system-type 'gnu/linux)
      ;;; linux
        (progn
	  (setq erlang-installed-path "/usr/local/lib/erlang")
	  (setq rebar3-installed-path "~/.cache/rebar3/bin/rebar3")
	  (setq projects-path '("~/projects"))
	  )
    ;;; windows
      (progn
        (setq erlang-installed-path "c:/users/balaj/scoop/apps/erlang/current")
        (setq rebar3-installed-path "c:/users/balaj/bin/rebar3.cmd")
        (setq lsp-erlang-ls-server-path "c:/users/balaj/bin/erlang_ls.cmd")
        (setq projects-path '("~/projects"))
        )))

  (custom-set-faces
   '(default ((t (:family "Cascadia Code" :foundry "SAJA" :slant normal :weight regular :height 102 :width normal))))))


(mapc 'load (file-expand-wildcards (concat (car projects-path) "/config_files/emacs/load/" "*.el")))
