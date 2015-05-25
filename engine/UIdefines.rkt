#lang racket
(provide (all-defined-out))
(define (Insert ele lst pos)
  (if (<= pos 1)
      (cons ele lst)
      (cons (car lst) (Insert ele (cdr lst) (- pos 1)))))
(define (Find-and-remove ele lst)
  (if (null? lst)
      '()
      (if (eq? ele (car lst))
          (cdr lst)
          (cons (car lst) (Find-and-remove ele (cdr lst))))))

(define UI%
  (class object%
    (super-new)
    (init-field
     [uipanels '()])
    (define/public (add-uipanel panel [pos 1])
      (set! uipanels (Insert panel uipanels pos)))
    (define/public (remove-panel panel)
      (set! uipanels (Find-and-remove panel uipanels)))
    (define/public (get-uipanels)
      uipanels)))

(define UIpanel%
  (class object%
    (super-new)
    (init-field
     [anchor 'topleft] ;;anchor are topleft topcneter topright centerleft centercenter centerright bottomleft bottomcenter bottomright 
     [size (cons 0 0)]
     [offset (cons 0 0)]
     [texture #f]
     [text #f]
     [text-style #f]
     [button-effect (void)]
     )
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
    (define/public (set-text! strin)
      (set! text strin))
    (define/public (set-texture! new-texture)
      (set! texture new-texture))))

(define UIpanelgroup%
  (class object%
    (super-new)
    (init-field
     [uipanels '()]
     [anchor 'topleft]
     [offset (cons 0 0)]
     [size (cons 0 0)]
     )
    (define/public (group?)
      #t)
    (define/public (get-offset)
      offset)
    (define/public (get-anchor)
      anchor)
    (define/public (get-size)
      size)
    (define/public (add-uipanel panel [pos 1])
      (set! uipanels (Insert panel uipanels pos)))
    (define/public (remove-panel panel)
      (set! uipanels (Find-and-remove panel uipanels)))
    (define/public (get-uipanels)
      uipanels)))

