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
  (enable-recursive-minibuffers t)
  (read-extended-command-predicate #'command-completion-default-include-p)

  :init
  (setq inhibit-startup-screen 1)
  (setq vc-follow-symlinks t)
  (cua-mode t)
  (recentf-mode t)

  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  (if (version< emacs-version "29")
      (global-linum-mode 1)
    (global-display-line-numbers-mode t))

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
  (defun my/on-window-display ()
    (if (display-graphic-p)
        (progn (set-frame-font "Cascadia Mono 11" nil t)
               (menu-bar-mode 1))
      (progn
        (menu-bar-mode 0))))

  (add-hook 'after-make-frame-functions
            (lambda (frame)
              (select-frame frame)
              (my/on-window-display)))
  (add-hook 'after-init-hook #'my/on-window-display)
  )


(straight-use-package
 '(eat :type git
       :host codeberg
       :repo "akib/emacs-eat"
       :files ("*.el" ("term" "term/*.el") "*.texi"
               "*.ti" ("terminfo/e" "terminfo/e/*")
               ("terminfo/65" "terminfo/65/*")
               ("integration" "integration/*")
               (:exclude ".dir-locals.el" "*-tests.el"))))

(mapc 'load (file-expand-wildcards "~/projects/config_files/emacs/load/*.el"))
