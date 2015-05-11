#lang racket
(require "charclass.rkt")
(require "actclass.rkt")
(require "globals.rkt")
(provide (all-defined-out))

(define PC%
  (class char%
    (super-new)
    (init-field [equipment #f]
                [stats #f])
    (inherit-field name)
    (inherit-field facing)
    (inherit my-pos) ;kolla upp mutliple inheritance
    (inherit inc-pos)
    (define/override (interact)
      (send (get-character) interact))
    (define/private (get-character)
      (send *current-act* get-obj-at-pos (inc-pos)))))
