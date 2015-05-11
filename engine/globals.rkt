#lang racket
(provide (all-defined-out))

(define *current-act* #f)

(define (transition destination) ;enkel implementering för tillfället
  (set! *current-act* destination)) ;så vi kan testa koden
