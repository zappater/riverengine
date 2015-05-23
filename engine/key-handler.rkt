#lang racket
(provide (all-defined-out))
(define (key-handler key control-scheme)
  (let ((funk (send control-scheme get-keyandfunk key)))
    (if funk
        ((cdr funk))
        (void))))

(define control-scheme%
  (class object%
    (super-new)
    (init-field
    [control-lst '()])
    (define/public (get-keyandfunk key)
      (assoc key control-lst))
    (define/public (add-key key funk)
      (set! control-lst (cons (cons key funk) control-lst)))))
    

