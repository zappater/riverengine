#lang racket/load
(define Game_name "The Riverengine act texture editor")
(require compatibility/mlist)
(require racket/gui/base)
(require "actclass.rkt")
(require "granpaclass.rkt")
(require "leveldatastructure.rkt")
(require "supportfunctions.rkt")
(require "globals.rkt")
(require "UIdefines.rkt")
(require "key-handler.rkt")
(require "textureclass.rkt")
(require "charclass.rkt")
(require racket/file)

;;Init

(define texture-handle% ;;hanterar vilken textur som skall läggas till i acten och i vilket lager den skall läggas till 
  (class object%
    (super-new)
    (init-field
     [texture-list '()] 
     [current-number 1]
     [current-layer 1])
    (define/public (get-active)
      (cdr (assoc current-number texture-list)))
    (define/public (add-texture texture-obj)
      (set! texture-list (cons (cons (+ (length texture-list) 1) texture-obj) texture-list)))
    (define/public (add-num)
      (if (<= (length texture-list) current-number)
          (set! current-number 1)
          (set! current-numner (+ current-number 1))))
    (define/public (sub-num)
      (if (<= current-number 1)
          (set! current-number (length texture-list))
          (set! current-numner (- current-number 1))))
    (define/public (get-layer)
      current-layer)
    (define/public (add-layer)
      (let ((numlvls (mlength (send *current-act* get-levels)))) 
        (if (<= numlvls current-layer)
            (set! current-layer 1)
            (set! current-layer (+ current-layer 1)))))
    (define/public (sub-layer)
      (let ((numlvls (mlength (send *current-act* get-levels)))) 
        (if (<= current-layer 1)
            (set! current-layer numlvls)
            (set! current-layer (- current-layer 1)))))))

(define texture-handler (new texture-handle%))                   
(define defulttexture (new texture%
                           [texture (read-bitmap "testtexture1.png")]
                           [name "defulttexture"]))
(send texture-handler add-texture defulttexture)
(define *scale* 1)
(define game #t)
(define camera-obj
  (new (class char%
         (super-new))))
(define viewsize (cons 10 10))
(define test-ui
  (new UI%
       [uipanels (list )]))
(change-ui test-ui)
(define creators-control-scheme (new control-scheme%))
(send creators-control-scheme add-key 'up (lambda () (begin (send camera-obj walk 'up) (send camera-obj inc-pos))))
(send creators-control-scheme add-key 'down (lambda () (begin (send camera-obj walk 'down) (send camera-obj inc-pos))))
(send creators-control-scheme add-key 'right (lambda () (begin (send camera-obj walk 'left) (send camera-obj inc-pos))))
(send creators-control-scheme add-key 'left (lambda () (begin (send camera-obj walk 'right) (send camera-obj inc-pos))))
(send creators-control-scheme add-key #\q (lambda () (send texture-handler add-num)))
(send creators-control-scheme add-key #\a (lambda () (send texture-handler sub-num)))
(send creators-control-scheme add-key #\w (lambda () (send texture-handler add-layer)))
(send creators-control-scheme add-key #\s (lambda () (send texture-handler sub-layer)))
(change-control-scheme creators-control-scheme)
;;End Init
;;Definitions

(define (make-new-act-in-temp number-of-levels lvlysize lvlxsize act-name-str)
  (define (build-lvl-define-str nlvl lvly lvlx [str1 ""] [str2 " '())"])
    (if (<= nlvl 0)
        (string-append str1 " \n (define *lvl-list* " str2)
        (begin
          (build-lvl-define-str (- nlvl 1) lvly lvlx
                                (string-append str1 " \n " "(define lvl" (number->string nlvl) " (make-new-level "  (number->string lvly) " " (number->string lvlx) "))")
                                (string-append " (mcons lvl" (number->string nlvl) " " str2 ")"))))) 
  
  (display-to-file (string-append (build-lvl-define-str number-of-levels lvlysize lvlxsize) 
                                  "\n (define " 
                                  act-name-str
                                  " (new act% [levels *lvl-list*]))) \n (transition "
                                  act-name-str
                                  ") \n  ") 
                   "rename_to_save.txt"
                   #:exists 'replace))

(define ns (current-namespace))
(define (eval-text-file path)
  (eval
   (read
    (open-input-string
     (string-append "(begin \n" (file->string path) ")"))) ns ))
(define (mouse-handler mouse-event)
  (let ((x-cord (send mouse-event get-x))
        (y-cord (send mouse-event get-y))
        (camera-pos (cons (second (send camera-obj my-pos)) (third (send camera-obj my-pos)))))
    (if camera-pos
        (let ((pos (list (+ (- (car camera-pos) (/ (car viewsize) 2)) (round (/ (- y-cord 25) 50))) (+ (- (cdr camera-pos) (/  (cdr viewsize) 2))  (round (/  (- x-cord 25) 50))))))
          (if (send mouse-event button-down? 'left)
              (begin
                ;;(display pos)
                (send *current-act* add-texture-obj (cons (send texture-handler get-layer) pos) (send texture-handler get-active))
                (display-to-file "(send *current-act* add-texture-obj '" "rename_to_save.txt" #:exists 'append)
                (display-to-file (cons (send texture-handler get-layer) pos) "rename_to_save.txt" #:exists 'append)
                (display-to-file "  " "rename_to_save.txt" #:exists 'append)
                (display-to-file (send (send texture-handler get-active) get-name) "rename_to_save.txt" #:exists 'append)
                (display-to-file " ) \n " "rename_to_save.txt" #:exists 'append))
              (if (send mouse-event button-down? 'right)
                  (begin
                    (send *current-act* remove-texture-obj (cons (send texture-handler get-layer) pos))
                    (display-to-file "(send *current-act* remove-texture-obj '" "rename_to_save.txt" #:exists 'append)
                    (display-to-file (cons (send texture-handler get-layer) pos) "rename_to_save.txt" #:exists 'append)
                    (display-to-file ") \n  " "rename_to_save.txt" #:exists 'append))
                  (void))))
        (void))))

;;End definitions
;;SETUP
(eval-text-file "new_act_parameters.txt")
(eval-text-file "rename_to_save.txt")
(transition act-name)
(send camera-obj move-me (list 10 (/ 50 2) (/ 50 2)))
(display (send camera-obj my-pos))
;;END SETUP  
;; tick!: -> void
(define (tick!)
  (send MAIN-CANVAS refresh))



(define (paint! a-canvas dc)
  (send dc scale *scale* *scale*)
  (send dc set-background (make-object color% 0 0 0))
  (send dc clear)
  
  (define (paint-act! act)
    (draw-enteties (send act get-levels) (cons (second (send camera-obj my-pos)) (third (send camera-obj my-pos))))
    
    )
  
  (define (draw-level level camera-pos drawpos ypos)
    (if (null? level)
        (void)
        (if (<= (abs (- (car camera-pos) ypos)) (round (/ (car viewsize) 2)))
            (begin
              ;;(display camera-pos)
              ;;(display ypos)
              ;;(display "\n")
              (draw-row (mcar level) (cdr camera-pos) drawpos 1)
              (draw-level (mcdr level) camera-pos (cons (+ (car drawpos) 1) (cdr drawpos)) (+ ypos 1)))
            (draw-level (mcdr level) camera-pos drawpos (+ ypos  1)))))
  
  (define (draw-row row cameraxpos drawpos xpos)
    (if (null? row)
        (void)
        (cond
          ((< xpos (- cameraxpos (round (/ (cdr viewsize) 2))))  (draw-row (mcdr row) cameraxpos drawpos (+ xpos  1)))
          ((> xpos  (+ cameraxpos (round (/ (cdr viewsize) 2)))) (void))
          (else
           (begin
             ;;(display xpos)
             (let ((obj (mcar (mcar row))))
               (if (null? obj)
                   (void)
                   (if (send obj get-current-texture)
                       (begin
                         (send dc draw-bitmap (send obj get-current-texture) (* 50 (cdr drawpos)) (* 50 (car drawpos)))
                         ;;(display drawpos)
                         )
                       (void))))
             (draw-row (mcdr row) cameraxpos (cons (car drawpos) (+ 1 (cdr drawpos))) (+ xpos  1)))))))
  (define (draw-enteties structure camera-pos)
    (if (null? structure)
        (void)
        (begin
          (draw-level (mcar structure) camera-pos (cons 0 0) 1)
          (draw-enteties (mcdr structure) camera-pos))))    
  
  
  
  (define paint-ui-act!
    (lambda (ui windowsize)      
      (define (Draw-panel-help obj size) ;;ritar ut panel eller grupp med ett ankar som 0,0
        (if (send obj group?)
            (paint-ui-act! obj size)
            (let ((texture (send obj get-texture))
                  (text (send obj get-text)))
              (begin
                (if texture
                    (send dc draw-bitmap texture 0 0)
                    (void))
                (if text
                    (send dc draw-text text 0 0) 
                    (void))))))
      (define Draw-panel
        (lambda (obj)
          ;;Ränka ut ankar positioner
          (let ((size (send obj get-size))
                (offset (send obj get-offset))
                (anchor (send obj get-anchor)))
            ;;(display (- (+ (- (/ (car windowsize) 2)) (round (/ (car size) 2))) (car offset)))
            ;;(display "    ")
            ;;(display (+ (- (/ (car windowsize) 2) (round (/ (car size) 2))) (car offset)))
            ;;(display "\n")
            (cond
              ((eq? anchor 'topleft) (Draw-panel-help obj size))
              ((eq? anchor 'topcenter)
               (send dc translate (+ (- (/ (car windowsize) 2) (round (/ (car size) 2))) (car offset)) (cdr offset))
               (Draw-panel-help obj size)
               (send dc translate (- (+ (- (/ (car windowsize) 2) (round (/ (car size) 2))) (car offset))) (- (cdr offset))))
              ((eq? anchor 'topright) 
               (send dc translate (+ (- (car windowsize) (car size)) (car offset)) (cdr offset))
               (Draw-panel-help obj size)
               (send dc translate (- (+ (- (car windowsize) (car size)) (car offset))) (- (cdr offset))))
              ((eq? anchor 'centerleft)
               (send dc translate (car offset) (+ (- (/ (cdr windowsize) 2) (round (/ (cdr size) 2))) (cdr offset)))
               (Draw-panel-help obj size)
               (send dc translate (- (car offset)) (- (+ (- (/ (cdr windowsize) 2) (round (/ (cdr size) 2))) (cdr offset)))))
              ((eq? anchor 'centercenter)
               (send dc translate (+ (- (/ (car windowsize) 2) (round (/ (car size) 2))) (car offset))  (+ (- (/ (cdr windowsize) 2) (round (/ (cdr size) 2))) (cdr offset)))
               (Draw-panel-help obj size)
               (send dc translate (- (+ (- (/ (car windowsize) 2) (round (/ (car size) 2))) (car offset)))  (- (+ (- (/ (cdr windowsize) 2) (round (/ (cdr size) 2))) (cdr offset)))))
              ((eq? anchor 'centerright)
               (send dc translate (+ (- (car windowsize) (car size)) (car offset)) (+ (- (/ (cdr windowsize) 2) (round (/ (cdr size) 2))) (cdr offset)))
               (Draw-panel-help obj size)
               (send dc translate (- (+ (- (car windowsize) (car size)) (car offset))) (- (+ (- (/ (cdr windowsize) 2) (round (/ (cdr size) 2))) (cdr offset)))))
              ((eq? anchor 'bottomleft)
               (send dc translate (car offset) (+ (- (cdr windowsize) (cdr size)) (cdr offset)))
               (Draw-panel-help obj size)
               (send dc translate (- (car offset)) (- (+ (- (cdr windowsize) (cdr size)) (cdr offset)))))
              ((eq? anchor 'bottomcenter) 
               (send dc translate (+ (- (/ (car windowsize) 2) (round (/ (car size) 2))) (car offset)) (+ (- (cdr windowsize) (cdr size)) (cdr offset)))
               (Draw-panel-help obj size)
               (send dc translate (- (+ (- (/ (car windowsize) 2) (round (/ (car size) 2))) (car offset))) (- (+ (- (cdr windowsize) (cdr size)) (cdr offset)))))
              ((eq? anchor 'bottomright)
               (send dc translate (+ (- (car windowsize) (car size)) (car offset)) (+ (- (cdr windowsize) (cdr size)) (cdr offset)))
               (Draw-panel-help obj size)
               (send dc translate (- (+ (- (car windowsize) (car size)) (car offset))) (- (+ (- (cdr windowsize) (cdr size)) (cdr offset)))))
              (else
               (error obj "has an invaild anchor"))))))
      ;;Slut på ankar postionerna          
      (for-each Draw-panel (send ui get-uipanels))))
  
  ;;kommit hit     
  (if game
      (begin
        (paint-act! *current-act*)
        (paint-ui-act! *current-ui* 
                       (cons (* 50 *scale* (cdr viewsize)) (* 50 *scale* (car viewsize))))) ;viewsize bestämmer antal tiles rutan är
      void)
  (send dc scale (/ 1 *scale*) (/ 1 *scale*)))



(define MAIN-FRAME (new (class frame%
                          (super-new)
                          (define/augment (on-close)
                            (custodian-shutdown-all (current-custodian))))
                        [width (* 50 *scale* (cdr viewsize))]
                        [height (* 50 *scale* (car viewsize))]
                        [label Game_name]))


(define game-canvas%
  (class canvas%
    (super-new)
    (init-field
     [key-handler-l key-handler]
     )
    (define/override (on-char key-event)
      (begin
       ;;(write (send key-event get-key-code))
      (key-handler-l (send key-event get-key-code) *control-scheme*)))
    (define/override (on-event mouse-event)
      (mouse-handler mouse-event))))

(define MAIN-CANVAS (new (class game-canvas%
                           (super-new)
                           )[parent MAIN-FRAME]
                            [paint-callback paint!]))


(send MAIN-FRAME show #t)


(define MAIN-TIMER (new timer% 
                        [notify-callback tick!]
                        [interval 16]))
