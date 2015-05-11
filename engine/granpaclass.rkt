#lang racket
(require "supportfunctions.rkt")
(require "actclass.rkt")
(require "globals.rkt")
(provide (all-defined-out))
(define granpa% ;föräldra objektet till alla karaktärer, PC och NPC
  (class object%
    (super-new)
    (init-field [position #f]
                [name #f]
                [animations '()]
                [texture #f])
    (define/public (my-pos)
      (if (and (valid-pos? position) (eq? (send *current-act* get-obj-at-pos position) this)) ;frågar acten om han är där han tror han är
          position
          (begin (update-pos!)
                 position)));om han inte är där han tror han är, ber han acten leta reda på vart han är
  (define/private (update-pos!)
    (set! position (send *current-act* get-obj-pos this)))
  (define/public (set-pos! new-pos obj)
    (if (eq? (send obj get-type) 'game-act) ;är det en akt som använder funktionen?
        (set! position new-pos) ;i så fall updatera positionen
        (void))) ;annars gör inget
  (define/public (move-me position)
    (send *current-act* move-obj this (my-pos) position))
  (define/public (get-name)
    name)
  
  ;DEBUG!!!!!!!
  (define/public (debug-get-pos)
    position)))

