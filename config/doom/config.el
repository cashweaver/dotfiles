;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; DO NOT EDIT THIS FILE MANUALLY.
;; This file is generated from doom.md. You should make your changes there and
;; this file using org-babel-tangle.

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
; (setq user-full-name "John Doe"
;       user-mail-address "john@doe.com")

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

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
; (setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
; (setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
; (setq display-line-numbers-type t)


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

(setq
 calendar-date-style 'iso)

(defun cashweaver-get-date (&optional date-format offset-days)
  "Return the (offset) date in format."
  (interactive)
  (let ((date-format (or date-format "%Y-%m-%d"))
        (offset-days (or offset-days 0)))
    (shell-command-to-string
     (format "echo -n $(date \"+%s\" --date=\"%d days\")" date-format offset-days))))

(defun cashweaver-todays-date ()
  "Return todays date as YYYY-MM-DD."
  (cashweaver-get-date
   ; date-format
   "%Y-%m-%d"
   ; offset-days
   0))

(defun cashweaver-yesterdays-date ()
  "Return todays date as YYYY-MM-DD."
  (cashweaver-get-date
   ; date-format
   "%Y-%m-%d"
   ; offset-days
   -1))

(cashweaver-todays-date)

; Reference; https://www.emacswiki.org/emacs/DocumentingKeyBindingToLambda
(defun evil-lambda-key (mode keymap key def)
  "Wrap `evil-define-key' to provide documentation."
  (set 'sym (make-symbol (documentation def)))
  (fset sym def)
  (evil-define-key mode keymap key sym))

(setq
 doom-theme 'doom-tomorrow-night)

(setq
 show-trailing-whitespace t)

(use-package! doct
  :commands (doct))

(use-package! org2jekyll)

(after! org
  (setq
   org-ellipsis " ▾ "
   org-log-done 'time
   ; Start the org agenda mini-calendar on Monday.
   calendar-week-start-day 1
   org-hide-leading-stars t))

(after! org
  (setq
   org-todo-keywords
   '((sequence
      ; A task that needs doing & is ready to do
      "TODO(t)"
      ; A project, which usually contains other tasks
      "PROJ(p)"
      ; A task that is in progress
      "INPROGRESS(i)"
      ; Something external is holding up this task
      "BLOCKED(b)"
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
     ("INPROGRESS" . +org-todo-active)
     ("[?]"  . +org-todo-onhold)
     ("BLKD" . +org-todo-onhold)
     ("HOLD" . +org-todo-onhold)
     ("PROJ" . +org-todo-project))))

(after! org-agenda
  (setq
   org-agenda-skip-scheduled-if-deadline-is-shown t
   org-agenda-skip-scheduled-if-done t
   org-agenda-skip-scheduled-if-done t
   org-agenda-skip-deadline-if-done t
   org-agenda-include-deadlines t
   org-agenda-block-separator nil
   org-agenda-compact-blocks t
   org-agenda-start-day nil ;; i.e. today
   org-agenda-span 1
   org-agenda-start-on-weekday nil))

(after! org
  (map!
   :map org-mode-map
   :localleader
   :desc "structure templates" :n "S" #'org-insert-structure-template
   (:prefix ("C" . "code")
     (:prefix ("e" . "execute")
      :desc "block" :n "b" #'org-babel-execute-src-block))))

(defun cashweaver-org--archive-when-done ()
  "Archive entry when it is marked as done (as defined by `org-done-keywords')."
  (when (org-entry-is-done-p)
    (unless (org-get-repeat)
      (org-archive-subtree-default))))

(add-hook! 'org-after-todo-state-change-hook
           'cashweaver-org--archive-when-done)

;(setq
 ;cashweaver--blog-post-directory
 ;org-publish-project-alist
 ;'(("blog-post"
    ;:base-directory )))

(defun is-work-p ()
  "Return true if executed on my work machine."
  (file-directory-p "/home/google"))
(if (is-work-p)
    (load "work-config.el"))
