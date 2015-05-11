#lang racket
(require "granpaclass.rkt")
(require "supportfunctions.rkt")
(require "globals.rkt")
(provide (all-defined-out))

(define char%
  (class granpa%
    (super-new)
    (init-field [hp 100]
                [description "common existance"]
                [inventory #f]
                [use (void)]
                [facing 'up]) ;riktningar är up, down, right left
    (inherit-field position)
    (inherit move-me)
    (inherit my-pos)
    (define/public (walk direction)
      (let ((at (my-pos)))
        (cond ((false? at) (void))
              ((eq? direction 'up) (move-me (list (lvl-cor at) (- (y-cor at) 1) (x-cor at))))
              ((eq? direction 'down) (move-me (list (lvl-cor at) (+ (y-cor at) 1) (x-cor at))))
              ((eq? direction 'left) (move-me (list (lvl-cor at) (y-cor at) (+ (x-cor at) 1))))
              ((eq? direction 'right) (move-me (list (lvl-cor at) (y-cor at) (- (x-cor at) 1))))
              (else (void))))
      (set! facing direction))
    (define/public (get-description)
      description)
    (define/public (get-hp)
      hp)
    (define/public (change-hp modifier)   
      (set! hp (+ hp modifier))
      (if (alive?)
          (void)
          (send *current-act* remove-obj this (my-pos))))
    (define/private (alive?)
      (> hp 0))
    (define/override (interact)
      (if (or (false? position) (not (alive?))) ;om död skall inte kunna göra något
          (void)
          use)))) ;men om vid liv kör funktion specificerat i field use om inte override har använts i klassen