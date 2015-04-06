#lang racket
(define char%
  (class object%
    (init-field (message "leave me alone"))
    (define/public (talk)
      (display message))
    (super-new)))