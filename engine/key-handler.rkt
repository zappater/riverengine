#lang racket
(provide (all-defined-out))

;why is this not a part of the object? /Henrik
(define (key-handler key control-scheme)
  ;takes a key on the keyboard
  ;and a control-scheme object as arguments
  ;if the key is bound to a function in the control-scheme object than that function is run
  ;otherwise it does nothing
  (let ((funk (send control-scheme get-keyandfunk key)))
    (if funk
        ((cdr funk))
        (void))))
(define control-scheme%
  ;object for storing control-schemes which are used to interact with the game
  (class object%
    (super-new)
    (init-field [control-lst '()])
    (define/public (get-keyandfunk key)
      ;takes as argument a key on the keyboard
      ;returns a pair consisting of the key and the function bound to that key
      ;if the key is bound to a function otherwise it returns #f
      (assoc key control-lst))
    (define/public (add-key key funk)
      ;takes as arguments a key on the keyboard and a function
      ;it then adds these as a pair to the control-scheme object
      ;thus binding the key to the function for use in the game
      (set! control-lst (cons (cons key funk) control-lst)))))
    

