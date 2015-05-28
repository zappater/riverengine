#lang racket
(require racket/file)

;creates the racket code for definitions being stored in new_define_struckture.txt which are to be copied to a proper racket source file (.rkt)
;note, struckture is a typo but it is not worth the time to fix it

;How to
;make sure all textures to be added to a source file is named according to <texturepack name> (<number>).png
;where <texturepack name> is the name of the texturepack and <number> is its number in the series.

(define (make-texture-define-structure filename number)
  ;takes as arguments a filename as a string
  ;and a number which should be the number of textures to be added to a source file
  ;the function will produce a file called new_define_struckture.txt with all texture definitions which can then be used in a source file
  (display-to-file "; New textures \n" "new_define_struckture.txt" #:exists 'replace)
  (display-to-file "; Adding textures \n" "new_add_texture_struckture.txt" #:exists 'replace)
  (define (make-define-structure filename number)
    ;this function exists to make sure the two first lines of code in make-texture-define-structure is only run once
    (if (<= number 0)
        (void)
        (begin (display-to-file (string-append
                                 "(define "
                                 filename
                                 (number->string number)
                                 " (new texture% \n [texture (read-bitmap ")
                                "new_define_struckture.txt" 
                                #:exists 'append) 
               (write-to-file (string-append
                               filename
                               " ("
                               (number->string number)
                               ").png")
                              "new_define_struckture.txt" 
                              #:exists 'append)
               (display-to-file ")] \n [name " "new_define_struckture.txt" #:exists 'append) 
               (write-to-file (string-append
                               filename
                               (number->string number))
                              "new_define_struckture.txt" 
                              #:exists 'append)
               (display-to-file "])) \n" "new_define_struckture.txt" #:exists 'append)
               (display-to-file (string-append
                                 "(send texture-handler add-texture "
                                 filename
                                 (number->string number)
                                 ") \n")
                                "new_add_texture_struckture.txt" 
                                #:exists 'append)
               (make-define-structure filename (- number 1)))))
  (make-define-structure filename number))