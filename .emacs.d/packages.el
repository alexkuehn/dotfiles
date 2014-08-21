(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar required-packages
  '(powerline yasnippet)
  "Packages which should be installed")

(dolist (p required-packages)
  (when (not (package-installed-p p))
    (package-install p)))
