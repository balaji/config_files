(add-to-list 'load-path "/Users/balaji/Projects/slime")
(add-to-list 'load-path "~/.emacs.d/vendor/powerline")
(require 'slime)
(setq inferior-lisp-program "/usr/local/bin/ccl")
(slime-setup)
(slime-setup '(slime-fancy))

(require 'powerline)
(powerline-center-evil-theme)
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(require 'color-theme)
(color-theme-monokai)
(evil-mode)
(global-company-mode)
(global-linum-mode)
(setq linum-format "%d ")

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'slime-repl-mode-hook 'paredit-mode)
(add-hook 'cider-mode-hook 'paredit-mode)
(global-set-key [f7] 'paredit-mode)
(global-set-key [f6] 'evil-mode)

(add-hook 'cider-interaction-mode-hook 'cider-turn-on-eldoc-mode)
(setq cider-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "*cider*")
(global-set-key [f9] 'cider-jack-in)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain one such instance.
 ;; If there is more than one, they won't work right.
 )
(set-default-font "Source Code Pro-14")
