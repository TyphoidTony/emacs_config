(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
;;When in ido-mode press C-f .This disables ido for the moment.
