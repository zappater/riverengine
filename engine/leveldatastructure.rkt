#lang racket
(require "supportfunctions.rkt")
(require compatibility/mlist)
(define (make-new-level y-dim x-dim) 
  ;Retrunerar en blank level med storleken x-dim x x-dim
  ;ges som (make-new-level y-dim x-dim) ex (make-new-level 5 7)
  
  (define create-x-list 
    (lambda (ycord xdim reslist)
      (if (= 0 xdim)
          reslist
          (create-x-list ycord (- xdim 1) (mcons (mcons '() (list ycord xdim)) reslist)))))
  ;Retunerar en mlista av längden xdim där varje elemnt bsetar av ett par av formen ('() . (ycord "postion i listan")).  
  
  (define create-y-list 
    (lambda (ydim xdim reslist)
      (if (= 0 ydim)
          reslist
          (create-y-list (- ydim 1) xdim (mcons (create-x-list ydim xdim '()) reslist)))))
  (create-y-list y-dim x-dim '()))
;Bygger en lista utav flera create-x-list, ycord ges av postionen i listan.

(define level-set-object-at-pos! 
  (lambda (lvl pos obj)
    (if (or (<= (car pos) 0) (<= (car (cdr pos)) 0))
        (error "coordinates for level-set-object-at-pos! need to be at least 1,1")
        (set-mcar! (mnth (car (cdr pos)) (mnth (car pos) lvl)) obj))))

(define level-get-val-from-pos
  (lambda (lvl pos)
    (mcar (mnth (car (cdr pos))
                (mnth (car pos) lvl)))))

(define level-clear-pos! 
  (lambda (lvl pos)
    (level-set-object-at-pos! lvl pos '())))

(define level-find-obj
  (lambda (level obj)
        (if (null? level)
            #f
            (let ((pos (mcdr (massoc (mcar level) obj))))
              (if pos ;om positionen existerar så är den sann
                  pos ;i så fall returnerar vi positonen
                  ;annars går vi vidare i listan
                  (level-find-obj (mcdr level)
                                       obj))))))



;test
(define test-level (make-new-level 6 5))
(level-set-object-at-pos! test-level (list 6 5) 'hej)
