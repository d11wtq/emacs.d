;;; Emacs User Configuration File

;; elpa package management
(require 'package)

;; melpa (github-based) source
(add-to-list 'package-archives
  '("melpa" .
      "http://melpa.milkbox.net/packages/"))

;; marmalade source
(add-to-list 'package-archives
  '("marmalade" .
      "http://marmalade-repo.org/packages/"))

;; start the elpa system
(package-initialize)

;; Specify a dependency (auto-install)
(defun dep (depname)
  (unless (require depname nil t)
    (package-install depname)))

;; -- Dependencies

;; color-theme support
(dep 'color-theme)

;; molokai color theme
(dep 'molokai-theme)

;; erlang major mode
(dep 'erlang)

;; resursively find files in directories
(dep 'find-file-in-project)

;; ido mode stuff (auto-complete)
(dep 'ido-ubiquitous)

;; markdown syntax highlighting etc
(dep 'markdown-mode)

;; turn on ido mode everywhere
(ido-mode)

;; fuck #auto-save# files
(setq auto-save-default nil)

;; fuck backup~ files
(setq make-backup-files nil)

;; bind ctrl-p to the file finder
(global-set-key "\C-p" 'find-file-in-project)

;; use soft tabs by default
(setq-default indent-tabs-mode nil)

;; 2 spaces for soft tab stops
(setq tab-stop-list (number-sequence 2 200 2))

;; 4 spaces for actual tab sizing
(setq-default tab-width 4)

;; show matching braces
(show-paren-mode t)

;; .md files should use markdown-mode
(add-to-list 'auto-mode-alist
  '("\\.md\\'" . markdown-mode))