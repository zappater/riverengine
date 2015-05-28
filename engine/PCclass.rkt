#lang racket
(require "charclass.rkt")
(require "actclass.rkt")
(require "globals.rkt")
(provide (all-defined-out))

(define PC%
  (class char%
    (super-new)
    (init-field [equipment #f] ;preparation for future versions of the engine, currently not used
                [stats #f]) ;currently not used either
    (inherit-field name)
    (inherit-field facing)
    (inherit move-me)
    (inherit my-pos)
    (inherit inc-pos)
    (define/override (interact)
      ;differs from interact for all other characters in that it makes another object use its interact function
      ;void is not invoked as a function because in the current implementation the demo-game invokes the function returned by interact
      ;this is to avoid some bugs, might be changed in the future
      (let ((world-object (get-world-object)))
        (if (null? world-object)
            void
            (send world-object interact))))
    (define/private (get-world-object)
      ;returns the object which the character is facing
      (send *current-act* get-obj-at-pos (inc-pos)))
    (define/override (walk dir)
      ;compared to the implementation in character% this allows the person playing the game greater control of the character
      ;by making sure you can change direction your character is facing without moving
      ;it is however not wanted when scripting movement of an NPC as it makes it harder to implement a route
      (if (eq? dir facing)
          (move-me (inc-pos))
          (set! facing dir)))))

