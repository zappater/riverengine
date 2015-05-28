#lang racket
(require racket/file)

(define (eval-text-file path)
        (eval
         (read
          (open-input-string
           (string-append "(begin \n" (file->string path) ")")))))
          
          
         