#lang racket
(require racket/file)
;;skapar rcket koden för många definitioner lagras i filen new_define_struckture.txt för att konna kopieras till ett rkt fil.
;;Guide
;;byt namn på alla texturaerna till texturepack (nummer).png texturepack är namnet aoch nummret är identifickation.
;;(görs lämpligt genom att markera all filerna och byta namn på en i widows så batch byts namnen ut till formatet åvan):
;;kör funktionen med filename som texturepack och nummer som antalet texturer.
;;kopiera resultatet från new_define_struckture.txt och 
(define (make-texture-define-structure filename number)
  (display-to-file ";; New textures \n" "new_define_struckture.txt" #:exists 'replace)
  (display-to-file ";; Adding textures \n" "new_add_texture_struckture.txt" #:exists 'replace)
  (define (make-define-structure filename number)
    (if (<= number 0)
        (void)
        (begin (display-to-file 
                (string-append
                 "(define "
                 filename
                 (number->string number)
                 " (new texture% \n [texture (read-bitmap ")
                "new_define_struckture.txt" 
                #:exists 'append) 
               
               (write-to-file 
                (string-append
                 filename
                 " ("
                 (number->string number)
                 ").png")
                "new_define_struckture.txt" 
                #:exists 'append)
               
               (display-to-file 
                ")] \n [name "
                "new_define_struckture.txt"
                #:exists 'append)
               
               (write-to-file 
                (string-append
                 filename
                 (number->string number))
                "new_define_struckture.txt" 
                #:exists 'append)
               
               (display-to-file 
                "])) \n"
                "new_define_struckture.txt"
                #:exists 'append)
               
               (display-to-file 
                (string-append
                 "(send texture-handler add-texture "
                 filename
                 (number->string number)
                 ") \n")
                "new_add_texture_struckture.txt" 
                #:exists 'append)
               (make-define-structure filename (- number 1)))))
  (make-define-structure filename number))