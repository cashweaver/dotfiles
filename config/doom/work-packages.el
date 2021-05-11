(package! gnus-alias)

(package! ol-notmuch
  :recipe (:local-repo "/usr/local/google/home/cashweaver/third_party/org-mode/contrib/lisp"))

(package! csearch
  :recipe (:local-repo "/usr/share/emacs/site-lisp/emacs-google-config/devtools/editors/emacs"))

;; Fig
;;;; Dependencies
(package! aio)
(package! bookmark)
(package! cl-lib)
(package! code-review
  :recipe (:local-repo "/usr/share/emacs/site-lisp/emacs-google-config/devtools/editors/emacs"))
(package! dash)
(package! desktop)
(package! eshell)
(package! ediff)
;;(package! em-dirs)
(package! google-lint
  :recipe (:local-repo "/usr/share/emacs/site-lisp/emacs-google-config/devtools/editors/emacs"))
(package! google-platform
  :recipe (:local-repo "/usr/share/emacs/site-lisp/emacs-google-config/devtools/editors/emacs"))
(package! google-emacs-utilities
  :recipe (:local-repo "/usr/share/emacs/site-lisp/emacs-google-config/devtools/editors/emacs"))
  ;:built-in 'perfer)
(package! google-process
  :recipe (:local-repo "/usr/share/emacs/site-lisp/emacs-google-config/devtools/editors/emacs"))
;(package! gv)
;;(package! magit-mode)
;;(package! magit-popup)
(package! nadvice)
(package! pcase)
(package! rx)
(package! s)
(package! term)
(package! with-editor)
;;;; VC/Fig
(package! vc-hgcmd)
(package! vc-defer
  :recipe (:host github :repo "google/vc-defer"))
;;;; Fig itself
(package! fig
  :recipe (:local-repo "/usr/share/emacs/site-lisp/emacs-google-config/devtools/editors/emacs/fig"))

(package! google
  ;:recipe (:local-repo "/usr/share/emacs/site-lisp/emacs-google-config/devtools/editors/emacs"))
  :built-in 'perfer)

(package! google3
  :recipe (:local-repo "/usr/share/emacs/site-lisp/emacs-google-config/devtools/editors/emacs"))

; Disable stuff to make google3-eglot work
(package! eglot :disable t)
(package! project :disable t)
(package! jsonrpc :disable t)
(package! xref :disable t)

(package! google3-eglot
  :recipe (:local-repo "/usr/share/emacs/site-lisp/emacs-google-config/devtools/editors/emacs"))

(package! google3-flymake
  :recipe (:local-repo "/usr/share/emacs/site-lisp/emacs-google-config/devtools/editors/emacs"))

(package! google3-mode
  :recipe (:local-repo "/usr/share/emacs/site-lisp/emacs-google-config/devtools/editors/emacs"))

(package! google3-paths
  :recipe (:local-repo "/usr/share/emacs/site-lisp/emacs-google-config/devtools/editors/emacs"))

(package! google-cc-extras
  :recipe (:local-repo "/usr/share/emacs/site-lisp/emacs-google-config/devtools/editors/emacs"))

(package! google-sendgmr
  :recipe (:local-repo "/usr/share/emacs/site-lisp/emacs-google-config/devtools/editors/emacs"))

(package! org-buganizer
  :recipe (:local-repo "/usr/share/emacs/site-lisp/emacs-google-config/devtools/editors/emacs"))

(package! org-super-agenda)
