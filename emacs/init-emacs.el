(use-package emacs
  :config
  (tool-bar-mode 0)
  (cua-mode t)
  (if (version< emacs-version "29")
      (global-linum-mode 1)
    (global-display-line-numbers-mode t))
  (setq inhibit-startup-screen 1)
  (scroll-bar-mode 0)
  (setq visible-bell 1)
  (setq auto-save-file-name-transforms
	`((".*" ,(concat user-emacs-directory "auto-save/") t)))
  (setq backup-directory-alist `(("." . "~/.saves"))
	delete-old-versions t
	version-control t
	vc-follow-symlinks t)

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

  (use-package evil-terminal-cursor-changer)
  (if (display-graphic-p)
      (progn (menu-bar-mode 1)
	     (evil-terminal-cursor-changer-deactivate))
    (progn (menu-bar-mode 0)
	   (evil-terminal-cursor-changer-activate)))
  (custom-set-faces
   '(default ((t (:family "Cascadia Code" :foundry "SAJA" :slant normal :weight regular :height 102 :width normal)))))
  )
