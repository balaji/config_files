(use-package tab-line
             :hook (after-init . global-tab-line-mode)
             :bind
             ("C-<tab>" . tab-line-switch-to-next-tab)
             ("C-S-<tab>" . tab-line-switch-to-prev-tab)
             :config
             (setq my/current-tab-list (list (scratch-buffer)))
             (defun my/tab-line-buffers () my/current-tab-list)
             (defun my/add-current-buffer-to-tab ()
               (interactive)
               (setq my/current-tab-list (add-to-list 'my/current-tab-list (current-buffer))))
             (defcustom tab-line-tab-min-width 10
                        "Minimum width of a tab in characters."
                        :type 'integer
                        :group 'tab-line)

             (defcustom tab-line-tab-max-width 30
                        "Maximum width of a tab in characters."
                        :type 'integer
                        :group 'tab-line)

             (defun aorst/tab-line-name-buffer (buffer &rest _buffers)
               "Create name for tab with padding and truncation. If buffer name is shorter than
               `tab-line-tab-max-width' it gets centered with spaces, otherwise it is truncated,
               to preserve equal width for all tabs.  This function also tries to fit as many tabs
               in window as possible, so if there are no room for tabs with maximum width, it
               calculates new width for each tab and truncates text if needed.  Minimal width
               can be set with `tab-line-tab-min-width' variable."
               (with-current-buffer buffer
                                    (let* ((window-width (window-width (get-buffer-window)))
                                           (tab-amount (length (tab-line-tabs-window-buffers)))
                                           (window-max-tab-width (if (>= (* (+ tab-line-tab-max-width 3) tab-amount) window-width)
                                                                     (/ window-width tab-amount)
                                                                     tab-line-tab-max-width))
                                           (tab-width (- (cond ((> window-max-tab-width tab-line-tab-max-width) tab-line-tab-max-width)
                                                               ((< window-max-tab-width tab-line-tab-min-width) tab-line-tab-min-width)
                                                               (t window-max-tab-width))
                                                         3)) ;; compensation for ' x ' button
                                           (buffer-name (string-trim (buffer-name)))
                                           (name-width (length buffer-name)))
                                      (if (>= name-width tab-width)
                                          (concat " " (truncate-string-to-width buffer-name (- tab-width 2)) "…")
                                          (let* ((padding (make-string (+ (/ (- tab-width name-width) 2) 1) ?\s))
                                                 (buffer-name (concat padding buffer-name)))
                                            (concat buffer-name (make-string (- tab-width (length buffer-name)) ?\s)))))))

             (setq tab-line-close-button-show t
               tab-line-new-button-show nil
	       tab-line-switch-cycling t
               tab-line-separator ""
               tab-line-close-tab-function #'kill-buffer
               tab-line-tabs-function #'tab-line-tabs-mode-buffers
               tab-line-tab-name-function #'aorst/tab-line-name-buffer
               tab-line-right-button (propertize (if (char-displayable-p ?▶) " ▶ " " > ")
                                                 'keymap tab-line-right-map
                                                 'mouse-face 'tab-line-highlight
                                                 'help-echo "Click to scroll right")
               tab-line-left-button (propertize (if (char-displayable-p ?◀) " ◀ " " < ")
                                                'keymap tab-line-left-map
                                                'mouse-face 'tab-line-highlight
                                                'help-echo "Click to scroll left")
               tab-line-close-button (propertize (if (char-displayable-p ?×) " × " " x ")
                                                 'keymap tab-line-tab-close-map
                                                 'mouse-face 'tab-line-close-highlight
                                                 'help-echo "Click to close tab"))

             (let ((bg (if (facep 'solaire-default-face)
                           (face-attribute 'solaire-default-face :background)
                           (face-attribute 'default :background)))
                   (fg (face-attribute 'default :foreground))
                   (base (face-attribute 'mode-line :background))
                   (box-width (/ (line-pixel-height) 2)))
               (set-face-attribute 'tab-line nil :background base :foreground fg :height 0.85 :inherit nil :box (list :line-width -1 :color base))
               (set-face-attribute 'tab-line-tab nil :foreground fg :background bg :weight 'normal :inherit nil :box (list :line-width box-width :color bg))
               (set-face-attribute 'tab-line-tab-inactive nil :foreground fg :background base :weight 'normal :inherit nil :box (list :line-width box-width :color base))
               (set-face-attribute 'tab-line-tab-current nil :foreground fg :background bg :weight 'normal :inherit nil :box (list :line-width box-width :color bg)))

             (dolist (mode '(slime-repl-mode
                             dired-sidebar-mode))
               (add-to-list 'tab-line-exclude-modes mode)))
