;;; early-init.el --- Early initialization -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


;; settings for better startup performance
(setq orig-initial-gc-threshold gc-cons-threshold)
(setq gc-cons-threshold 10000000)


;; silence startup message

;; Disable GUI
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;;; early-init.el ends here
