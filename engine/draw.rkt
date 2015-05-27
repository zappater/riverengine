#lang racket
(define game-name "example")
(require compatibility/mlist)
(require racket/gui/base)
(require "actclass.rkt")
(require "granpaclass.rkt")
(require "leveldatastructure.rkt")
(require "supportfunctions.rkt")
(require "globals.rkt")
(require "UIdefines.rkt")
(require "key-handler.rkt")
(require "Demo_game.rkt")
;;DEBUG       
;;END DEBUG
;; tick!: -> void
(define (tick!);;funktionen som uppdaterar skärmen
  ;;(set! state (add1 state))
  (send main-canvas refresh))



(define (paint! a-canvas dc);; utför all dc calls
  (indraw)
  (send dc scale *scale* *scale*) ;;skalar om bilden, bra till skärmar med hög upplösning 
  (send dc set-background (make-object color% 0 0 0));;Svart bakgrund
  (send dc clear) ;ränsar föregåend bildruta
  
  (define (paint-act! act) ;funktion för att rita en akt
    (draw-enteties (send act get-levels) 
                   (cons (second (send camera-obj my-pos))
                         (third (send camera-obj my-pos))))) ;kallar huvud hjälpfunktion för paint-act! med info 
  
  (define (draw-level level camera-pos drawpos ypos) ;ritar ut en level på skärmen
    (if (null? level)
        (void)
        (if (<= (abs (- (car camera-pos) ypos))
                (round (/ (car viewsize) 2))) ;bestämmer att vi är inom området som ska ritas ut
            (begin
              ;(display camera-pos) ;debugging tool
              ;(display ypos) ;debugging tool
              ;(display "\n") ;debugging tool
              (draw-row (mcar level) (cdr camera-pos) drawpos 1)
              (draw-level (mcdr level) camera-pos (cons (+ (car drawpos) 1) (cdr drawpos)) (+ ypos 1)))
            (draw-level (mcdr level) camera-pos drawpos (+ ypos  1)))))
  
  (define (draw-row row cameraxpos drawpos xpos) ;ritar ut en rad på skärmen
    (if (null? row)
        (void) 
        (cond
          ((< xpos (- cameraxpos (round (/ (cdr viewsize) 2))))
           (draw-row (mcdr row) cameraxpos drawpos (+ xpos  1)))
          ((> xpos  (+ cameraxpos (round (/ (cdr viewsize) 2))))
           (void))
          (else
           (begin
             ;;(display xpos)
             (let ((obj (mcar (mcar row))))
               (if (null? obj)
                   (void)
                   (if (send obj get-current-texture)
                       (begin
                         (send dc draw-bitmap (send obj get-current-texture) (* 50 (cdr drawpos)) (* 50 (car drawpos)))
                         ;(display drawpos)
                         )
                       (void))))
             (draw-row (mcdr row) cameraxpos (cons (car drawpos) (+ 1 (cdr drawpos))) (+ xpos  1))))))) 
  (define (draw-enteties structure camera-pos) ;;ritar ut hela act strukturen på skärmen
    (if (null? structure)
        (void)
        (begin
          (draw-level (mcar structure) camera-pos (cons 0 0) 1)
          (draw-enteties (mcdr structure) camera-pos))))    
  
  
  
  (define paint-ui-act! ;;ritar ut ett ui på skärmen
    (lambda (ui windowsize)      
      (define (draw-panel-help obj size) ;;ritar ut panel eller grupp med ett ankar som 0,0
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
      (define draw-panel
        (lambda (obj)
          ;;Räkna ut ankar positioner från och med här och förbi blocket nedan
          (let ((size (send obj get-size))
                (offset (send obj get-offset))
                (anchor (send obj get-anchor)))
            ;;(display (- (+ (- (/ (car windowsize) 2)) (round (/ (car size) 2))) (car offset)))
            ;;(display "    ")
            ;;(display (+ (- (/ (car windowsize) 2) (round (/ (car size) 2))) (car offset)))
            ;;(display "\n")
            (cond
              ((eq? anchor 'topleft)
               (send dc translate (car offset) (cdr offset))
               (draw-panel-help obj size)
               (send dc translate (- (car offset)) (- (cdr offset))))
              ((eq? anchor 'topcenter)
               (send dc translate (+ (- (/ (car windowsize) 2) (round (/ (car size) 2))) (car offset)) (cdr offset))
               (draw-panel-help obj size)
               (send dc translate (- (+ (- (/ (car windowsize) 2) (round (/ (car size) 2))) (car offset))) (- (cdr offset))))
              ((eq? anchor 'topright) 
               (send dc translate (+ (- (car windowsize) (car size)) (car offset)) (cdr offset))
               (draw-panel-help obj size)
               (send dc translate (- (+ (- (car windowsize) (car size)) (car offset))) (- (cdr offset))))
              ((eq? anchor 'centerleft)
               (send dc translate (car offset) (+ (- (/ (cdr windowsize) 2) (round (/ (cdr size) 2))) (cdr offset)))
               (draw-panel-help obj size)
               (send dc translate (- (car offset)) (- (+ (- (/ (cdr windowsize) 2) (round (/ (cdr size) 2))) (cdr offset)))))
              ((eq? anchor 'centercenter)
               (send dc translate (+ (- (/ (car windowsize) 2) (round (/ (car size) 2))) (car offset))  (+ (- (/ (cdr windowsize) 2) (round (/ (cdr size) 2))) (cdr offset)))
               (draw-panel-help obj size)
               (send dc translate (- (+ (- (/ (car windowsize) 2) (round (/ (car size) 2))) (car offset)))  (- (+ (- (/ (cdr windowsize) 2) (round (/ (cdr size) 2))) (cdr offset)))))
              ((eq? anchor 'centerright)
               (send dc translate (+ (- (car windowsize) (car size)) (car offset)) (+ (- (/ (cdr windowsize) 2) (round (/ (cdr size) 2))) (cdr offset)))
               (draw-panel-help obj size)
               (send dc translate (- (+ (- (car windowsize) (car size)) (car offset))) (- (+ (- (/ (cdr windowsize) 2) (round (/ (cdr size) 2))) (cdr offset)))))
              ((eq? anchor 'bottomleft)
               (send dc translate (car offset) (+ (- (cdr windowsize) (cdr size)) (cdr offset)))
               (draw-panel-help obj size)
               (send dc translate (- (car offset)) (- (+ (- (cdr windowsize) (cdr size)) (cdr offset)))))
              ((eq? anchor 'bottomcenter) 
               (send dc translate (+ (- (/ (car windowsize) 2) (round (/ (car size) 2))) (car offset)) (+ (- (cdr windowsize) (cdr size)) (cdr offset)))
               (draw-panel-help obj size)
               (send dc translate (- (+ (- (/ (car windowsize) 2) (round (/ (car size) 2))) (car offset))) (- (+ (- (cdr windowsize) (cdr size)) (cdr offset)))))
              ((eq? anchor 'bottomright)
               (send dc translate (+ (- (car windowsize) (car size)) (car offset)) (+ (- (cdr windowsize) (cdr size)) (cdr offset)))
               (draw-panel-help obj size)
               (send dc translate (- (+ (- (car windowsize) (car size)) (car offset))) (- (+ (- (cdr windowsize) (cdr size)) (cdr offset)))))
              (else
               (error obj "has an invaild anchor")))))) 
      ;;Slut på ankar postionerna          
      (for-each draw-panel (send ui get-uipanels))))
  
  (if game
      (begin
        (paint-act! *current-act*) ;;ritar faktiskt ut nått
        (paint-ui-act! *current-ui* 
                       (cons (* 50 *scale* (cdr viewsize)) 
                             (* 50 *scale* (car viewsize))))) ;viewsize bestämmer antal tiles rutan är
      void)
  (send dc scale (/ 1 *scale*) (/ 1 *scale*))) ;;återställer skalan inför nästa cykel



(define main-frame 
  (new (class frame% ;;skapar fönstret
         (super-new)
         (define/augment (on-close)
           (custodian-shutdown-all (current-custodian))))
       [width (* 50 *scale* (cdr viewsize))] ;;tar hänsyn till viewsize och skalan
       [height (* 50 *scale* (car viewsize))]
       [label game-name]))


(define game-canvas% ;;möjliggör input från tangentbord
  (class canvas%
    (super-new)
    (init-field [key-handler-l key-handler])
    (define/override (on-char key-event)
      (begin
        ;;(write (send key-event get-key-code))
        (key-handler-l (send key-event get-key-code) *control-scheme*)))))

(define main-canvas 
  (new (class game-canvas%
         (super-new))
       [parent main-frame]
       [paint-callback paint!]))

(send main-frame show #t) ;;visa fönstret

(define main-timer 
  (new timer%  ;;huvud timer loopar ritandet av skärmen
       [notify-callback tick!]
       [interval 32]))
