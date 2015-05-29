#lang racket
(require racket/file)

;under development, ignore this for the moment

(define (eval-text-file path)
        (eval
         (read
          (open-input-string
           (string-append "(begin \n" (file->string path) ")")))))
          
          
         