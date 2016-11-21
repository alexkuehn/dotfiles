
;; main entry for emacs configuration

;; environment detection helpers
(setq on-windows (eq 'windows-nt system-type))
(setq on-mac (eq 'darwin system-type))
(setq on-cygwin (eq 'cygwin system-type))

;; enable backtrace on error
;; (setq debug-on-error t)

;; shorten yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; prevent startup screen
(setq inhibit-startup-message t)

;; Highlight Line
(global-hl-line-mode 1)
;(set-face-background 'hl-line "black")

;; show line numbers
(global-linum-mode 1)
;; show cursor coords
(setq line-number-mode t)
(setq column-number-mode t)

;; hide tool bar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode 0))
(when (fboundp 'toggle-scroll-bar)
  (toggle-scroll-bar -1))

;; show the end of the buffer
(set-default 'indicate-empty-lines t)

;; backup directory
(setq make-backup-files nil)
(setq auto-save-default nil)

;; outsource custom file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; buffer config
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; line wrapping
(set-default 'fill-column 128)

;; TAB behaviour config
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; show parens
(show-paren-mode 1)

;; fonts
(if on-mac (set-frame-font "Menlo 12"))
;; mac key mapping
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; Mac Keyboard
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; IDO mode
(ido-mode 1)

;; org mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;;(setq debug-on-error t)

;; proxy settings
(if on-windows
(setq url-proxy-services '(("http" . "localhost:3128" )
			   )) )
(if on-cygwin
(setq url-proxy-services '(("http" . "localhost:10000" )
			   )) )


;; package manager
(add-to-list 'load-path "~/.emacs.d/lisp")
(load "packages")

;; load colorscheme and set colors
(require 'monokai-theme)
(load-theme 'monokai)
(set-cursor-color "orange")

;; powerline
(require 'powerline)
(powerline-default-theme)

;;AuCTex
(require 'tex)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;; YASnippet
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"           ;; default collection
        "~/.emacs.d/mysnippets"         ;; my snippets
        ))
(yas-global-mode 1)

;; Beacon mode
(require 'beacon)
(beacon-mode 1)

;; smex
(require 'smex)
(smex-initialize)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; w3m
(require 'w3m)

;; SuperCollider
(add-to-list 'load-path "~/.emacs.d/scel")
(require 'sclang)
(setq sclang-program "/Applications/SuperCollider.app/Contents/MacOS/sclang")
(setq sclang-osx-app-path "/Applications/SuperCollider.app")
(add-hook 'sclang-mode-hook 'sclang-extensions-mode)
