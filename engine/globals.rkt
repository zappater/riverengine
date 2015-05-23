#lang racket
(provide (all-defined-out))

(define *control-scheme* #f)
(define *current-act* #f)
(define *current-ui* #f)
(define (transition destination) ;enkel implementering för tillfället
  (set! *current-act* destination)) ;så vi kan testa koden

(define (change-ui new-ui) ;enkel implementering för tillfället
  (set! *current-ui* new-ui)) ;så vi kan testa koden

(define (change-control-scheme new-ctlse) ;enkel implementering för tillfället
  (set! *control-scheme* new-ctlse)) ;så vi kan testa koden