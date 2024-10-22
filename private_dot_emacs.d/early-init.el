;;; early-init.el --- Early initialization -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


;; settings for better startup performance
;; maximize GC threshold to prevent GC activites during start phase
(setq orig-initial-gc-threshold gc-cons-threshold)
(setq gc-cons-threshold 10000000)

;; enhance subprocess readout buffer
(setq read-process-output-max (* 1024 1024))


;; Disable toolbar if we have graphic display
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;;; early-init.el ends here
