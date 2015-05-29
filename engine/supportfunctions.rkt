#lang racket
(provide (all-defined-out))

;for some reason these functions don't seem to exist in Racket
;they simply return the nth atom in a list and mlist respectively
;no matter what it is, a function or a symbol or something else
;the first argument is an integer and the second argument is a list and mlist respectively

;if the integer is greater than the length of the list or mlist the functions will crash,
;they do not return an empty list as this might cause bugs in the rest of the engine which can be hard to discover
(define nth (lambda (pos lst)
              (if (<= pos 1)
                  (car lst)
                  (nth (- pos 1) (cdr lst)))))
(define mnth (lambda (pos lst)
              (if (<= pos 1)
                  (mcar lst)
                  (mnth (- pos 1) (mcdr lst)))))
(define nth-or-last
  ;unlike the nth in supportfunctions.rkt this function always returns something
  ;even if the position is greater than the length of the list
  ;in this case it returns the last element in the list
  (lambda (pos lst)
    (if (null? (cdr lst))
        (car lst)
        (if (<= pos 1)
            (car lst)
            (nth-or-last (- pos 1) (cdr lst))))))
(define (insert ele lst pos)
  ;why do we have this function? certainly this must already exist in racket? /Henrik
  
  ;inserts an atom into a list at position pos
  ;takes as arguments ele which is an element to be inserted into a list
  ;lst is a list which to insert an element into
  ;pos is the position to insert the element into the list
  (if (<= pos 1)
      (cons ele lst)
      (cons (car lst) (insert ele (cdr lst) (- pos 1)))))
(define (find-and-remove ele lst)
  ;same here, doesn't this already exist in racket? /Henrik
  
  ;removes an atom from a list
  ;ele is the atom to be removed
  ;lst is the list from which it should be removed
  (if (null? lst)
      '()
      (if (eq? ele (car lst))
          (cdr lst)
          (cons (car lst) (find-and-remove ele (cdr lst))))))

#|
A position is defined as a coordinate in 3 dimensions implemented as a list
consisting only of positive integers (thus position (1,5 2,3 3,1) is invalid but (1 2 3) is valid.
The first coordinate indicates the level of the object, a real-world equivalent would be height.
The second coordinate indicates the y-coordinate of the object or the vertical position
note that this axis is inverted compared to a standard cartesian plane.
The third coordinate is the x-coordinate or the horizontal position.
The main objectives of these functions is to make the code readable.
|#
(define (lvl-cor pos)
  (first pos))
(define (y-cor pos)
  (second pos))
(define (x-cor pos)
  (third pos))
(define (valid-pos? position)
  ;ensures the position fulfills all critera to be a valid position 
  (and (list? position) 
       (eq? (length position) 3)
       (andmap integer? position) 
       (andmap positive? position)))