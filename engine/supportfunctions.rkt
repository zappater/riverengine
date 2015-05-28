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