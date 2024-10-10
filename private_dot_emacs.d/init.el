(when (version< emacs-version "27")
  (load (concat user-emacs-directory "early-init.el")))

(prefer-coding-system 'utf-8)

(setq custom-file (concat user-emacs-directory "customizations.el"))
(load custom-file 't)

(setq ring-bell-function 'ignore)

(setq load-prefer-newer t)

(setq read-process-output-max (* 1024 1024))

(with-eval-after-load 'package
  (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
  (add-to-list 'package-archives '("melpa"  . "https://melpa.org/packages/")))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)


