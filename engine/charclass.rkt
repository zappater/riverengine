#lang racket
(define char% ;föräldra objektet till alla karaktärer, PC och NPC
  (class object%
    (super-new)
    (init-field [position #f]
                [animations '()]
                [texture #f])
    (define/public (my-pos)
      (if (eq? (send bla bla bla bla) position) ;frågar acten om han är där han tror han är
          position
          (begin (update-pos!)
                 position))) ;om han inte är där han tror han är, ber han acten leta reda på vart han är
    (define/private (update-pos!)
      (set! position (send bla bla bla bla)))
    (define/public (set-pos! new-pos)
      (if (eq? (...) 'game-act) ;är det en akt som använder funktionen?
          (set! position new-pos) ;i så fall updatera positionen
          (void))) ;annars gör inget