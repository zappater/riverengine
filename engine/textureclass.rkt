#lang racket
(require "granpaclass.rkt")
(provide (all-defined-out))

(define texture%
  ;basic class for textures
  ;as an act can contain hundreds of the same texture moving them could cause a lot of problems
  ;as the texture can also be in several places at the same time it should not know its position
  ;cause it can have a few hundred positions at the same time
  ;the only point of this class is to make a granpa% that does not have any idea about where it is and cannot be moved
  (class granpa%
    (super-new)   
    (define/override (my-pos)
      #f)
    (define/override (set-pos! new-pos obj)
      (void))
    (define/override (move-me position)
      (void))))

