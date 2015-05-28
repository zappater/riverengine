#lang racket
(require "granpaclass.rkt")
(require "supportfunctions.rkt")
(require "globals.rkt")
(provide (all-defined-out))

(define texture%
  (class granpa%
     (super-new)
    (init-field)    
    (define/override (my-pos)
      #f)
    (define/override (set-pos! new-pos obj)
      (void))))
    
 
    

      