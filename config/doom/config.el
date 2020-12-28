;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

; TODO: Convert these into a single function which accepts a day offset.
(defun todays-date ()
  "Return todays date as YYYY-MM-DD."
  (shell-command-to-string "echo -n $(date +%Y-%m-%d)"))

(defun yesterdays-date ()
  "Return todays date as YYYY-MM-DD."
  (shell-command-to-string "echo -n $(date +%Y-%m-%d) --date\"-1 day\""))

(setq
 display-line-numbers-type 'relative
 show-trailing-whitespace t
 user-full-name "Cash Weaver"
 user-mail-address "cashbweaver@gmail.com")

; theme
(setq
 doom-theme 'doom-tomorrow-night)

(projectile-clear-known-projects)

;; Org mode
(use-package! doct
  :commands (doct))
;;(after! org-superstar
  ;;(setq org-superstar-headline-bullets-list '("◉" "○" "✸" "✿" "✤" "✜" "◆" "▶")
        ;;org-superstar-headline-bullets-list '("Ⅰ" "Ⅱ" "Ⅲ" "Ⅳ" "Ⅴ" "Ⅵ" "Ⅶ" "Ⅷ" "Ⅸ" ")
        ;;org-superstar-prettify-item-bullets t ))
(after! org
  (setq
   org-ellipsis " ▾ "
   org-log-done 'time
   org-todo-keywords
   '((sequence
      ; A task that needs doing & is ready to do
      "TODO(t)"
      ; A project, which usually contains other tasks
      "PROJ(p)"
      ; A task that is in progress
      "STRT(s)"
      ; Something external is holding up this task
      "BLKD(b)"
      ; This task is paused/on hold because of me
      "HOLD(h)"
      "|"
      ; Task successfully completed
      "DONE(d)"
      ; Task was moved
      "MOVE(m)"
      ; Task was cancelled, aborted or is no longer applicable
      "KILL(k)")
     (sequence
      ; A task that needs doing
      "[ ](T)"
      ; Task is in progress
      "[-](S)"
      ; Task is being held up or paused
      "[?](W)"
      "|"
      ; Task was completed
      "[X](D)"))
   org-todo-keyword-faces
   '(("[-]"  . +org-todo-active)
     ("STRT" . +org-todo-active)
     ("[?]"  . +org-todo-onhold)
     ("BLKD" . +org-todo-onhold)
     ("HOLD" . +org-todo-onhold)
     ("PROJ" . +org-todo-project))
   org-directory "~/org/"
   org-agenda-files `(,cashweaver-daily-notes-dir-path))

;; Custom key map
;;
;; Keep in alphabetical order.
(map!
 (:leader
  ;; h
  :desc "at point" :n "h h" #'helpful-at-point
  ;; o
  (:prefix ("o" . "+open")
   (:prefix ("n" . "notes")
    :desc "Today" :n "t" #'cashweaver-daily-notes-open-todays-note
    :desc "Yesterday" :n "y" #'cashweaver-daily-notes-open-yesterdays-note))))
