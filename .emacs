;; split horizontal be default
(setq split-width-threshold nil)
(setq split-height-threshold 1)
(display-fill-column-indicator-mode)

(setq path-to-clang (get-env CLANGDIR))
(load (concat path-to-clang "/share/clang/clang-format.el"))
(add-hook 'before-save-hook
	  (lambda ()
	    (when (eq major-mode 'c++-mode) (clang-format-buffer))))
