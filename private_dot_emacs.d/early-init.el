;;; early-init.el --- Early initialization -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

;; Disable GUI
(tool-bar-mode -1)
(setq use-dialog-box t)
(setq use-file-dialog nil)
(setq-default frame-title-format '("%b  -  GNU Emacs"))
;; Hide the startup screen
(setq inhibit-startup-screen t)
;; Increase font size
;; (set-face-attribute 'default nil :height 130)

;;; early-init.el ends here
