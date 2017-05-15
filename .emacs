;; INSTALL PACKAGES
;; --------------------------------------


(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
         '("marmalade" .
           "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
         '("gnu" .
           "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives
         '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(setq package-selected-packages 
      '(better-defaults
        material-theme
        real-auto-save
        elpy
        company-go
        flycheck
        nginx-mode))

(package-install-selected-packages)

;; CONFIG
;; --------------------------------------

(cua-mode)

(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")


;; hide the startup message
(setq inhibit-startup-message t)

;; load material theme
(load-theme 'material t)

;; enable line numbers globally
(global-linum-mode t) 

;;nginx
(require 'nginx-mode)

;;mouse
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] (lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)

;; Tramp
(require 'tramp)
(setq tramp-default-method "scp")

;; GBD
(setq gdb-many-windows t)

;; Auto Save
(require 'real-auto-save)
(setq real-auto-save-interval 5) ;; in seconds
(add-hook 'text-mode-hook 'real-auto-save-mode)
(add-hook 'prog-mode-hook 'real-auto-save-mode)
      
;; Dont ask about following links to git repos
(setq vc-follow-symlinks nil)

;; Company mode
(add-hook 'after-init-hook 'global-company-mode)

;; Python
(elpy-enable)
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;use IPython
; (setq-default py-shell-name "ipython")
; (setq-default py-which-bufname "IPython")
; use the wx backend, for both mayavi and matplotlib
; (setq py-python-command-args
; '("--gui=wx" "--pylab=wx" "-colors" "Linux"))

;; CUSTOM KEYS
;; --------------------------------------
(global-set-key (kbd "C-o") 'find-file)

;; ORG MODE
;; --------------------------------------
(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key "\C-n" 'outline-next-visible-heading)
            (local-set-key "\C-p" 'outline-previous-visible-heading)
            (local-set-key "\C-l" 'org-demote-subtree)
            (local-set-key "\C-h" 'org-promote-subtree)
            (local-set-key "\C-k" 'org-move-subtree-up)
            (local-set-key (kbd "C-j") 'org-move-subtree-down)
            (local-set-key (kbd "C-S-T") 'org-insert-todo-heading)
            (local-set-key (kbd "C-t") 'org-todo)
            (local-set-key (kbd "C-g") 'org-global-cycle)
            (local-set-key (kbd "C-i") 'org-insert-heading-respect-content)
            (local-set-key (kbd "C-p") 'org-insert-link)
            (local-set-key (kbd "TAB") 'org-cycle)
            )
          )

(global-set-key (kbd "C-S-P") 'org-store-link)
(global-set-key (kbd "C-S-N") 'org-capture)
(global-set-key (kbd "C-0") 'org-agenda)
(global-set-key (kbd "C-9") 'org-show-todo-tree)
(global-set-key (kbd "C-8") 'org-time-stamp)
(setq org-html-checkbox-type 'html)

;; HANDY FUNCTIONS
;; --------------------------------------

;; Comment out a line
(global-set-key (kbd "C-/")
                (lambda ()
                  (interactive)
                  (let ((start (line-beginning-position))
                        (end (line-end-position)))
                    (when (region-active-p)
                      (setq start (save-excursion
                                    (goto-char (region-beginning))
                                    (beginning-of-line)
                                    (point))
                            end (save-excursion
                                  (goto-char (region-end))
                                  (end-of-line)
                                  (point))))
                    (comment-or-uncomment-region start end))))


;; Delete a line (aka most powerful tool)
(global-set-key (kbd "C-d") 'kill-whole-line)
