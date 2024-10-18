;; on older emacs versions, early-init is not used
;; then load it manually

(when (version< emacs-version "27")
  (load (concat user-emacs-directory "early-init.el")))


;; switch off splash screen
(setq inhibit-splash-screen t)
(prefer-coding-system 'utf-8)

(setq initial-major-mode 'fundamental-mode)  ; default mode for the *scratch* buffer


;; Fix archaic defaults
(setq sentence-end-double-space nil)


;; Don't litter file system with *~ backup files; put them all inside
;; ~/.emacs.d/backup or wherever
(defun config--backup-file-name (fpath)
  "Return a new file path of a given file path.
If the new path's directories does not exist, create them."
  (let* ((backupRootDir (concat user-emacs-directory "emacs-backup/"))
         (filePath (replace-regexp-in-string "[A-Za-z]:" "" fpath )) ; remove Windows driver letter in path
         (backupFilePath (replace-regexp-in-string "//" "/" (concat backupRootDir filePath "~") )))
    (make-directory (file-name-directory backupFilePath) (file-name-directory backupFilePath))
    backupFilePath))
(setq make-backup-file-name-function 'config--backup-file-name)


;; add package repositories and initialize packaging system
(with-eval-after-load 'package
  (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
  (add-to-list 'package-archives '("melpa"  . "https://melpa.org/packages/")))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)


(setq line-number-mode t)                        ; Show current line in modeline
(setq column-number-mode t)                      ; Show column as well

(setq x-underline-at-descent-line nil)           ; Prettier underlines


(setq show-trailing-whitespace nil)      ; By default, don't underline trailing spaces
(setq indicate-buffer-boundaries 'left)  ; Show buffer top and bottom in the margin

;; Enable horizontal scrolling
(setq mouse-wheel-tilt-scroll t)
(setq mouse-wheel-flip-direction t)



; TAB config
(setq indent-tabs-mode nil)
(setq tab-width 4)

(setq ring-bell-function 'ignore)


;; Display line numbers in programming mode
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq display-line-numbers-width 3)           ; Set a minimum width
;; Nice line wrapping when working with text
(add-hook 'text-mode-hook 'visual-line-mode)

;; Modes to highlight the current line with
;;(let ((hl-line-hooks '(text-mode-hook prog-mode-hook)))
;;  (mapc (lambda (hook) (add-hook hook 'hl-line-mode)) hl-line-hooks))

;; respect customize files
(setq custom-file (concat user-emacs-directory "customizations.el"))
(load custom-file 't)

;; reconfigure GC threshold after init
(setq gc-cons-threshold (or orig-initial-gc-threshold 800000))

