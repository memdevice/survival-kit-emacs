;;; @(#) init.el -- emacs 27 windows 10 configuration survival kit  
;;; @(#) $Id$

;;;;  | 20210209 |

;; This file is not part of Emacs

;; Copyright (C) 2021 by Luca Missori
;; Author:          Luca Missori (mem.device@gmail.com)
;; Maintainer:      Luca Missori (mem.device@gmail.com
;; Created:         January 26, 2021
;; Keywords:        init config file
;; Latest Version:

;; COPYRIGHT NOTICE

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.


;; LM:________________________________________________________________
;;
;;     architettura del file system
;; ___________________________________________________________________

;; niente backup file di emacs in giro,
;; meglio tutti da una parte (e non in ~/.emacs.d)
(setq backup-directory-alist '(("" . "~/.backup/emacs")))

;; le configurazioni che emacs salva in autonomia (font etc.),
;; non devono finire nel mio file init.el, ma in uno apposito
(setq custom-file "~/.emacs.d/custom-file.el")
(load-file custom-file)   ; necessario per essere sicuri che venga caricato...

;; LM:________________________________________________________________
;;
;;     interfaccia utente
;; ___________________________________________________________________

;; Do not show the startup screen.
(setq inhibit-startup-message t)

;; Disable tool bar, menu bar, scroll bar
(tool-bar-mode -1)
;;(menu-bar-mode -1)
(scroll-bar-mode -1)

;; mostra anche il numero di colonna
(setq column-number-mode t)

;; LM: always on word wrap / truncate long lines
;; (setq-default word-wrap t)
;;(setq-default truncate-lines t)

;; Highlight current line
(global-hl-line-mode t)

;; Time in the modeline - I like having the clock.
;; (display-time-mode 1)

;; finestra verticale quasi 4:3 (chars x lines)
;; (when window-system
;;  (set-frame-position (selected-frame) 42 42)
;;  (set-frame-size (selected-frame) 72 52))
;; NB: scelgo l'opzione alternativa ‘-fh’ ‘--fullheight’ da command line

;; title bar
;; LM test rapido: configurazione standard vs. LM own
;;
;; (setq  frame-title-format (format "%s's Emacs" (capitalize user-login-name)))
(setq frame-title-format (format " ――――――     %s's Emacs    ――――――――――――――――― " (capitalize user-login-name))) ; standard
;; (setq frame-title-format (format " ――――――  |    EscMetaAltControlShift  42   |  ――――――――――――――――― ")) ; LM own (64 char)

;; se si preferisce partire con un file vuoto "untitled"
;; invece che con lo scratch buffer (cfr. piu' sotto)
;; (setq initial-buffer-choice 'xah-new-empty-buffer)

;; LM:________________________________________________________________
;;
;;     interazione utente i.e. "better default"
;; ___________________________________________________________________


;; breviter
(defalias 'yes-or-no-p 'y-or-n-p)

;; delete trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; dimensione della riga standard a 78 caratteri
(setq-default fill-column 72)    ; M-q per applicarla

;; Make kill/yank work with the X clipboard
;; (setq x-select-enable-clipboard t)
;;  LM: non sembra necessario...

;; View mode (M-x view-mode)
;;
;; Provide pager-like keybindings. Makes navigating read-only buffers a breeze.
;; Move down and up with SPC and delete (backspace) or S-SPC,
;; half a page down and up with d and u, and isearch with s.
(setq view-read-only t)   ; LM NB: il view-mode classico si attiva con C-c C-q

;; auto close bracket insertion.
;; typing any left bracket automatically insert the right matching bracket
(electric-pair-mode 1)

;; LM:________________________________________________________________
;;
;;    package installed by hand
;; ___________________________________________________________________


;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/lisp/")


;; lorem ipsum etc.
(require 'lorem-ipsum)
(lorem-ipsum-use-default-bindings)
;;
;; Key Binding 	Function
;; C-c l p 	lorem-ipsum-insert-paragraphs
;; C-c l s 	lorem-ipsum-insert-sentences
;; C-c l l 	lorem-ipsum-insert-list

;;  ___________________ cygwin shell _________________________________

;; LM: usare la bash di cygwin
;; da: https://www.masteringemacs.org/article/running-shells-in-emacs-overview
;;
;; (setq explicit-shell-file-name "c:/cygwin64/bin/bash.exe")
;; (setq shell-file-name "bash")
;; (setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
;; (setenv "SHELL" shell-file-name)
;; (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)

;; Supply a random fortune cookie as the *scratch* message.
;; (using internal function.el...)
 (when (executable-find "fortune")
   (setq initial-scratch-message
         (with-temp-buffer
           (shell-command "fortune" t)
           (let ((comment-start ";;"))
             (comment-region (point-min) (point-max)))
           (concat (buffer-string) "\n"))))
 
