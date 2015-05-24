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
  (new UIpanelgroup%))
       
(define game-ui
  (new UI%))
(change-ui game-ui)
(define ingame-controls
  (new control-scheme%))
(send ingame-controls add-key 'up (lambda () (send mainchar walk 'up)))
(send ingame-controls add-key 'left (lambda () (send mainchar walk 'right)))
(send ingame-controls add-key 'right (lambda () (send mainchar walk 'left)))
(send ingame-controls add-key 'down (lambda () (send mainchar walk 'down)))
(change-control-scheme ingame-controls)
(define mainchar 
  (new PC%
       [texture (list (read-bitmap "50x50_magesprite (1).png") 
                      (read-bitmap "50x50_magesprite (3).png") 
                      (read-bitmap "50x50_magesprite (4).png") 
                      (read-bitmap "50x50_magesprite (2).png"))]
       ))
(define knightNPC
  (new char%
       [texture (list (read-bitmap "50x50_Knight (1).png")
                      (read-bitmap "50x50_Knight (3).png")
                      (read-bitmap "50x50_Knight (4).png")
                      (read-bitmap "50x50_Knight (2).png"))]))
(define camera-obj mainchar) ;;bör ändras till dedkerad kamera hanterare!
(send mainchar move-me '(2 27 25))
;;draw setup defines
(define *scale* 1)
(define viewsize (cons 10 14))
(define game #t)
(display (send mainchar my-pos))

       
