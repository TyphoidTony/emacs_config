(put 'upcase-region 'disabled nil)

					;startup hook starts here ----

(add-hook 'emacs-startup-hook
	  (lambda ()  

	    (when (>= emacs-major-version 24)
	      (require 'package)
	      (package-initialize)
	      (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
	      )

	    (defun kcb()
	      (interactive)
	      (kill-buffer))

	    (defun lsp()
	      (interactive)
	      (list-packages))

	    ;;disables verital anc horizontal scrollbars
	    (scroll-bar-mode -1)
	    (add-hook 'after-make-frame-functions
		      '(lambda (frame)
			 (modify-frame-parameters frame
						  '((vertical-scroll-bars . nil)
						    (horizontal-scroll-bars . nil)))))
	    
	    ;; this makes it so that ctrl + arrows resize the current buffer window
	    (global-set-key (kbd "<C-up>") 'shrink-window)
	    (global-set-key (kbd "<C-down>") 'enlarge-window)
	    (global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
	    (global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

	    ;; moves left and right between windows
	    (defun my-previous-window()
	      "Previous window"
	      (interactive)
	      (other-window -1))           
	    (global-set-key  (kbd "C-,") 'my-previous-window) 
	    (global-set-key (kbd  "C-.") 'other-window)

	    ;; switches between previous and next buffer
	    (global-set-key (kbd "  C-l") 'next-buffer)
	    (global-set-key (kbd " C-j") 'previous-buffer)


	    ;; Toggle window dedication
	    (defun toggle-window-dedicated ()
	      "Toggle whether the current active window is dedicated or not"
	      (interactive)
	      (message
	       (if (let (window (get-buffer-window (current-buffer)))
		     (set-window-dedicated-p window 
					     (not (window-dedicated-p window))))
		   "Window '%s' is dedicated"
		 "Window '%s' is normal")
	       (current-buffer)))

	    ;; Press [apps] key in each window you want to "freeze" apps key is the right click key
	    (global-set-key [apps] 'toggle-window-dedicated)


					; disables linum-mode in specific buffers
	    (setq linum-mode-inhibit-modes-list '(eshell-mode
						  shell-mode
						  erc-mode
						  jabber-roster-mode
						  jabber-chat-mode
						  gnus-group-mode
						  gnus-summary-mode
						  gnus-article-mode
						  speedbar-mode )) 
	    
	    (defadvice linum-on (around linum-on-inhibit-for-modes)
	      "Stop the load of linum-mode for some major modes."
	      (unless (member major-mode linum-mode-inhibit-modes-list)
		ad-do-it))

	    ;; Removes *messages* from the buffer.
	    (setq-default message-log-max nil)
	    (kill-buffer "*Messages*")

	    ;; Removes *Completions* from buffer after you've opened a file.
	    (add-hook 'minibuffer-exit-hook
		      '(lambda ()
			 (let ((buffer "*Completions*"))
			   (and (get-buffer buffer)
				(kill-buffer buffer)))))

	    (defadvice pop-to-buffer (before cancel-other-window first)
	      (ad-set-arg 1 nil))

	    (ad-activate 'pop-to-buffer)


	    (ad-activate 'linum-on)
	    (global-linum-mode)

	    ;; sets highlight linemode on
	    (global-hl-line-mode)

	    ;; No more typing the whole yes or no. Just y or n will do.
	    (fset 'yes-or-no-p 'y-or-n-p)

	    ;; turns off system sound
	    (setq visible-bell t)

	    ;;sets font to Consolas
	    (set-face-attribute 'default nil :font "Consolas 12")

	    ;;enables paren mode
	    (show-paren-mode t)
	    
	    (global-set-key (kbd "C-=") 'shell-command)
	    
	    (setq ido-enable-flex-matching t)
	    (setq ido-everywhere t)
	    (ido-mode t)
	    ;; ##### Start of config file where packages are required #############################
	    
	    (require 'gruvbox-theme)

	    (require 'powerline)
	    (powerline-default-theme)

	    (require 'autopair) 
	    (autopair-global-mode)

	    (require 'rfringe)

	    ;;auto-complete code block
	    (require 'auto-complete)
	    (ac-config-default)  
	    (require 'auto-complete-config)
	    (defun my:ac-c-headers-init ()
	      (require 'auto-complete-c-headers)
	      (add-to-list 'ac-sources 'ac-source-c-headers))
	    (add-hook 'c++-mode-hook 'my:ac-c-headers-init)
	    (add-hook 'c-mode-hook 'my:ac-c-headers-init)
	    (auto-complete-mode)

	    (global-set-key (kbd  "C-x C-;") 'iedit-mode)

	    ;;turns on icicles mode minibuffer completion
	    ;;You can cycle through completion by using Home and End 
	    (icy-mode 1)
	    
	    (require 'yasnippet)
	    (yas-global-mode 1)

	    (global-aggressive-indent-mode 1)

	    ;;for all those nice variable colors
	    (add-hook 'prog-mode-hook 'rainbow-identifiers-mode)

	    ;;sr-speedbar code block
	    (require 'sr-speedbar)
	    (sr-speedbar-open)
	    (with-current-buffer sr-speedbar-buffer-name
	      (setq window-size-fixed 'width))
	    (custom-set-variables
	     '(speedbar-show-unknown-files 1)
	     )
	    (setq speedbar-use-images nil)
	    (sr-speedbar-refresh-turn-on)
	    
	    (require 'fic-mode)
	    (fic-mode t)
	    
	    (cd "C:/users/null/workspace/")

	    (setq path-to-ctags "C:\ctags")
	    (defun create-tags (dir-name)
	      "Create tags file."
	      (interactive "DDirectory: ")
	      (shell-command
	       (format "ctags -f %s -e -R %s" path-to-ctags (directory-file-name dir-name)))
	      )

	    (projectile-global-mode)
	    (setq projectile-indexing-method 'alien)
	    (setq projectile-enable-caching t)

	    (kill-buffer "*scratch*")
	    (kill-buffer "*GNU Emacs*");If you don't see "No buffer named GNU emacs in the minibuffer the entire init file did not load"

	    )); end of startup hook
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "c:/Temp" t))))
 '(backup-directory-alist (quote ((".*" . "c:/Temp"))))
 '(column-number-mode t)
 '(custom-enabled-themes (quote (gruvbox)))
 '(custom-safe-themes
   (quote
    ("9e720b0c4ed90ce3735c94705f93b519191f5220e73dbacf6a4d71b89a0a6b0e" default)))
 '(desktop-restore-frames t)
 '(desktop-restore-reuses-frames t)
 '(desktop-save t)
 '(desktop-save-mode t)
 '(fic-highlighted-words (quote ("FIXME" "TODO" "BUG" "KLUDGE" "NOTE")))
 '(icicle-region-background "dark slate gray")
 '(initial-scratch-message ";;Jot down quick notes here.



")
 '(menu-bar-mode nil)
 '(neo-click-changes-root t)
 '(neo-smart-open t)
 '(neo-window-position (quote right))
 '(neo-window-width 30)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/"))))
 '(pop-up-windows nil)
 '(rainbow-identifiers-face-count 6)
 '(speedbar-show-unknown-files 1)
 '(speedbar-update-flag t)
 '(speedbar-use-images nil)
 '(speedbar-verbosity-level 0)
 '(sr-speedbar-default-width 40)
 '(sr-speedbar-right-side nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
