;; split horizontal be default
(setq split-width-threshold nil)
(setq split-height-threshold 1)
(display-fill-column-indicator-mode)

(load "/opt/clang/clang-13.0.0/share/clang/clang-format.el")
(add-hook 'before-save-hook
	  (lambda ()
	    (when (eq major-mode 'c++-mode) (clang-format-buffer))))
