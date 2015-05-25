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
(provide (all-defined-out))
;;object defs
(define dialog-row1
  (new UIpanel%
       [offset (cons 4 4)]))
(define dialog-row2
  (new UIpanel%
       [offset (cons 18 4)]))
(define dialog-row3
  (new UIpanel%
       [offset (cons 32 4)]))
(define dialog-row4
  (new UIpanel%
       [offset (cons 46 4)]))
(define dialog-row5
  (new UIpanel%
       [offset (cons 70 4)]))
(define dialog-row6
  (new UIpanel%
       [offset (cons 84 4)]))

(define dialog-bar
  (new UIpanelgroup%
       [uipanels (list dialog-row1 dialog-row2 dialog-row3 dialog-row4 dialog-row5 dialog-row6)]
       [anchor 'bottomleft]
       [size (cons 400 100)]))

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
(send ingame-controls add-key #\space (lambda () (begin (send dialog-row3 set-text! (send mainchar interact))
                                                        (send game-ui add-uipanel dialog-bar))))
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
       [use "hej, jag är en NPC"]))
(define camera-obj mainchar) ;;bör ändras till dedkerad kamera hanterare!
(send mainchar move-me '(2 15 9))
(send knightNPC move-me '(2 15 10))
;;draw setup defines
(define *scale* 1)
(define viewsize (cons 10 14))
(define game #t)
(display (send mainchar my-pos))


