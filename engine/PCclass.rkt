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
    (inherit move-me)
    (inherit my-pos) ;kolla upp mutliple inheritance
    (inherit inc-pos)
    (define/override (interact)
      (let ((char (get-character)))
        (if (null? char)
            void
            (send char interact))))
    (define/private (get-character)
      (send *current-act* get-obj-at-pos (inc-pos)))
    (define/override (walk dir)
      (if (eq? dir facing)
          (move-me (inc-pos))
          (set! facing dir)))))

