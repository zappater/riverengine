#lang racket



(define teleport%
  (class granpa%
    (init-field [target-act #f]
                [target-pos #f])
    (define/override (interact)
      (if (false? target-act)
          (send *current-PC* move-me target-pos)
          (begin (send *current-act* remove-obj *current-PC* (my-pos))
                 (transition target-act)
                 (send *current-act* move-obj *current-PC* #f target-pos))))))