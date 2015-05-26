#lang racket
(require compatibility/mlist)
(require racket/gui/base)
(require "actclass.rkt")
(require "granpaclass.rkt")
(require "leveldatastructure.rkt")
(require "supportfunctions.rkt")
(require "globals.rkt")
(require "UIdefines.rkt")
(require "key-handler.rkt")
(require "textureclass.rkt")
(require "charclass.rkt")
(require racket/file)
(require "texture_defs.rkt")
(require "Island_act.rkt")
(require "PCclass.rkt")
(require "dialog_definitions.rkt")
(provide (all-defined-out))
;;object defs


(define mypos-panel
  (new UIpanel%
       [size (cons 60 20)]
       [anchor 'topright]))       
(define (indraw)
  (send mypos-panel set-text! 
        (string-join 
         (let ((pos (send mainchar my-pos)))
           (list
            (~r (first pos))
            (~r (second pos))
            (~r (third pos)))))))
(define game-ui
  (new UI%
       [uipanels (list mypos-panel)]))
(change-ui game-ui)
(define ingame-controls
  (new control-scheme%))
(send ingame-controls add-key 'up (lambda () (send mainchar walk 'up)))
(send ingame-controls add-key 'right (lambda () (send mainchar walk 'right)))
(send ingame-controls add-key 'left (lambda () (send mainchar walk 'left)))
(send ingame-controls add-key 'down (lambda () (send mainchar walk 'down)))
(send ingame-controls add-key #\space (lambda () ((send mainchar interact))))
(send ingame-controls add-key #\1 (lambda () (send dialog-handler choose-option 1)))
(send ingame-controls add-key #\2 (lambda () (send dialog-handler choose-option 2)))
(send ingame-controls add-key #\3 (lambda () (send dialog-handler choose-option 3)))
(send ingame-controls add-key #\4 (lambda () (send dialog-handler choose-option 4)))
(define knightNPCdialog-node-1
  (new dialog-node%
       [text "Hi, I'm an NPC"]
       [option "1) Goodbye"]
       [actions (list 'end)]))
(define knightNPCdialog
  (new my-dialog%))
(send knightNPCdialog add-node knightNPCdialog-node-1 (list 1))
       
       
(change-control-scheme ingame-controls)
(define mainchar 
  (new PC%
       [texture (list (read-bitmap "50x50_Magesprite (1).png") 
                      (read-bitmap "50x50_Magesprite (3).png") 
                      (read-bitmap "50x50_Magesprite (2).png") 
                      (read-bitmap "50x50_Magesprite (4).png"))]
       [facing 'right]))
(define knightNPC
  (new char%
       [texture (list (read-bitmap "50x50_Knight (1).png")
                      (read-bitmap "50x50_Knight (3).png")
                      (read-bitmap "50x50_Knight (2).png")
                      (read-bitmap "50x50_Knight (4).png"))]
       [facing 'left]
       [use ((lambda (local-bol)
               (lambda () (if local-bol
                              (begin
                                (send dialog-handler dialog-active #t knightNPCdialog)
                                (send knightNPCdialog initialize-dialog)
                                (send dialog-handler display-dialog knightNPCdialog)
                                (set! local-bol #f))
                              (begin
                                (send dialog-handler dialog-active #f)
                                (set! local-bol #t)))))
             #t)]))
(define camera-obj mainchar) ;;bör ändras till dedkerad kamera hanterare!
(send mainchar move-me '(2 15 9))
(send knightNPC move-me '(2 15 10))
;;draw setup defines
(define *scale* 1)
(define viewsize (cons 10 14))
(define game #t)
(display (send mainchar my-pos))


