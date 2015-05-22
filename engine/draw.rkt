#lang racket
(define Game_name "example")
(require compatibility/mlist)
(require racket/gui/base)
(require "actclass.rkt")
(require "granpaclass.rkt")
(require "leveldatastructure.rkt")
(require "supportfunctions.rkt")
(require "globals.rkt")
(require "UIdefines.rkt")
;;DEBUG
(define *scale* 1)
(define viewsize (cons 10 10))
(define state 0)
(define game #t)
(define lvl-1 (make-new-level 40 40))
(define lvl-2 (make-new-level 40 40))
(define bluetexture (new granpa%
                         [texture (read-bitmap
                                   "Natural grass_001.png")
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
        ;;(display pos)
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
(send camera-obj move-me (list 2 30 6))
;;(display (send camera-obj my-pos))
(define testpanel1
  (new UIpanel%
  [size (cons 50 25)]
  [texture (read-bitmap "uitset.png")]))
(define testpanel2
  (new UIpanel%
       [anchor 'topcenter]
  [size (cons 50 25)]
  [texture (read-bitmap "uitset.png")]))
(define testpanel3
  (new UIpanel%
       [anchor 'topright]
  [size (cons 50 25)]
  [texture (read-bitmap "uitset.png")]))
(define testpanel4
  (new UIpanel%
       [anchor 'centerleft]
  [size (cons 50 25)]
  [texture (read-bitmap "uitset.png")]))
(define testpanel5
  (new UIpanel%
       [anchor 'centercenter]
  [size (cons 50 25)]
  [texture (read-bitmap "uitset.png")]))
(define testpanel6
  (new UIpanel%
       [anchor 'centerright]
  [size (cons 50 25)]
  [texture (read-bitmap "uitset.png")]))
(define testpanel7
  (new UIpanel%
       [anchor 'bottomleft]
  [size (cons 50 25)]
  [texture (read-bitmap "uitset.png")]))
(define testpanel8
  (new UIpanel%
       [anchor 'bottomcenter]
  [size (cons 50 25)]
  [texture (read-bitmap "uitset.png")]))
(define testpanel9
  (new UIpanel%
       [anchor 'bottomright]
  [size (cons 50 25)]
  [texture (read-bitmap "uitset.png")]))
;;(send testpanel5 get-anchor)
(define test-ui
  (new UI%
       [uipanels (list testpanel1 testpanel4 testpanel5 testpanel2 testpanel6 testpanel3 testpanel8 testpanel9 testpanel7)]))
(change-ui test-ui)       
;;END DEBUG
;; tick!: -> void
(define (tick!)
  (set! state (add1 state))
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



(define MAIN-CANVAS (new (class canvas%
                           (super-new)
                           
                           
                           )[parent MAIN-FRAME]
                            [paint-callback paint!]))


(send MAIN-FRAME show #t)


(define MAIN-TIMER (new timer% 
                        [notify-callback tick!]
                        [interval 1000]))




;;Palla länka vid felsökning !!tas bort efter länkning!!




