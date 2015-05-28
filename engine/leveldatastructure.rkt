#lang racket
(provide (all-defined-out))
(require "supportfunctions.rkt")
(require compatibility/mlist)

#|
this implements the level datastructure for the game engine
a level is a two-dimensional matrix implemented as mlists
it is implemented as an mlist representing a column vector (or the y-coordinates) which in itself consists of mlists
these mlists represent all row vectors (or the x-coordinates)
the row vectors contains mpairs of the type (object . coordinate)
the coordinate variabel is a list as it needs to be immutabel (once a coordinate has been created it should never be changed)
however the objects within the mpair will be moved around a lot

the level datastructure is implemented using OOP philosophy
however it is not an object as we want the data to be accessibel as a mlist
|#

(define (make-new-level y-dim x-dim)
  ;returns an empty level of the size y-dim*x-dim
  ;y-dim and x-dim are positive integers
  (define create-x-list 
    ;returns an mlist of the length x-dim with every element being a mpair of the form ('() . (y-cor x-cor))
    ;this mlist is essentially the mutable equivalent to an associative list
    ;for the mpair to contain an empty list means there is no object currently occupying that position
    ;the later a mpair appears in the mlist the higher its x-coordinate
    (lambda (ycord xdim reslist)
      (if (= 0 xdim)
          reslist
          (create-x-list ycord (- xdim 1) (mcons (mcons '() (list ycord xdim)) reslist)))))  
  (define create-y-list 
    ;returns an mlist containing mlists created by the function create-x-list
    ;y-coordinate is given by the position in the list, with the first mlist having the y-cor 1
    ;the last mlist having the y-cor equal to y-dim
    (lambda (ydim xdim reslist)
      (if (= 0 ydim)
          reslist
          (create-y-list (- ydim 1) xdim (mcons (create-x-list ydim xdim '()) reslist)))))
  (create-y-list y-dim x-dim '()))

(define level-set-object-at-pos! 
  ;this function places an object within the level
  ;takes as arguments a level (a mlist created by the function make-new-level)
  ;a position (two dimensional list consisting of positive integers)
  ;(positions are different in levels as levels in themselves are two-dimensional and thus all positions within them are 2D as well)
  ;an object to be placed within the level
  (lambda (lvl pos obj)
    (if (or (<= (car pos) 0) (<= (car (cdr pos)) 0))
        (error "coordinates for level-set-object-at-pos! need to be at least 1,1")
        ;the line below is a bit cryptic, what happens is the following
        ;(mnth (car pos) lvl) returns the mlist representing the correct row vector
        ;(mnth (car (cdr pos)) ... ) returns the correct mpair within the row vector
        ;finally it changes the first atom in that mpair to whatever obj is
        (set-mcar! (mnth (car (cdr pos)) (mnth (car pos) lvl)) obj))))
(define level-get-val-from-pos
  ;returns the object at a given position within a level
  (lambda (lvl pos)
    (mcar ;returns the object within the mpair
     (mnth (car (cdr pos)) ;returns the correct mpair
                (mnth (car pos) lvl))))) ;returns the correct row vector
(define level-clear-pos! 
  ;removes an object from the level
  ;thus freeing up a space to be used by another object
  ;as arguments takes a level and a two-dimensional position (list of positive integers)
  (lambda (lvl pos)
    (level-set-object-at-pos! lvl pos '())))
(define level-find-obj
  ;takes as arguments a level and an object
  ;it then tries to find that object within the level by treating it as a mutable associative list
  (lambda (level obj)
        (if (null? level)
            #f
            (let ((pos (massoc obj (mcar level))))
              (if pos ;pos will be false if the object being looked for is not at that place, all other values will be true
                  (mcdr pos) ;if it exists we return the position of the object
                  (level-find-obj (mcdr level) ;otherwise we simply continue looking through the level until the level is empty
                                       obj))))))




