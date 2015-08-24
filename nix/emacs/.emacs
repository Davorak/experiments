
(setq-default line-number-mode t) ;; display line number in infobar
(setq-default column-number-mode t) ;; display col number in infobar

;; (turn-on-font-lock)


;; disable toolbar
(tool-bar-mode -1)

;; disable scrollbar
(scroll-bar-mode -1)


(show-paren-mode 1)
(setq show-paren-delay 0)

;; Never have to type 'yes' or 'no' fully
(defalias 'yes-or-no-p 'y-or-n-p)

;; (setq-default ispell-program-name "aspell")
;; (setq ispell-dictionary "/nix/store/ar7m3ghvb9ccvpyg5yy97ng51993cn4y-aspell-dict-en-7.1-0/lib/aspell/en_US.multi")

(autoload 'markdown-mode "markdown-mode"
             "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(require 'evil)  
(evil-mode 1)

;; jsx mode                                                                      
;; (add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))                         
;; (autoload 'jsx-mode "jsx-mode" "JSX mode" t) 
;; (custom-set-variables
;;    '(jsx-indent-level 2)
;;    '(jsx-use-flymake t)
;;    )

;; jsx web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
    (let ((web-mode-enable-part-face nil))
      ad-do-it)
    ad-do-it))

(desktop-save-mode 1)

;; http://stackoverflow.com/questions/24921390/how-to-get-emacs-to-automatically-load-and-save-desktop-from-initial-directory
;; http://stackoverflow.com/a/24924904
(setq your-own-path default-directory)
(if (file-exists-p
     (concat your-own-path ".emacs.desktop"))
    (if (y-or-n-p "Read .emacs.desktop and add hook?")
    (progn
      (desktop-read your-own-path)
      (add-hook 'kill-emacs-hook
            `(lambda ()
               (desktop-save ,your-own-path t))))))


;; (setq default-major-mode 'text-mode)


(require 'nix-mode)  

;; (global-set-key (kbd "C-c c") 'comment-region)
;; (global-set-key (kbd "C-c i") 'evil-indent)

;; (setq js2-highlight-level 2)

(require 'git-timemachine)

(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
;; (helm-mode 1)

;;(require 'projectile)
;;(projectile-global-mode)
;;(setq projectile-completion-system 'helm)
;;(helm-projectile-on)
;; (helm-projectile-on)
;; (require 'helm-projectile)
;; (projectile-global-mode)
;; (setq projectile-enable-caching t)

(require 'projectile)
(require 'helm-projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-switch-project-action 'projectile-dired)
(setq projectile-remember-window-configs t )
(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action 'helm-projectile)
(helm-projectile-on)



;; (require 'haskell-mode-autoloads)

;;(define-key haskell-mode-map (kbd "M-[") 'haskell-mode-tag-find)

;; (add-hook 'haskell-mode-hook 'interactive-haskell-mode)


;; (require 'shm)
;; (add-hook 'haskell-mode-hook 'structured-haskell-mode)
;; (add-hook 'haskell-mode-hook nil)

;; (global-set-key (kbd "C-x C-\;") 'comment-region)
;; (global-set-key ((control ?x) (control ?\;) 'comment-region)


;; disable menu bar ;; did not work positioned near top of file.
;;(menu-bar-mode -1)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(require 'idris-mode)

(setq-default line-number-mode t) ;; display line number in infobar
(setq-default column-number-mode t) ;; display col number in infobar

;; (turn-on-font-lock)


;; disable toolbar
(tool-bar-mode -1)

;; disable scrollbar
(scroll-bar-mode -1)


(show-paren-mode 1)
(setq show-paren-delay 0)

;; Never have to type 'yes' or 'no' fully
(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default ispell-program-name "aspell")

(autoload 'markdown-mode "markdown-mode"
             "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(require 'evil)  
(evil-mode 1)

;; jsx mode                                                                      
;; (add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))                         
;; (autoload 'jsx-mode "jsx-mode" "JSX mode" t) 
;; (custom-set-variables
;;    '(jsx-indent-level 2)
;;    '(jsx-use-flymake t)
;;    )

;; jsx web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
    (let ((web-mode-enable-part-face nil))
      ad-do-it)
    ad-do-it))

(desktop-save-mode 1)

;; http://stackoverflow.com/questions/24921390/how-to-get-emacs-to-automatically-load-and-save-desktop-from-initial-directory
;; http://stackoverflow.com/a/24924904
(setq your-own-path default-directory)
(if (file-exists-p
     (concat your-own-path ".emacs.desktop"))
    (if (y-or-n-p "Read .emacs.desktop and add hook?")
    (progn
      (desktop-read your-own-path)
      (add-hook 'kill-emacs-hook
            `(lambda ()
               (desktop-save ,your-own-path t))))))


;; (setq default-major-mode 'text-mode)


(require 'nix-mode)  

;; (global-set-key (kbd "C-c c") 'comment-region)
;; (global-set-key (kbd "C-c i") 'evil-indent)

;; (setq js2-highlight-level 2)

(require 'git-timemachine)

(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
;; (helm-mode 1)

;;(require 'projectile)
;;(projectile-global-mode)
;;(setq projectile-completion-system 'helm)
;;(helm-projectile-on)
;; (helm-projectile-on)
;; (require 'helm-projectile)
;; (projectile-global-mode)
;; (setq projectile-enable-caching t)

(require 'projectile)
(require 'helm-projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-switch-project-action 'projectile-dired)
(setq projectile-remember-window-configs t )
(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action 'helm-projectile)
(helm-projectile-on)




;;(define-key haskell-mode-map (kbd "M-[") 'haskell-mode-tag-find)

;; (add-hook 'haskell-mode-hook 'interactive-haskell-mode)


;; (require 'shm)
;; (add-hook 'haskell-mode-hook 'structured-haskell-mode)
;; (add-hook 'haskell-mode-hook nil)

;; (global-set-key (kbd "C-x C-\;") 'comment-region)
;; (global-set-key ((control ?x) (control ?\;) 'comment-region)


;; disable menu bar ;; did not work positioned near top of file.
;;(menu-bar-mode -1)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-src-fontify-natively t)
(setq org-src-preserve-indentation t)

;; global org todo
(setq org-agenda-files
      (list "~/org/todos/misc.org"
	    "~/org/todos/nix.org"
	    "~/org/todos/nixops.org"
	    "~/org/todos/phab.org"
	    "~/org/todos/phab.org"
	    ""))

(require 'idris-mode)
(define-key idris-prover-script-mode-map (kbd "M-n") 'idris-prover-script-forward)
(define-key idris-prover-script-mode-map (kbd "M-p") 'idris-prover-script-backward)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/org/todos/nix.org" "~/org/todos/nixops.org" "~/org/todos/phab.org" "~/org/todos/phab.org" "/home/pjw/org/todos/nix.org" "/home/pjw/org/todos/nixops.org" "/home/pjw/org/todos/phab.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(require 'haskell-mode)
(require 'haskell-font-lock)
;; (require 'hi2)
(add-hook 'haskell-mode-hook 'turn-on-hi2)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(require 'haskell-mode-autoloads)


(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)
