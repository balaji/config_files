(use-package better-defaults)
(use-package emacs
  :config
  (cua-mode t)
  (if (version< emacs-version "29")
      (global-linum-mode 1)
    (global-display-line-numbers-mode t))
  (setq inhibit-startup-screen 1)

  (setq auto-save-file-name-transforms
	`((".*" ,(concat user-emacs-directory "auto-save/") t)))

  (if (eq system-type 'darwin)
    ;;; mac osx
      (progn
	(setq erlang-installed-path "/opt/homebrew/lib/erlang")
	(setq projects-path '("~/stripe" "~/Documents/GitHub"))
	)
    (if (eq system-type 'gnu/linux)
      ;;; linux
	(progn
	  (setq erlang-installed-path "/usr/local/lib/erlang")
	  (setq projects-path '("~/projects/"))
	  )
    ;;; windows
      (progn
	)))

  (custom-set-faces
   '(default ((t (:family "Cascadia Code" :foundry "SAJA" :slant normal :weight regular :height 102 :width normal))))))
