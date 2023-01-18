;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-1337)

(setq display-line-numbers-type 'relative)

(setq org-directory "~/org/")

<<<<<<< HEAD

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(set-face-attribute 'default nil :height 180)

(setq calendar-week-start-day 1)

(display-time-mode 1)
(setq display-time-24hr-format t)


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

(map! :leader
      (:prefix-map ("e" . "empv")
        :desc "Start radio" "r" #'empv-play-radio
        :desc "Play/pause" "SPC" #'empv-toggle
        :desc "Toggle video" "v" #'empv-toggle-video
        :desc "Next" ">" #'empv-playlist-next
        :desc "Previous" "<" #'empv-playlist-prev
        :desc "Quit empv" "q" #'empv-exit))


(use-package empv
  :config
  (setq empv-invidious-instance "https://invidious.tiekoetter.com/")
  (add-to-list 'empv-mpv-args "--ytdl-format=best")
  (setq empv-radio-channels '(("Lain Cyberia" . "https://lainon.life/radio/cyberia.ogg")
                              ("Darksynth Radio" . "https://stream.nightride.fm/darksynth.m4a")
                              ("Thanatos Retrowave" . "https://www.youtube.com/channel/UCmYTgpKxd-QOJCPDrmaXuqQ/live")
                              ("Lofi Hip Hop beats to relax/study" . "https://www.youtube.com/channel/UCSJ4gkVC6NrvII8umztf0Ow/live")
                              ("Va11 Hall-A Radio" . "https://www.youtube.com/playlist?list=PLQuOY1HVtJ__GGoVvMXuT9ezBouejgvTq")
                              ("80s City Pop" . "https://youtube.com/playlist?list=PLFn4dkBSmLS3yXEJXQjvAGP0kV92KAJtq")
                              ("Danger/u/ radio" . "http://radio.dangeru.us:8000/stream.ogg"))))
