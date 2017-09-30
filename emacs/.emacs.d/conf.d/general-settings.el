;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(delete-selection-mode 1) ; Replace highlighted text on typing
(setq x-select-enable-clipboard t) ;Integrate with OS clipboard

(setq auto-save-default nil) ; stop creating #autosave# files
(setq create-lockfiles nil) ;; No need for ~ files when editing
(setq make-backup-files nil) ; stop creating backup~ filess

(global-auto-revert-mode) ; Auto update file in buffer if updated on disk

(setq-default tab-width 2
      indent-tabs-mode nil)

(defalias 'yes-or-no-p 'y-or-n-p) ; Save typing yes / no and use short y/n aliases


(setq inhibit-startup-screen t) ;;don't show the welcome to emacs screen
(setq initial-scratch-message "") ;;Start with a empty scratch

;; IDO Interactivley DO Things
(setq ido-enable-flex-matching t
      ido-everywhere t
      ido-create-new-buffer 'always
      ido-file-extensions-order '(".scala" "scala.html" ".less" ".js" ".css"))
(ido-mode 1)

;; Keybindings
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

;; Bind CMD-RET to full screen matching default osx functionality
(if(memq window-system '(mac ns))
    (global-set-key (kbd "C-S-f") 'toggle-frame-fullscreen))

;;Fix the annoying home key taking you to start of file / end -> end of file
(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)


;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; make sure files have an empty blank line at the end for git
(add-hook 'prog-mode-hook (lambda () (interactive) (setq mode-require-final-newline t)))

;; Prevents printing a message for every word in the buffer slowing it down.
(setq flyspell-issue-message-flag nil)

;; Use aspell by setting --list
(setq ispell-program-name "aspell")
(setq ispell-list-command "--list")
(setq ispell-extra-args '("--sug-mode=ultra" "--lang=en"))
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'text-mode-hook 'flyspell-mode)

(setq custom-file "~/.emacs.d/emacs-customizations.el")
(load custom-file 'noerror)

;; reduce the frequency of garbage collection by making it happen on
;; each 100MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 100000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; disable the annoying bell ring
(setq ring-bell-function 'ignore)

;; fix microsoft ergotouch keyboard mapping to match macbook
(when (eq system-type 'darwin)
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'control))



