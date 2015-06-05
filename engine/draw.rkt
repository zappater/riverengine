#lang racket
(require compatibility/mlist)
(require racket/gui/base)
(require "actclass.rkt")
(require "baseclasses.rkt")
(require "leveldatastructure.rkt")
(require "supportfunctions.rkt")
(require "globals.rkt")
(require "UIdefines.rkt")
(require "key-handler.rkt")
(require "Demo_game.rkt")

(define game-name "example")
; tick!: -> void
(define (tick!)
  ;redraws the screen everytime it is run
  ;(set! state (add1 state))
  (send main-canvas refresh))
(define (paint! a-canvas dc)
  ;performs all calls to dc
  ;a lot of this code is specific to how Rackets gui library works, see the standard documentation for indepth explanations
  (indraw)
  (send dc scale *scale* *scale*) ;rescales the image 
  (send dc set-background (make-object color% 0 0 0)) ;sets the standard background to black
  (send dc clear) ;removes the previous screen
  (define (paint-act! act) 
    ;function for drawing an act on the screen
    ;takes as argument an act object
    (draw-enteties (send act get-levels) 
                   (cons (second (send camera-obj my-pos))
                         (third (send camera-obj my-pos))))) ;kallar huvud hjälpfunktion för paint-act! med info 
  (define (draw-level level camera-pos drawpos ypos) 
    ;draws a level on the screen
    ;takes as arguments a level, the position of the camera (which determines where you are looking)
    ;camera-pos is a 2D position (y-cor x-cor)
    ;drawpos and ypos are used for determining which area to draw on the screen
    ;drawpos is a 2D position (y-cor x-cor) always starting at (0 0), this as the top left corner of the screen is
    ;considered the origin of the cartesian plane we are drawing
    ;ypos is simply a counter for our position a long the y-axis, it always starts at 1
    (if (null? level)
        (void)
        (if (<= (abs (- (car camera-pos) ypos))
                (round (/ (car viewsize) 2))) ;makes sure to only draw the objects which are within the area to be drawn
            (begin
              ;(display camera-pos) ;debugging tool
              ;(display ypos) ;debugging tool
              ;(display "\n") ;debugging tool
              (draw-row (mcar level) (cdr camera-pos) drawpos 1)
              (draw-level (mcdr level) camera-pos (cons (+ (car drawpos) 1) (cdr drawpos)) (+ ypos 1)))
            (draw-level (mcdr level) camera-pos drawpos (+ ypos  1)))))
  (define (draw-row row cameraxpos drawpos xpos)
    ;draws a row vector on the screen (see leveldatastructure.rkt for more info) by traversing it cell by cell
    ;row is the level's row vector
    ;camerxpos is the x-cor of the camera
    ;drawpos is the same drawpos as above
    ;xpos is the x-cor we which to draw
    (if (null? row)
        (void) 
        (cond ((< xpos (- cameraxpos (round (/ (cdr viewsize) 2))))
               (draw-row (mcdr row) cameraxpos drawpos (+ xpos  1)))
              ((> xpos  (+ cameraxpos (round (/ (cdr viewsize) 2))))
               (void))
              (else
               (begin
                 ;(display xpos) ;debugging tool
                 (let ((obj (mcar (mcar row))))
                   (if (null? obj)
                       (void) ;if the position does not contain an object do not draw anything
                       (if (send obj get-current-texture) ;if the object contains a texture, draw it otherwise do nothing
                           (begin
                             ;(display drawpos) ;debugging tool
                             (send dc draw-bitmap (send obj get-current-texture) (* 50 (cdr drawpos)) (* 50 (car drawpos))))
                           (void))))
                 (draw-row (mcdr row) cameraxpos (cons (car drawpos) (+ 1 (cdr drawpos))) (+ xpos  1))))))) 
  (define (draw-enteties structure camera-pos)
    ;draws the entire act on the screen level by level, starting with the first level
    ;structure is all the data stored in the act in the field levels
    ;camera-pos is the position of the camera
    (if (null? structure)
        (void)
        (begin
          (draw-level (mcar structure) camera-pos (cons 0 0) 1)
          (draw-enteties (mcdr structure) camera-pos))))    
  (define paint-ui-act!
    ;draws an UI on the screen
    (lambda (ui windowsize)
      ;takes as arguments a UI object and a pair containing integers determining the size of the screen to be drawn
      (define (draw-panel-help obj size) 
        ;draws a panel or panelgroup with the anchor 0,0
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
          ;calculates all anchor positions
          (let ((size (send obj get-size))
                (offset (send obj get-offset))
                (anchor (send obj get-anchor)))
            ;(display (- (+ (- (/ (car windowsize) 2)) (round (/ (car size) 2))) (car offset)))
            ;(display "    ")
            ;(display (+ (- (/ (car windowsize) 2) (round (/ (car size) 2))) (car offset)))
            ;(display "\n")
            (cond ((eq? anchor 'topleft)
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
      ;end of anchor positions         
      (for-each draw-panel (send ui get-uipanels))))
  (if game ;starts the procedure for drawing the game on the screen
      (begin
        (paint-act! *current-act*) ;starts up paint-act! with the act in use
        (paint-ui-act! *current-ui* 
                       (cons (* 50 *scale* (cdr viewsize)) 
                             (* 50 *scale* (car viewsize))))) ;viewsize determines the number of tiles the screen is
      void)
  (send dc scale (/ 1 *scale*) (/ 1 *scale*))) ;resets the scale in turn for the next cycle
(define main-frame 
  ;creates the window to be drawn on the screen using Rackets in-built object frame%
  (new (class frame%
         (super-new)
         (define/augment (on-close)
           (custodian-shutdown-all (current-custodian))))
       [width (* 50 *scale* (cdr viewsize))] ;makes sure viewsize and scale is used in the calculations
       [height (* 50 *scale* (car viewsize))]
       [label game-name]))
(define game-canvas%
  ;creates an object for handling keyboard input
  (class canvas%
    (super-new)
    (init-field [key-handler-l key-handler])
    (define/override (on-char key-event)
      (begin
        ;(write (send key-event get-key-code))
        (key-handler-l (send key-event get-key-code) *control-scheme*)))))
(define main-canvas 
  ;the canvas to actually be drawn on the screen
  (new (class game-canvas%
         (super-new))
       [parent main-frame]
       [paint-callback paint!]))
(send main-frame show #t) ;shows the canvas on the screen
(define main-timer
  ;using Rackets in-built timer object to create a loop which is used for refreshing the screen every 32ms.
  (new timer% 
       [notify-callback tick!]
       [interval 32]))
