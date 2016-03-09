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



	    (require 'custom) ;;start of higlight error line
	    
	    (defvar all-overlays ())
	    
	    (defun delete-this-overlay(overlay is-after begin end &optional len)
	      (delete-overlay overlay)
	      )
	    
	    (defun highlight-current-line()
	      (interactive)
	      (setq current-point (point))
	      (beginning-of-line)
	      (setq beg (point))
	      (forward-line 1)
	      (setq end (point))
	      ;; Create and place the overlay
	      (setq error-line-overlay (make-overlay 1 1))
	      
	      ;; Append to list of all overlays
	      (setq all-overlays (cons error-line-overlay all-overlays))
	      
	      (overlay-put error-line-overlay
			   'face '(background-color . "red"))
	      (overlay-put error-line-overlay
			   'modification-hooks (list 'delete-this-overlay))
	      (move-overlay error-line-overlay beg end)
	      (goto-char current-point)
	      )
	    
	    (defun delete-all-overlays()
	      (while all-overlays
		(delete-overlay (car all-overlays))
		(setq all-overlays (cdr all-overlays))
		)
	      )

	    (defun highlight-error-lines(compilation-buffer process-result)
	      (interactive)
	      (delete-all-overlays)
	      (condition-case nil
		  (while t
		    (next-error)
		    (highlight-current-line)
		    (save-excursion
		      (compilation-next-error-function 0)
		      (highlight-current-line))
		    )
		(error nil))
	      )

	    (setq compilation-finish-function 'highlight-error-lines) ;; End of error line higlight

	    ;; Press [apps] key in each window you want to "freeze" apps key is the right click key
	    (global-set-key [apps] 'toggle-window-dedicated);This doesn't seem to work on linux OSes so change to what you want/need it to be


					; disables linum-mode in specific buffers
	    (setq linum-mode-inhibit-modes-list '(eshell-mode
						  shell-mode
						  erc-mode
						  jabber-roster-mode
						  jabber-chat-mode
						  gnus-group-mode
						  gnus-summary-mode
						  gnus-article-mode
						  speedbar-mode
						  compilation-mode
						  text-mode)) 
	    
	    (defadvice linum-on (around linum-on-inhibit-for-modes)
	      "STOP the load of linum-mode for some major modes."
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

	    ;; start of mini compile window code
	    (defun my-compile ()
	      "Run compile and resize the compile window"
	      (interactive)
	      (progn
		(call-interactively 'compile)
		(setq cur (selected-window))
		(setq w (get-buffer-window "*compilation*"))
		(select-window w)
		(setq h (window-height w))
		(shrink-window (- h 10))
		(select-window cur)
		)
	      )

	    (defun my-compilation-hook () 
	      "Make sure that the compile window is splitting vertically"
	      (progn
		(if (not (get-buffer-window "*compilation*"))
		    (progn
		      (split-window-vertically)
		      )
		  )
		)
	      )

	    (add-hook 'compilation-mode-hook 'my-compilation-hook)
	    (global-set-key [f10] 'my-compile) ;; end of of mini compile window code

	    (ad-activate 'linum-on)
	    (global-linum-mode)

	    ;; sets highlight linemode on
	    (global-hl-line-mode)

	    ;; No more typing the whole yes or no. Just y or n will do.
	    (fset 'yes-or-no-p 'y-or-n-p)

	    ;; turns off system sound
	    (setq visible-bell nil)

	    ;;Attempts to set font to Consolas if that font is not available it sets the default font face to Courier

	    (set-face-attribute 'default nil :font "Fira Mono 12")
	    

	    ;;enables paren mode
	    (show-paren-mode t)

	    (setq ido-enable-flex-matching t)
	    (setq ido-everywhere t)
	    (ido-mode t)
	    (global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
	    
	    (setq backup-directory-alist '((".*" . "~/.emacs.d/emacs-backup")))
	    (setq auto-save-file-name-transforms '((".*""~/.emacs.d/emacs_auto-save")))
	    
	    (set-frame-parameter (selected-frame) 'alpha '(89 89))
	    
	    ;; ##### Start of config file where packages are required #############################
	    
	    (require 'gruvbox-theme)

	    (require 'powerline)
	    (powerline-default-theme)




	    (require 'autopair) 
	    (autopair-global-mode)

	    (require 'rfringe)

	    ;;auto-complete code block
	    (require 'auto-complete)
	    (auto-complete-mode)
	    (ac-config-default)  


	    (global-set-key (kbd  "C-x C-;") 'iedit-mode)
	    
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

	    (sr-speedbar-refresh-turn-on)
	    
	    (require 'fic-mode)
	    (fic-mode t)


	    (projectile-global-mode)
	    (unless (setq projectile-indexing-method 'native)
	      (setq projectile-indexing-method 'alien))
	    (setq projectile-enable-caching t)


	    )); end of startup hook



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(desktop-restore-frames t)
 '(desktop-restore-reuses-frames t)
 '(desktop-save t)
 '(desktop-save-mode t)
 '(fic-highlighted-words (quote ("FIXME" "TODO" "BUG" "KLUDGE" "NOTE")))
 '(initial-scratch-message ";;")
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
