#lang racket
(define act%
  (class object%
    (super-new)
    (init-field [type 'game-act]
                [levels '()])
    (define/public