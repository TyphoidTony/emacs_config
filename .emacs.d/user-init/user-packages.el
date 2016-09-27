					;#####################; 
					;##### Packages ######; 
					;#####################;

(require 'gruvbox-theme)


(require 'spaceline-config)
(spaceline-emacs-theme)

(require 'autopair) 
(autopair-global-mode)


(require 'rfringe)


(require 'auto-complete)
(auto-complete-mode)
(ac-config-default)  


(global-set-key (kbd  "C-x C-;") 'iedit-mode)

(require 'yasnippet)
(yas-global-mode 1)

(global-aggressive-indent-mode 1)

;;for all those nice variable colors
(add-hook 'prog-mode-hook 'rainbow-identifiers-mode)



(require 'smex )
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-;") 'smex)

(require 'fixmee)
(fixmee-mode t)

(global-set-key (kbd "C-c C-d") 'zeal-at-point)




(require 'ecb)
(ecb-activate)
(setq ecb-examples-bufferinfo-buffer-name nil)
(global-set-key [f5] 'ecb-toggle-ecb-windows)


;;clojure block
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(require 'ac-cider)
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(progn 
     (add-to-list 'ac-modes 'cider-mode)
     (add-to-list 'ac-modes 'cider-repl-mode)))
