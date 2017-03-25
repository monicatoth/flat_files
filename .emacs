; EMACS CONFIGURATION

(require 'package)
(add-to-list 'package-archives
        '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq truncate-partial-width-windows nil)  ; eliminates line truncation in split windows
(setq comint-prompt-read-only t)           ; sets shell prompt to be read-only
(setq comint-process-echoes t)             ; eliminates echoed commands in python
(setq comint-scroll-to-bottom-on-output t) ; output auto scrolls to bottom
(setq inhibit-splash-screen t)             ; prevents splash screen from appearing
(setq ring-bell-function 'ignore)          ; disables the alarm bell
(set-cursor-color "blue")                  ; set cursor and mouse-pointer colors
(global-visual-line-mode 1)                ; wraps lines

; line and column numbers
(global-linum-mode t)                      ; set line numbers on left hand side
(setq linum-format "%d  ")                 ; add two spaces after the line number
(set-face-foreground 'linum "burlywood3")  ; set line number to a subtle color
(setq column-number-mode t)                ; display column number in mode line

; scrolling
(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

; add to shell path:
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell 
      (replace-regexp-in-string "[[:space:]\n]*$" "" 
        (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

; mouse integration
(require 'mouse) ; needed for iterm2 compatibility
(xterm-mouse-mode t)
(global-set-key [mouse-4] '(lambda ()
			     (interactive)
			     (scroll-down 1)))
(global-set-key [mouse-5] '(lambda ()
			     (interactive)
			     (scroll-up 1)))
(setq mouse-sel-mode 5)
(defun track-mouse (e))

;; ========= Split screens =========
(global-set-key (kbd "M-3") 'delete-other-windows) ; expand current pane
(global-set-key (kbd "M-4") 'split-window-vertically) ; split pane top/bottom
(global-set-key (kbd "M-2") 'delete-window) ; close current pane
(global-set-key (kbd "M-s") 'other-window) ; cursor to other pane

;; ========== Lisp environment =====
(setq inferior-lisp-program "sbcl")
(load (expand-file-name "~/quicklisp/slime-helper.el"))
