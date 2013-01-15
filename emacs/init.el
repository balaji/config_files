;; package manager. installed packages:-
;; starter-kit
;; starter-kit-lisp
;; solarized-theme
;; fsharp-mode
(require 'package)
(setq package-archives
      '(("melpa" . "http://melpa.milkbox.net/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;;slime and clisp
(setq inferior-lisp-program "~/clisp-2.49/clisp.exe")
(add-to-list 'load-path "~/slime")
(require 'slime)
(slime-setup)
(slime-setup '(slime-fancy))

;;solarized 
(require 'solarized-dark-theme)

;; line numbers enabled
(global-linum-mode 1)

(setq inferior-fsharp-program "\"C:\\Program Files (x86)\\Microsoft SDKs\\F#\\3.0\\Framework\\v4.0\\Fsi.exe\"")
(setq fsharp-compiler "\"C:\\Program Files (x86)\\Microsoft SDKs\\F#\\3.0\\Framework\\v4.0\\Fsc.exe\"")

;; font to consolas
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 98 :width normal)))))
