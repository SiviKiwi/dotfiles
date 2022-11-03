;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-1337)

(setq display-line-numbers-type 'relative)

(setq org-directory "~/org/")

(set-face-attribute 'default nil :height 100)

(setq calendar-week-start-day 1)

(display-time-mode 1)
(setq display-time-24hr-format t)

;;; EXWM config
(require 'exwm)
(require 'exwm-config)

(setq exwm-workspace-number 10)

(setq exwm-input-global-keys
      `(
        ;; Bind "s-R" to exit char-mode and fullscreen mode.
        ([?\s-R] . exwm-reset)
        ([?\s-q] . kill-current-buffer)
        ;; Bind "s-w" to switch workspace interactively.
        ([?\s-w] . exwm-workspace-switch)
        ;; Bind "s-0" to "s-9" to switch to a workspace by its index.
        ,@(mapcar (lambda (i)
                    `(,(kbd (format "s-%d" i)) .
                      (lambda ()
                        (interactive)
                        (exwm-workspace-switch-create ,i))))
                  (number-sequence 1 9))
        ;; Bind "s-r" to launch applications ('M-&' also works if the output
        ;; buffer does not bother you).
        ([?\s-r] . (lambda (command)
                     (interactive (list (read-shell-command "$ ")))
                     (start-process-shell-command command nil command)))
        ([?\s-l] . evil-window-right)
        ([?\s-k] . evil-window-up)
        ([?\s-j] . evil-window-down)
        ([?\s-h] . evil-window-left)
        ([?\s-s] . +evil/window-split-and-follow)
        ([?\s-v] . +evil/window-vsplit-and-follow)
;; FIXME: dont understand
;;        ([?\s-t] . (lambda ()
;;                     (+evil/window-vsplit-and-follow)
;;                     (+vterm/here)))
        ))

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


(use-package empv
  :config
  (setq empv-invidious-instance "https://invidious.tiekoetter.com/")
  (add-to-list 'empv-mpv-args "--ytdl-format=best")
  (setq empv-radio-channels '(("Lain Cyberia" . "https://lainon.life/radio/cyberia.ogg")
                              ("https://lainon.life/radio/cyberia.ogg" . "https://stream.nightride.fm/darksynth.m4a")
                              ("Thanatos Retrowave" . "https://www.youtube.com/channel/UCmYTgpKxd-QOJCPDrmaXuqQ/live")
                              ("Lofi Hip Hop beats to relax/study" . "https://www.youtube.com/channel/UCSJ4gkVC6NrvII8umztf0Ow/live")
                              ("Va11 Hall-A Radio" . "https://www.youtube.com/playlist?list=PLQuOY1HVtJ__GGoVvMXuT9ezBouejgvTq")
                              ("80s City Pop" . "https://youtube.com/playlist?list=PLFn4dkBSmLS3yXEJXQjvAGP0kV92KAJtq")
                              ("Danger/u/ radio" . "http://radio.dangeru.us:8000/stream.ogg"))))
