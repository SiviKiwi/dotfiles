(setq doom-theme 'doom-1337)
(setq display-line-numbers-type 'relative)
(setq org-directory "~/org/")

(cond ((string= (getenv "DEVICE") "DESKTOP") (set-face-attribute 'default nil :height 100))
      ((string= (getenv "DEVICE") "LAPTOP") (set-face-attribute 'default nil :height 160)))


(setq calendar-week-start-day 1)

(use-package mediawiki
  :config
  (setq mediawiki-site-alist '(("MotstandenWiki"
        "https://wiki.motstanden.no"
        ""
        ""
        nil
        "Forside"))))

(defun int-bin (s)
  "convert an integer into it's binary representation in string format"
  (setq i (string-to-number s))
  (let ((res ""))
    (while (not (= i 0))
      (setq res (concat (if (= 1 (logand i 1)) "1" "0") res))
      (setq i (lsh i -1)))
    (if (string= res "")
        (setq res "0"))
    res))

(defun int-to-bin-string ()
  (interactive)
  (let ((command-output (int-bin (buffer-substring (mark) (point)))))
    (kill-region (mark) (point))
    (insert command-output)))

(use-package typescript-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode)))

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(global-set-key (kbd "C-c e") 'eval-and-replace)

(use-package nov
  :config
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))

(use-package sly
  :init
  (setq inferior-lisp-program "/usr/bin/sbcl"))
