;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-1337)

(setq display-line-numbers-type 'relative)

(setq org-directory "~/org/")

(set-face-attribute 'default nil :height 100)

(setq calendar-week-start-day 1)

;;; EXWM config
(require 'exwm)
(require 'exwm-config)

(setq exwm-workspace-number 10)

(setq exwm-input-global-keys
      `(
        ;; Bind "s-r" to exit char-mode and fullscreen mode.
        ([?\s-q] . exwm-reset)
        ;; Bind "s-w" to switch workspace interactively.
        ([?\s-w] . exwm-workspace-switch)
        ;; Bind "s-0" to "s-9" to switch to a workspace by its index.
        ,@(mapcar (lambda (i)
                    `(,(kbd (format "s-%d" i)) .
                      (lambda ()
                        (interactive)
                        (exwm-workspace-switch-create ,i))))
                  (number-sequence 0 9))
        ;; Bind "s-r" to launch applications ('M-&' also works if the output
        ;; buffer does not bother you).
        ([?\s-r] . (lambda (command)
                     (interactive (list (read-shell-command "$ ")))
                     (start-process-shell-command command nil command)))))

;;; Emacs config
(use-package mediawiki
  :config
  (setq mediawiki-site-alist '(("MotstandenWiki"
        "https://wiki.motstanden.no"
        ""
        ""
        nil
        "Forside"))))

(use-package typescript-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode)))

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
