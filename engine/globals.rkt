#lang racket
(provide (all-defined-out))

(define *control-scheme* #f)
(define *current-act* #f)
(define *current-ui* #f)
(define *current-PC* #f)

#| Nedan är menat att ersätta all annan kod i denna fil.
På det här sättet går vi från några identiska globaler med identiska hjälpfunktioner till
några få objekt som fungerar exakt lika.
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


(define (transition destination) ;enkel implementering för tillfället
  (set! *current-act* destination)) ;så vi kan testa koden

(define (change-ui new-ui) ;enkel implementering för tillfället
  (set! *current-ui* new-ui)) ;så vi kan testa koden

(define (change-control-scheme new-ctlse) ;enkel implementering för tillfället
  (set! *control-scheme* new-ctlse)) ;så vi kan testa koden

