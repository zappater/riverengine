#lang racket
(require "granpaclass.rkt")
(require "globals.rkt")
(provide (all-defined-out))

;object library contains all pre-made specific use objects
;examples include teleporters and enemies

(define teleport%
  ;a object used for teleporting characters within an act or between acts
  (class granpa%
    (super-new)
    (init-field [target-act #f]
                [target-pos #f])
    (inherit my-pos)
    (define/override (interact)
      ;if target-act is #f the character is going to remain within the current act
      ;transition changes *current-act* to the act we want to move to
      ;when moving a character between two acts we need to make sure to remove the character from the old act in case we enter
      ;that act from another place in the future, otherwise we could end up with two instances of the same object
      ;(note, there is a difference between two instances of the same object and two instances of identical objects)
      (if (false? target-act)
          (send *current-PC* move-me target-pos)
          (begin (send *current-act* remove-obj *current-PC* (send *current-PC* my-pos))
                 (transition target-act)
                 (send *current-act* move-obj *current-PC* #f target-pos))))))
