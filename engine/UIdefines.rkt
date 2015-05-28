#lang racket
(provide (all-defined-out))

;why isn't insert and find-and-remove in supportfunctions.rkt? /Henrik
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

;why doesn't UIpanelgroup% inherit from UI%
;and UIpanel% inherit from UIpanelgroup% ??? /Henrik


(define UI%
  ;UI object, contains all UI data
  ;also includes basic functions for manipulating UI data
  ;a panel is....
  (class object%
    (super-new)
    (init-field [uipanels '()])
    (define/public (add-uipanel panel [pos 1])
      (set! uipanels (insert panel uipanels pos)))
    (define/public (remove-panel panel)
      ;removes a panel from uipanels
      (set! uipanels (find-and-remove panel uipanels)))
    (define/public (get-uipanels)
      ;lets UI% return its data
      uipanels)))

(define UIpanel%
  (class object%
    (super-new)
    (init-field [anchor 'topleft] ;anchors are topleft topcenter topright centerleft centercenter centerright bottomleft bottomcenter bottomright 
                [size (cons 0 0)]
                [offset (cons 0 0)]
                [texture #f]
                [text #f]
                [text-style #f]
                [button-effect (void)])
    (define/public (group?)
      #f)
    (define/public (get-anchor)
      anchor)
    (define/public (get-offset)
      offset)
    (define/public (get-size)
      size)
    (define/public (get-texture)
      texture)
    (define/public (get-text)
      text)
    (define/public (set-text! string)
      (set! text string))
    (define/public (set-texture! new-texture)
      (set! texture new-texture))))

(define UIpanelgroup%
  (class object%
    (super-new)
    (init-field [uipanels '()]
                [anchor 'topleft]
                [offset (cons 0 0)]
                [size (cons 0 0)])
    (define/public (group?)
      #t)
    (define/public (get-offset)
      offset)
    (define/public (get-anchor)
      anchor)
    (define/public (get-size)
      size)
    (define/public (add-uipanel panel [pos 1])
      (set! uipanels (insert panel uipanels pos)))
    (define/public (remove-panel panel)
      (set! uipanels (find-and-remove panel uipanels)))
    (define/public (get-uipanels)
      uipanels)))

