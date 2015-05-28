#lang racket
(provide (all-defined-out))

#|
these exist because we want to make sure functions always uses functions in the correct object
for example, objects should only interact with the current act, they should never call another act unless for some reason
the game maker wants an object to change a very specific thing in another specified act at a specific time

*current-act* and *current-ui* is also used for drawing on the screen
*control-scheme* allows us to implement the possibility of changing the control-scheme while playing a game
*current-PC* is needed when we want to move the player character from one act to another, but it will also allow us to have a world
with several player characters while controlling which is currently in use
|#
(define *control-scheme* #f)
(define *current-act* #f)
(define *current-ui* #f)
(define *current-PC* #f)

;these are used for changing the values of the global variabels above
;racket won't allow us to change it in another way such as simply using set! in a function in a class
(define (change-control-scheme new-ctlse)
  (set! *control-scheme* new-ctlse)) 
(define (transition destination) 
  (set! *current-act* destination)) 
(define (change-ui new-ui) 
  (set! *current-ui* new-ui)) 
(define (change-PC new-PC) 
  (set! *current-PC* new-PC)) 

#|
Below is ment to replace all other code in this file
In this way we will go from some identical global variabels with identical helpfunctions
to a few objects.
It is currently not used because then we need to change a lot in our game demo and we do not have the time.
(define in-use%
  (class object%
    (init-field [object #f])
    (define/public (change-me new-me)
      (set! object new-me))
    (define/public (get-obj)
      object)))
(define current-scheme
  (new in-use%
       [object #f]))
(define current-act
  (new in-use%
       [object #f]))
(define current-ui
  (new in-use%
       [object #f]))
(define current-PC
  (new in-use%
       [object #f]))
|#