#lang racket
(define Game_name "example")
(require compatibility/mlist)
(require racket/gui/base)
(require "actclass.rkt")
(require "granpaclass.rkt")
(require "leveldatastructure.rkt")
(require "supportfunctions.rkt")
(require "globals.rkt")

;;DEBUG
(define viewsize (cons 10 15))
(define state 0)
(define game #t)
(define lvl-1 (make-new-level 40 40))
(define lvl-2 (make-new-level 40 40))
(define bluetexture (new granpa%
                         [texture (read-bitmap
                                   "testtexture1.png")
                                  ]))
(define (fill-level lvl obj pos)
  (if (< (car pos) 41)
      (begin
        (fill-level-row lvl obj pos)
      (fill-level lvl obj (cons (+ (car pos) 1) (cdr pos))))
      (void)))
  
(define (fill-level-row level obj pos)
      (if (< (cdr pos) 41)
      (begin
        (display pos)
        (fill-level-row level obj (cons (car pos) (+ 1 (cdr pos))))
        (level-set-object-at-pos! level (list (car pos) (cdr pos)) obj))
      (void)))
(fill-level lvl-1 bluetexture (cons 1 1))
(define test-act
  (new act% 
       [levels (mlist lvl-1 lvl-2)]
       [name "test-act"]))
(transition test-act)

(define camera-obj (new granpa%
                        [texture (read-bitmap "ydot.png")]))
(send camera-obj move-me (list 2 1 1))
(display (send camera-obj my-pos))
;;END DEBUG
;; tick!: -> void
(define (tick!)
  (set! state (add1 state))
  (send MAIN-CANVAS refresh))



(define (paint! a-canvas dc)
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
                  (display ypos)
                  (display "\n")
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
        
                
                
   (define (paint-ui-act! ui)
     (void))
  ;;kommit hit     
  (if game
      (begin
      (paint-act! *current-act*)
      (paint-ui-act! *curent-ui*))
      void))



(define MAIN-FRAME (new (class frame%
                          (super-new)
                          (define/augment (on-close)
                            (custodian-shutdown-all (current-custodian))))
                        [width (* 50 (cdr viewsize))]
                        [height (* 50 (car viewsize))]
                        [label Game_name]))



(define MAIN-CANVAS (new (class canvas%
                           (super-new)
                           
                           
                           )[parent MAIN-FRAME]
                            [paint-callback paint!]))


(send MAIN-FRAME show #t)


(define MAIN-TIMER (new timer% 
                        [notify-callback tick!]
                        [interval 1000]))

      
     
        
;;Palla länka vid felsökning !!tas bort efter länkning!!




