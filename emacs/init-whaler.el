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
    "zf" 'custom/whaler-find-files
    "ss" 'custom/whaler-rg
    "pp" 'whaler
    "su" (lambda () (interactive)(whaler :change-cwd-auto nil))
    "fo" (lambda () (interactive)(whaler :change-cwd-auto nil :action 'custom/whaler-counsel-find-files))
    "so" (lambda () (interactive)(whaler :change-cwd-auto nil :action 'custom/whaler-counsel-search-strings ))
    "pv" 'custom/whaler-dired-root
    "po" (lambda () (interactive)(whaler :change-cwd-auto nil :action 'dired :action-arg t))
    "cc" 'custom/whaler-compile
    "co" 'custom/whaler-compile-other
    "wr" 'whaler-populate-projects-directories
    )
  )

;; Custom functions to extend whaler
(cl-defun custom/whaler-prompt (&optional (post " >> ") (dir default-directory))
  "Whaler prompt. A custom prompt for each function."
  (concat "[" (f-filename dir) "]" post))

(defun custom/whaler-find-files ()
  "Custom find files function for `whaler.el' in the cwd."
  (interactive)
  (whaler-execute-function-on-current-working-directory
   (lambda (dir)(interactive)
     (counsel-fzf
      ""
      dir
      (custom/whaler-prompt " -- Find files >> " dir)))))

(defun custom/whaler-rg()
  "Execute `counsel-rg' function for `whaler.el' in the cwd."
  (interactive)
  (whaler-execute-function-on-current-working-directory
   (lambda (dir)(interactive)
     (counsel-rg
      ""
      dir 
      nil
      (custom/whaler-prompt " -- Search String >> "))) 
   t))

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

(defun custom/whaler-counsel-find-files (dir)
  "Wrapper for finding files in another directory"
  (interactive)
  (counsel-fzf
   ""
   dir
   (custom/whaler-prompt " -- Find files >> " dir)))

(defun custom/whaler-counsel-search-strings (dir)
  "Wrapper for searching strings in another directory"
  (interactive)
  (counsel-rg
   ""
   dir
   nil
   (custom/whaler-prompt " -- Search String >> " dir)))

(defun custom/whaler-compile-other ()
  "Wrapper for executing `compile' in another directory."
  (interactive)
  (let (
	(compilation-command
	 (read-string (custom/whaler-prompt " -- Compile commmand >> "))))
    (compile compilation-command)))

