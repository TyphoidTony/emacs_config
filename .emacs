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

	    
	    (scroll-bar-mode -1)
	    (add-hook 'after-make-frame-functions
		      '(lambda (frame)
			 (modify-frame-parameters frame
						  '((vertical-scroll-bars . nil)


	    
					; this makes it so that ctrl + arrows resize the current buffer window
	    (global-set-key (kbd "<C-up>") 'shrink-window)
	    (global-set-key (kbd "<C-down>") 'enlarge-window)
	    (global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
	    (global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

					; moves left and right between windows
	    (defun my-previous-window()
	      "Previous window"
	      (interactive)
	      (other-window -1))           
	    (global-set-key  (kbd "C-x C-,") 'my-previous-window) 
	    (global-set-key (kbd  "C-x C-.") 'other-window)

					; switches between previous and next buffer
	    (global-set-key (kbd "C-x C-l") 'next-buffer)
	    (global-set-key (kbd "C-x C-j") 'previous-buffer)


					; turns off system sound
	    (setq visible-bell t)

	    
	    (require 'gruvbox-theme)
	    (set-face-attribute 'default nil :font "Consolas 12")
	    (require 'powerline)
	    (powerline-default-theme)


	    (require 'autopair) 
	    (autopair-global-mode)


	    (require 'auto-complete)
	    (ac-config-default)  
	    (require 'auto-complete-config)
	    (auto-complete-mode)
	    (require 'auto-complete-c-headers)
	    (add-to-list 'ac-sources 'ac-source-c-headers)

	    
	    (require 'yasnippet)
	    (yas-global-mode 1)



	    (global-aggressive-indent-mode 1)
					; shows the parne mode, highlighting the parens of a pair. 
	    (show-paren-mode 1)
					; sets highlight linemode on
	    (global-hl-line-mode)


					; disables linum-mode in specific buffers
	    (setq linum-mode-inhibit-modes-list '(eshell-mode
						  shell-mode
						  erc-mode
						  jabber-roster-mode
						  jabber-chat-mode
						  gnus-group-mode
						  gnus-summary-mode
						  gnus-article-mode
						  speedbar-mode))
	    
	    (defadvice linum-on (around linum-on-inhibit-for-modes)
	      "Stop the load of linum-mode for some major modes."
	      (unless (member major-mode linum-mode-inhibit-modes-list)
		ad-do-it))

	    (ad-activate 'linum-on)
	    (global-linum-mode)

					;for all those nice variable colors
	    (add-hook 'prog-mode-hook 'rainbow-identifiers-mode)

	    (require 'sr-speedbar)
	    (sr-speedbar-open)
	    (sr-speedbar-refresh-turn-on)
	    (with-current-buffer sr-speedbar-buffer-name
	      (setq window-size-fixed 'width))
	    (custom-set-variables
	     '(speedbar-show-unknown-files 1)
	     )
	    (setq speedbar-use-images nil)


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

	    ;; Press [pause] key in each window you want to "freeze"
	    (global-set-key [pause] 'toggle-window-dedicated)



	    ;; No more typing the whole yes or no. Just y or n will do.
	    (fset 'yes-or-no-p 'y-or-n-p)

	    (fic-mode t);TODO FIXME is this highlited? If not this is not working 

	    ;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
	    (custom-set-variables
	     '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
	     '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))

	    ;; create the autosave dir if necessary, since emacs won't.
	    (make-directory "~/.emacs.d/autosaves/" t)


	    (cd "C:/users/null/workspace/")

	    (kill-buffer "*scratch*")
	    (kill-buffer "*GNU Emacs*");If you don't see "No buffer named GNU emacs in the minibuffer the entire init file did not load"

	    
	    )); end of startup hook

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(column-number-mode t)
 '(custom-enabled-themes (quote (gruvbox)))
 '(custom-safe-themes
   (quote
    ("9e720b0c4ed90ce3735c94705f93b519191f5220e73dbacf6a4d71b89a0a6b0e" default)))
 '(desktop-restore-frames t)
 '(desktop-restore-reuses-frames t)
 '(desktop-save t)
 '(desktop-save-mode t)
 '(menu-bar-mode nil)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/"))))
 '(pop-up-windows nil)
 '(rainbow-identifiers-face-count 6)
 '(speedbar-show-unknown-files 1)
 '(sr-speedbar-default-width 30)
 '(sr-speedbar-right-side nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
