#lang racket
(require compatibility/mlist)
(require racket/gui/base)
(require "actclass.rkt")
(require "granpaclass.rkt")
(require "leveldatastructure.rkt")
(require "supportfunctions.rkt")
(require "teleportclass.rkt")
(require "globals.rkt")
(require "UIdefines.rkt")
(require "key-handler.rkt")
(require "textureclass.rkt")
(require "charclass.rkt")
(require racket/file)
(require "texture_defs.rkt")
(require "Island_act.rkt")
(require "arenaact.rkt")
(require "PCclass.rkt")
(require "dialog_definitions.rkt")
(provide (all-defined-out))

(transition island) ;makes island the start act of the game

;object defs
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
(change-control-scheme ingame-controls)
(define camera-obj mainchar) ;bör ändras till dedikerad kamera hanterare!
;places objects in the world
(change-PC mainchar)
;;draw setup defines
(define *scale* 1)
(define viewsize (cons 10 14))
(define game #t)
(display (send mainchar my-pos))


