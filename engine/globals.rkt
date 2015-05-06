#lang racket
(provide (all-defined-out))

(define *current-act* #f)

#| (define (change-act to)
  (if (transition? to) 
      ;transition? måste skapas, uppgift att kolla om en övergång finns mellan *current-act* och den spelaren vill till
      (set! *current-act* to)
      (error "you can't go there"))) |#
