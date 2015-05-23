#lang racket
(provide (all-defined-out))
(define (key-handler key control-scheme)
  (let ((funk (assoc key control-scheme)))
    (if funk
        ((cdr funk))
        (void))))

(define (make-control-scheme keys funks)
  (if (or (null? keys) (null? funks))
      '()
      (cons (cons (car keys) (car funks)) (make-control-scheme (cdr keys) (cdr funks) ))))

