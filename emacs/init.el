;; package manager. installed packages:-
;; starter-kit
;; starter-kit-lisp
;; solarized-theme
;; rainbow-mode
;; nrepl
;; auto-complete
;; ac-nrepl
;; clojure-mode
(require 'package)
(setq package-archives
      '(("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;;common-lisp
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(add-to-list 'load-path "~/Programs/slime")
(require 'slime)
(slime-setup)
(slime-setup '(slime-fancy))

;;solarized
(require 'solarized-dark-theme)

;;paredit
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'nrepl-mode-hook 'paredit-mode)
(add-hook 'slime-repl-mode-hook 'paredit-mode)
(global-set-key [f7] 'paredit-mode)

;; nrepl
(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(setq nrepl-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "*nrepl*")
(add-hook 'nrepl-mode-hook 'paredit-mode)
(global-set-key [f9] 'nrepl-jack-in)

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)
(define-key ac-completing-map "\M-/" 'ac-stop)

;;ac-nrepl
(require 'ac-nrepl)
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete" '(add-to-list 'ac-modes 'nrepl-mode))

;; line numbers enabled
(global-linum-mode 1)
(global-rainbow-delimiters-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(menu-bar-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "outline" :slant normal :weight normal :height 125 :width normal)))))
