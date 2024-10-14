;;; early-init.el --- Early initialization -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


;; settings for better startup performance
(setq orig-initial-gc-threshold gc-cons-threshold)
(setq gc-cons-threshold 10000000)
(setq byte-compile-warnings '(not obsolete))
(setq warning-suppress-log-types '((comp) (bytecomp)))
(setq native-comp-async-report-warnings-errors 'silent)

;; silence startup message
(setq inhibit-startup-echo-area-message (user-login-name))


;; Disable GUI
(tool-bar-mode -1)

;;; early-init.el ends here
