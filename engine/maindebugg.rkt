#lang racket
(require "actclass.rkt")
(require "charclass.rkt")
(require "globals.rkt")
(require "leveldatastructure.rkt")
(require "granpaclass.rkt")
(require "PCclass.rkt")
(require compatibility/mlist)



;test
(define test-level (make-new-level 6 5))
(define test-level2 (make-new-level 6 5))
(level-set-object-at-pos! test-level (list 6 5) 'hej)
(define mamma
  (new granpa%
       [name "mamma"])) 
(define test-act
  (new act% 
       [levels (mlist test-level test-level2)]
       [name "test-act"]))
(transition test-act) ;ändrar *current-act* till test-act
(send *current-act* move-obj mamma #f '(1 1 1)) ;ändrar mammas position till (1 1 1) från #f

(send mamma set-pos! '(2 2 2) *current-act*) ;ska inte resultera i något då acten har en annan position
(define pappa
  (new char%
       [name "pappa"]
       [use "hej"]))

(define dig
  (new PC%
       [name "J"]
       [facing 'down]))
(send dig move-me '(2 1 1))
(send pappa move-me '(2 2 1))