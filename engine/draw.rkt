#lang racket
(define Game_name "example")

(require racket/gui/base)


(define viewsize (cons 10 15))
(define state 0)


;; tick!: -> void
(define (tick!)
  (set! state (add1 state))
  (send MAIN-CANVAS refresh))



(define (paint! a-canvas dc)
  (send dc set-background (make-object color% 0 0 0))
  (send dc clear)
  
  (define (paint-act! act camera-pos)
    (draw-enteties (send act get-levels) (send camera-obj my-pos))
    (define (draw-entetises stucture)
      (define (draw-level level camera-pos drawpos ypos)
        (define (draw-row row cameraxpos drawpos xpos)
          (if (null? row)
              (void)
              (cond
                ((xpos < (round (/ (car veiwsize) 2)))  (draw-row (cdr row) cameraxpos drawpos (+ xpos  1)))
                ((xpos > (round (/ (car veiwsize) 2))) (void))
                (else
                 (begin
                   ((let obj (car (car row)))
                    (if (null? obj)
                        (void)
                        (send dc drawbitmap (send obj get-currunet-texture) (* 50 (cdr drawpos)) (* 50 (car drawpos))))
                    (draw-row (cdr row) cameraxpos (cons (car drawpos) (+ 1 (cdr drawpos))) (+ xpos  1))))))))
        
        
        (if (null? level)
            (void)
            (if (<= (abs (- (car camera-pos) ypos)) (round (/ (car veiwsize) 2)))
                (begin
                  (draw-row (car level) (cdr camera-pos) drawpos 1)
                  (draw-level (cdr level) camera-pos (cons (+ (car drawpos) 1) (cdr drawpos)) (+ ypos 1)))
                (draw-level (cdr level) camera-pos drawpos (+ ypos  1))
                
                (if (null? stucture)
                    (void)
                    (begin
                      (draw-level (car structure) camera-pos (cons 0 0) 1)
                      (draw-enteties (cdr structure) camera-pos))))
            
  ;;kommit hit          ))))
  (if game
      (paint-act! *current-act*)



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
