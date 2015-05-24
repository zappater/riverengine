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
(require "texture_defs.rkt")

;;Definitions
(define defult-font-18 (make-font #:size 18)) 
(define current-texture-panel
  (new UIpanel%
       [size (cons 50 50)]
       [text-style defult-font-18]))
(define current-level-panel
  (new UIpanel%
       [anchor 'topright]
       [size (cons 20 20)]
       [text-style defult-font-18]))
(define help-text-1
  (new UIpanel%
       [anchor 'topleft]
       [text "Use arrowkeys to move camera."]
       [text-style defult-font-18]))
(define help-text-2
  (new UIpanel%
       [anchor 'topleft]
       [offset (cons 0 22)]
       [text "Use q and a to cycle textures"]
       [text-style defult-font-18]))
(define help-text-3
  (new UIpanel%
       [anchor 'topleft]
       [offset (cons 0 44)]
       [text "Use w and s to cycle layers"]
       [text-style defult-font-18]))
(define help-text-4
  (new UIpanel%
       [anchor 'topleft]
       [offset (cons 0 66)]
       [text "Use moseleft to place and mouseright to remove textures"]
       [text-style defult-font-18]))
(define help-group
  (new UIpanelgroup%
       [uipanels (list help-text-1 help-text-2 help-text-3 help-text-4)]
       [offset (cons 0 53)]))
(define help-text-help
  (new UIpanel%
       [anchor 'topleft]
       [offset (cons 0 66)]
       [text "Press h for controls"]
       [text-style defult-font-18]))



(define texture-handle% ;;hanterar vilken textur som skall läggas till i acten och i vilket lager den skall läggas till 
  (class object%
    (super-new)
    (init-field
     [texture-list '()] 
     [current-number 1]
     [current-layer 1])
    (define/public (get-active)
      (cdr (assoc current-number texture-list)))
    (define/private (assoc-cdr ele lst) ;;som assoc fast söker mot cdr delen
      (if (null? lst)
          #f
          (if (eq? (cdr (car lst)) ele)
              (car lst)
              (assoc-cdr ele (cdr lst)))))
    (define/public (set-active-texture! texture) ;;ändrar aktiv textur om den nya finns med i listan
      (let ((texture-num (assoc-cdr texture texture-list)))
        (if texture-num
            (set! current-number (car texture-num))
            (void))))
    (define/public (add-texture texture-obj);;lägger till ny textur i listan
      (set! texture-list (cons (cons (+ (length texture-list) 1) texture-obj) texture-list)))
    (define/public (add-num) ;;gör nästa textur i listan aktiv
      (begin
        (if (<= (length texture-list) current-number)
            (set! current-number 1)
            (set! current-number (+ current-number 1)))
        (send current-texture-panel set-texture! (send this get-active))
        (send current-texture-panel set-text! (number->string current-number))))
    (define/public (sub-num) ;;gör föregående textur i listan aktiv
      (begin 
        (if (<= current-number 1)
            (set! current-number (length texture-list))
            (set! current-number (- current-number 1)))
        ;;(display current-number)
        (send current-texture-panel set-texture! (send this get-active))
        (send current-texture-panel set-text! (number->string current-number))))
    (define/public (get-layer) ;;ger ut vilket lager som nu är aktivt
      current-layer)
    (define/public (get-current-number)
      current-number)
    (define/public (add-layer) ;;gör nästa lager aktivt
      (let ((numlvls (mlength (send *current-act* get-levels))))
        (begin
          (if (<= numlvls current-layer)
              (set! current-layer 1)
              (set! current-layer (+ current-layer 1)))
          (send current-level-panel set-text! (number->string current-layer)))))
    (define/public (sub-layer) ;;gör föregående lager aktivt
      (let ((numlvls (mlength (send *current-act* get-levels))))
        (begin
          (if (<= current-layer 1)
              (set! current-layer numlvls)
              (set! current-layer (- current-layer 1)))
          (send current-level-panel set-text! (number->string current-layer)))))))

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
(define viewsize (cons 16 20))
(define creators-ui
  (new UI%
       [uipanels (list current-texture-panel  current-level-panel help-text-help)]))
(change-ui creators-ui)
(define creators-control-scheme (new control-scheme%))
(send creators-control-scheme add-key 'up (lambda () (begin (send camera-obj walk 'up) (send camera-obj inc-pos))))
(send creators-control-scheme add-key 'down (lambda () (begin (send camera-obj walk 'down) (send camera-obj inc-pos))))
(send creators-control-scheme add-key 'right (lambda () (begin (send camera-obj walk 'left) (send camera-obj inc-pos))))
(send creators-control-scheme add-key 'left (lambda () (begin (send camera-obj walk 'right) (send camera-obj inc-pos))))
(send creators-control-scheme add-key #\q (lambda () (send texture-handler add-num)))
(send creators-control-scheme add-key #\a (lambda () (send texture-handler sub-num)))
(send creators-control-scheme add-key #\w (lambda () (send texture-handler add-layer)))
(send creators-control-scheme add-key #\s (lambda () (send texture-handler sub-layer)))
(send creators-control-scheme add-key #\h ((lambda (bollocal) (lambda ()  (if bollocal
                                                                              (begin 
                                                                                (send creators-ui remove-panel help-group)
                                                                                (send creators-ui add-uipanel help-text-help)
                                                                                (set! bollocal #f))
                                                                              (begin
                                                                                (send creators-ui add-uipanel help-group)
                                                                                (send creators-ui remove-panel help-text-help)
                                                                                (set! bollocal #t)))))
                                           #f))

(change-control-scheme creators-control-scheme)



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
(define (mouse-handler mouse-event);;hanterar mustryckningar
  (let ((x-cord (send mouse-event get-x))
        (y-cord (send mouse-event get-y))
        (camera-pos (cons (second (send camera-obj my-pos)) (third (send camera-obj my-pos)))))
    (if camera-pos
        (let ((pos (list (+ (- (car camera-pos) (/ (car viewsize) 2)) (round (/ (- y-cord 25) 50))) (+ (- (cdr camera-pos) (/  (cdr viewsize) 2))  (round (/  (- x-cord 25) 50))))))
          (cond 
            ((send mouse-event button-down? 'left);;vid nertryckning av vänstermusknapp läggs textur till både i fil o act
             (begin
               ;;(display pos)
               (send *current-act* add-texture-obj (cons (send texture-handler get-layer) pos) (send texture-handler get-active))
               (display-to-file "(send *current-act* add-texture-obj '" "rename_to_save.txt" #:exists 'append)
               (display-to-file (cons (send texture-handler get-layer) pos) "rename_to_save.txt" #:exists 'append)
               (display-to-file "  " "rename_to_save.txt" #:exists 'append)
               (display-to-file (send (send texture-handler get-active) get-name) "rename_to_save.txt" #:exists 'append)
               (display-to-file " ) \n " "rename_to_save.txt" #:exists 'append)))
            ((send mouse-event button-down? 'right);;vid höger mustryckning tas textur bort både i fil och act
             (begin
               (send *current-act* remove-texture-obj (cons (send texture-handler get-layer) pos))
               (display-to-file "(send *current-act* remove-texture-obj '" "rename_to_save.txt" #:exists 'append)
               (display-to-file (cons (send texture-handler get-layer) pos) "rename_to_save.txt" #:exists 'append)
               (display-to-file ") \n  " "rename_to_save.txt" #:exists 'append)))
            ((send mouse-event button-down? 'middle) ;;vid mitten mustryckning väljs den texturen som finns på pos
             (begin
               (let ((texture (send *current-act* get-obj-at-pos (cons (send texture-handler get-layer) pos))))
                 (if (null? texture)
                     (void)
                     (begin
                       (send texture-handler set-active-texture! texture)
                       (send current-texture-panel set-texture! (send texture-handler get-active))
                       (send current-texture-panel set-text! (number->string (send texture-handler get-current-number))))))))
            (else (void))))
        (void))))

;;End definitions
;;Adding textures to texturehandler
;; Adding textures 
(send texture-handler add-texture 50x50_stratagus_tileset384) 
(send texture-handler add-texture 50x50_stratagus_tileset383) 
(send texture-handler add-texture 50x50_stratagus_tileset382) 
(send texture-handler add-texture 50x50_stratagus_tileset381) 
(send texture-handler add-texture 50x50_stratagus_tileset380) 
(send texture-handler add-texture 50x50_stratagus_tileset379) 
(send texture-handler add-texture 50x50_stratagus_tileset378) 
(send texture-handler add-texture 50x50_stratagus_tileset377) 
(send texture-handler add-texture 50x50_stratagus_tileset376) 
(send texture-handler add-texture 50x50_stratagus_tileset375) 
(send texture-handler add-texture 50x50_stratagus_tileset374) 
(send texture-handler add-texture 50x50_stratagus_tileset373) 
(send texture-handler add-texture 50x50_stratagus_tileset372) 
(send texture-handler add-texture 50x50_stratagus_tileset371) 
(send texture-handler add-texture 50x50_stratagus_tileset370) 
(send texture-handler add-texture 50x50_stratagus_tileset369) 
(send texture-handler add-texture 50x50_stratagus_tileset368) 
(send texture-handler add-texture 50x50_stratagus_tileset367) 
(send texture-handler add-texture 50x50_stratagus_tileset366) 
(send texture-handler add-texture 50x50_stratagus_tileset365) 
(send texture-handler add-texture 50x50_stratagus_tileset364) 
(send texture-handler add-texture 50x50_stratagus_tileset363) 
(send texture-handler add-texture 50x50_stratagus_tileset362) 
(send texture-handler add-texture 50x50_stratagus_tileset361) 
(send texture-handler add-texture 50x50_stratagus_tileset360) 
(send texture-handler add-texture 50x50_stratagus_tileset359) 
(send texture-handler add-texture 50x50_stratagus_tileset358) 
(send texture-handler add-texture 50x50_stratagus_tileset357) 
(send texture-handler add-texture 50x50_stratagus_tileset356) 
(send texture-handler add-texture 50x50_stratagus_tileset355) 
(send texture-handler add-texture 50x50_stratagus_tileset354) 
(send texture-handler add-texture 50x50_stratagus_tileset353) 
(send texture-handler add-texture 50x50_stratagus_tileset352) 
(send texture-handler add-texture 50x50_stratagus_tileset351) 
(send texture-handler add-texture 50x50_stratagus_tileset350) 
(send texture-handler add-texture 50x50_stratagus_tileset349) 
(send texture-handler add-texture 50x50_stratagus_tileset348) 
(send texture-handler add-texture 50x50_stratagus_tileset347) 
(send texture-handler add-texture 50x50_stratagus_tileset346) 
(send texture-handler add-texture 50x50_stratagus_tileset345) 
(send texture-handler add-texture 50x50_stratagus_tileset344) 
(send texture-handler add-texture 50x50_stratagus_tileset343) 
(send texture-handler add-texture 50x50_stratagus_tileset342) 
(send texture-handler add-texture 50x50_stratagus_tileset341) 
(send texture-handler add-texture 50x50_stratagus_tileset340) 
(send texture-handler add-texture 50x50_stratagus_tileset339) 
(send texture-handler add-texture 50x50_stratagus_tileset338) 
(send texture-handler add-texture 50x50_stratagus_tileset337) 
(send texture-handler add-texture 50x50_stratagus_tileset336) 
(send texture-handler add-texture 50x50_stratagus_tileset335) 
(send texture-handler add-texture 50x50_stratagus_tileset334) 
(send texture-handler add-texture 50x50_stratagus_tileset333) 
(send texture-handler add-texture 50x50_stratagus_tileset332) 
(send texture-handler add-texture 50x50_stratagus_tileset331) 
(send texture-handler add-texture 50x50_stratagus_tileset330) 
(send texture-handler add-texture 50x50_stratagus_tileset329) 
(send texture-handler add-texture 50x50_stratagus_tileset328) 
(send texture-handler add-texture 50x50_stratagus_tileset327) 
(send texture-handler add-texture 50x50_stratagus_tileset326) 
(send texture-handler add-texture 50x50_stratagus_tileset325) 
(send texture-handler add-texture 50x50_stratagus_tileset324) 
(send texture-handler add-texture 50x50_stratagus_tileset323) 
(send texture-handler add-texture 50x50_stratagus_tileset322) 
(send texture-handler add-texture 50x50_stratagus_tileset321) 
(send texture-handler add-texture 50x50_stratagus_tileset320) 
(send texture-handler add-texture 50x50_stratagus_tileset319) 
(send texture-handler add-texture 50x50_stratagus_tileset318) 
(send texture-handler add-texture 50x50_stratagus_tileset317) 
(send texture-handler add-texture 50x50_stratagus_tileset316) 
(send texture-handler add-texture 50x50_stratagus_tileset315) 
(send texture-handler add-texture 50x50_stratagus_tileset314) 
(send texture-handler add-texture 50x50_stratagus_tileset313) 
(send texture-handler add-texture 50x50_stratagus_tileset312) 
(send texture-handler add-texture 50x50_stratagus_tileset311) 
(send texture-handler add-texture 50x50_stratagus_tileset310) 
(send texture-handler add-texture 50x50_stratagus_tileset309) 
(send texture-handler add-texture 50x50_stratagus_tileset308) 
(send texture-handler add-texture 50x50_stratagus_tileset307) 
(send texture-handler add-texture 50x50_stratagus_tileset306) 
(send texture-handler add-texture 50x50_stratagus_tileset305) 
(send texture-handler add-texture 50x50_stratagus_tileset304) 
(send texture-handler add-texture 50x50_stratagus_tileset303) 
(send texture-handler add-texture 50x50_stratagus_tileset302) 
(send texture-handler add-texture 50x50_stratagus_tileset301) 
(send texture-handler add-texture 50x50_stratagus_tileset300) 
(send texture-handler add-texture 50x50_stratagus_tileset299) 
(send texture-handler add-texture 50x50_stratagus_tileset298) 
(send texture-handler add-texture 50x50_stratagus_tileset297) 
(send texture-handler add-texture 50x50_stratagus_tileset296) 
(send texture-handler add-texture 50x50_stratagus_tileset295) 
(send texture-handler add-texture 50x50_stratagus_tileset294) 
(send texture-handler add-texture 50x50_stratagus_tileset293) 
(send texture-handler add-texture 50x50_stratagus_tileset292) 
(send texture-handler add-texture 50x50_stratagus_tileset291) 
(send texture-handler add-texture 50x50_stratagus_tileset290) 
(send texture-handler add-texture 50x50_stratagus_tileset289) 
(send texture-handler add-texture 50x50_stratagus_tileset288) 
(send texture-handler add-texture 50x50_stratagus_tileset287) 
(send texture-handler add-texture 50x50_stratagus_tileset286) 
(send texture-handler add-texture 50x50_stratagus_tileset285) 
(send texture-handler add-texture 50x50_stratagus_tileset284) 
(send texture-handler add-texture 50x50_stratagus_tileset283) 
(send texture-handler add-texture 50x50_stratagus_tileset282) 
(send texture-handler add-texture 50x50_stratagus_tileset281) 
(send texture-handler add-texture 50x50_stratagus_tileset280) 
(send texture-handler add-texture 50x50_stratagus_tileset279) 
(send texture-handler add-texture 50x50_stratagus_tileset278) 
(send texture-handler add-texture 50x50_stratagus_tileset277) 
(send texture-handler add-texture 50x50_stratagus_tileset276) 
(send texture-handler add-texture 50x50_stratagus_tileset275) 
(send texture-handler add-texture 50x50_stratagus_tileset274) 
(send texture-handler add-texture 50x50_stratagus_tileset273) 
(send texture-handler add-texture 50x50_stratagus_tileset272) 
(send texture-handler add-texture 50x50_stratagus_tileset271) 
(send texture-handler add-texture 50x50_stratagus_tileset270) 
(send texture-handler add-texture 50x50_stratagus_tileset269) 
(send texture-handler add-texture 50x50_stratagus_tileset268) 
(send texture-handler add-texture 50x50_stratagus_tileset267) 
(send texture-handler add-texture 50x50_stratagus_tileset266) 
(send texture-handler add-texture 50x50_stratagus_tileset265) 
(send texture-handler add-texture 50x50_stratagus_tileset264) 
(send texture-handler add-texture 50x50_stratagus_tileset263) 
(send texture-handler add-texture 50x50_stratagus_tileset262) 
(send texture-handler add-texture 50x50_stratagus_tileset261) 
(send texture-handler add-texture 50x50_stratagus_tileset260) 
(send texture-handler add-texture 50x50_stratagus_tileset259) 
(send texture-handler add-texture 50x50_stratagus_tileset258) 
(send texture-handler add-texture 50x50_stratagus_tileset257) 
(send texture-handler add-texture 50x50_stratagus_tileset256) 
(send texture-handler add-texture 50x50_stratagus_tileset255) 
(send texture-handler add-texture 50x50_stratagus_tileset254) 
(send texture-handler add-texture 50x50_stratagus_tileset253) 
(send texture-handler add-texture 50x50_stratagus_tileset252) 
(send texture-handler add-texture 50x50_stratagus_tileset251) 
(send texture-handler add-texture 50x50_stratagus_tileset250) 
(send texture-handler add-texture 50x50_stratagus_tileset249) 
(send texture-handler add-texture 50x50_stratagus_tileset248) 
(send texture-handler add-texture 50x50_stratagus_tileset247) 
(send texture-handler add-texture 50x50_stratagus_tileset246) 
(send texture-handler add-texture 50x50_stratagus_tileset245) 
(send texture-handler add-texture 50x50_stratagus_tileset244) 
(send texture-handler add-texture 50x50_stratagus_tileset243) 
(send texture-handler add-texture 50x50_stratagus_tileset242) 
(send texture-handler add-texture 50x50_stratagus_tileset241) 
(send texture-handler add-texture 50x50_stratagus_tileset240) 
(send texture-handler add-texture 50x50_stratagus_tileset239) 
(send texture-handler add-texture 50x50_stratagus_tileset238) 
(send texture-handler add-texture 50x50_stratagus_tileset237) 
(send texture-handler add-texture 50x50_stratagus_tileset236) 
(send texture-handler add-texture 50x50_stratagus_tileset235) 
(send texture-handler add-texture 50x50_stratagus_tileset234) 
(send texture-handler add-texture 50x50_stratagus_tileset233) 
(send texture-handler add-texture 50x50_stratagus_tileset232) 
(send texture-handler add-texture 50x50_stratagus_tileset231) 
(send texture-handler add-texture 50x50_stratagus_tileset230) 
(send texture-handler add-texture 50x50_stratagus_tileset229) 
(send texture-handler add-texture 50x50_stratagus_tileset228) 
(send texture-handler add-texture 50x50_stratagus_tileset227) 
(send texture-handler add-texture 50x50_stratagus_tileset226) 
(send texture-handler add-texture 50x50_stratagus_tileset225) 
(send texture-handler add-texture 50x50_stratagus_tileset224) 
(send texture-handler add-texture 50x50_stratagus_tileset223) 
(send texture-handler add-texture 50x50_stratagus_tileset222) 
(send texture-handler add-texture 50x50_stratagus_tileset221) 
(send texture-handler add-texture 50x50_stratagus_tileset220) 
(send texture-handler add-texture 50x50_stratagus_tileset219) 
(send texture-handler add-texture 50x50_stratagus_tileset218) 
(send texture-handler add-texture 50x50_stratagus_tileset217) 
(send texture-handler add-texture 50x50_stratagus_tileset216) 
(send texture-handler add-texture 50x50_stratagus_tileset215) 
(send texture-handler add-texture 50x50_stratagus_tileset214) 
(send texture-handler add-texture 50x50_stratagus_tileset213) 
(send texture-handler add-texture 50x50_stratagus_tileset212) 
(send texture-handler add-texture 50x50_stratagus_tileset211) 
(send texture-handler add-texture 50x50_stratagus_tileset210) 
(send texture-handler add-texture 50x50_stratagus_tileset209) 
(send texture-handler add-texture 50x50_stratagus_tileset208) 
(send texture-handler add-texture 50x50_stratagus_tileset207) 
(send texture-handler add-texture 50x50_stratagus_tileset206) 
(send texture-handler add-texture 50x50_stratagus_tileset205) 
(send texture-handler add-texture 50x50_stratagus_tileset204) 
(send texture-handler add-texture 50x50_stratagus_tileset203) 
(send texture-handler add-texture 50x50_stratagus_tileset202) 
(send texture-handler add-texture 50x50_stratagus_tileset201) 
(send texture-handler add-texture 50x50_stratagus_tileset200) 
(send texture-handler add-texture 50x50_stratagus_tileset199) 
(send texture-handler add-texture 50x50_stratagus_tileset198) 
(send texture-handler add-texture 50x50_stratagus_tileset197) 
(send texture-handler add-texture 50x50_stratagus_tileset196) 
(send texture-handler add-texture 50x50_stratagus_tileset195) 
(send texture-handler add-texture 50x50_stratagus_tileset194) 
(send texture-handler add-texture 50x50_stratagus_tileset193) 
(send texture-handler add-texture 50x50_stratagus_tileset192) 
(send texture-handler add-texture 50x50_stratagus_tileset191) 
(send texture-handler add-texture 50x50_stratagus_tileset190) 
(send texture-handler add-texture 50x50_stratagus_tileset189) 
(send texture-handler add-texture 50x50_stratagus_tileset188) 
(send texture-handler add-texture 50x50_stratagus_tileset187) 
(send texture-handler add-texture 50x50_stratagus_tileset186) 
(send texture-handler add-texture 50x50_stratagus_tileset185) 
(send texture-handler add-texture 50x50_stratagus_tileset184) 
(send texture-handler add-texture 50x50_stratagus_tileset183) 
(send texture-handler add-texture 50x50_stratagus_tileset182) 
(send texture-handler add-texture 50x50_stratagus_tileset181) 
(send texture-handler add-texture 50x50_stratagus_tileset180) 
(send texture-handler add-texture 50x50_stratagus_tileset179) 
(send texture-handler add-texture 50x50_stratagus_tileset178) 
(send texture-handler add-texture 50x50_stratagus_tileset177) 
(send texture-handler add-texture 50x50_stratagus_tileset176) 
(send texture-handler add-texture 50x50_stratagus_tileset175) 
(send texture-handler add-texture 50x50_stratagus_tileset174) 
(send texture-handler add-texture 50x50_stratagus_tileset173) 
(send texture-handler add-texture 50x50_stratagus_tileset172) 
(send texture-handler add-texture 50x50_stratagus_tileset171) 
(send texture-handler add-texture 50x50_stratagus_tileset170) 
(send texture-handler add-texture 50x50_stratagus_tileset169) 
(send texture-handler add-texture 50x50_stratagus_tileset168) 
(send texture-handler add-texture 50x50_stratagus_tileset167) 
(send texture-handler add-texture 50x50_stratagus_tileset166) 
(send texture-handler add-texture 50x50_stratagus_tileset165) 
(send texture-handler add-texture 50x50_stratagus_tileset164) 
(send texture-handler add-texture 50x50_stratagus_tileset163) 
(send texture-handler add-texture 50x50_stratagus_tileset162) 
(send texture-handler add-texture 50x50_stratagus_tileset161) 
(send texture-handler add-texture 50x50_stratagus_tileset160) 
(send texture-handler add-texture 50x50_stratagus_tileset159) 
(send texture-handler add-texture 50x50_stratagus_tileset158) 
(send texture-handler add-texture 50x50_stratagus_tileset157) 
(send texture-handler add-texture 50x50_stratagus_tileset156) 
(send texture-handler add-texture 50x50_stratagus_tileset155) 
(send texture-handler add-texture 50x50_stratagus_tileset154) 
(send texture-handler add-texture 50x50_stratagus_tileset153) 
(send texture-handler add-texture 50x50_stratagus_tileset152) 
(send texture-handler add-texture 50x50_stratagus_tileset151) 
(send texture-handler add-texture 50x50_stratagus_tileset150) 
(send texture-handler add-texture 50x50_stratagus_tileset149) 
(send texture-handler add-texture 50x50_stratagus_tileset148) 
(send texture-handler add-texture 50x50_stratagus_tileset147) 
(send texture-handler add-texture 50x50_stratagus_tileset146) 
(send texture-handler add-texture 50x50_stratagus_tileset145) 
(send texture-handler add-texture 50x50_stratagus_tileset144) 
(send texture-handler add-texture 50x50_stratagus_tileset143) 
(send texture-handler add-texture 50x50_stratagus_tileset142) 
(send texture-handler add-texture 50x50_stratagus_tileset141) 
(send texture-handler add-texture 50x50_stratagus_tileset140) 
(send texture-handler add-texture 50x50_stratagus_tileset139) 
(send texture-handler add-texture 50x50_stratagus_tileset138) 
(send texture-handler add-texture 50x50_stratagus_tileset137) 
(send texture-handler add-texture 50x50_stratagus_tileset136) 
(send texture-handler add-texture 50x50_stratagus_tileset135) 
(send texture-handler add-texture 50x50_stratagus_tileset134) 
(send texture-handler add-texture 50x50_stratagus_tileset133) 
(send texture-handler add-texture 50x50_stratagus_tileset132) 
(send texture-handler add-texture 50x50_stratagus_tileset131) 
(send texture-handler add-texture 50x50_stratagus_tileset130) 
(send texture-handler add-texture 50x50_stratagus_tileset129) 
(send texture-handler add-texture 50x50_stratagus_tileset128) 
(send texture-handler add-texture 50x50_stratagus_tileset127) 
(send texture-handler add-texture 50x50_stratagus_tileset126) 
(send texture-handler add-texture 50x50_stratagus_tileset125) 
(send texture-handler add-texture 50x50_stratagus_tileset124) 
(send texture-handler add-texture 50x50_stratagus_tileset123) 
(send texture-handler add-texture 50x50_stratagus_tileset122) 
(send texture-handler add-texture 50x50_stratagus_tileset121) 
(send texture-handler add-texture 50x50_stratagus_tileset120) 
(send texture-handler add-texture 50x50_stratagus_tileset119) 
(send texture-handler add-texture 50x50_stratagus_tileset118) 
(send texture-handler add-texture 50x50_stratagus_tileset117) 
(send texture-handler add-texture 50x50_stratagus_tileset116) 
(send texture-handler add-texture 50x50_stratagus_tileset115) 
(send texture-handler add-texture 50x50_stratagus_tileset114) 
(send texture-handler add-texture 50x50_stratagus_tileset113) 
(send texture-handler add-texture 50x50_stratagus_tileset112) 
(send texture-handler add-texture 50x50_stratagus_tileset111) 
(send texture-handler add-texture 50x50_stratagus_tileset110) 
(send texture-handler add-texture 50x50_stratagus_tileset109) 
(send texture-handler add-texture 50x50_stratagus_tileset108) 
(send texture-handler add-texture 50x50_stratagus_tileset107) 
(send texture-handler add-texture 50x50_stratagus_tileset106) 
(send texture-handler add-texture 50x50_stratagus_tileset105) 
(send texture-handler add-texture 50x50_stratagus_tileset104) 
(send texture-handler add-texture 50x50_stratagus_tileset103) 
(send texture-handler add-texture 50x50_stratagus_tileset102) 
(send texture-handler add-texture 50x50_stratagus_tileset101) 
(send texture-handler add-texture 50x50_stratagus_tileset100) 
(send texture-handler add-texture 50x50_stratagus_tileset99) 
(send texture-handler add-texture 50x50_stratagus_tileset98) 
(send texture-handler add-texture 50x50_stratagus_tileset97) 
(send texture-handler add-texture 50x50_stratagus_tileset96) 
(send texture-handler add-texture 50x50_stratagus_tileset95) 
(send texture-handler add-texture 50x50_stratagus_tileset94) 
(send texture-handler add-texture 50x50_stratagus_tileset93) 
(send texture-handler add-texture 50x50_stratagus_tileset92) 
(send texture-handler add-texture 50x50_stratagus_tileset91) 
(send texture-handler add-texture 50x50_stratagus_tileset90) 
(send texture-handler add-texture 50x50_stratagus_tileset89) 
(send texture-handler add-texture 50x50_stratagus_tileset88) 
(send texture-handler add-texture 50x50_stratagus_tileset87) 
(send texture-handler add-texture 50x50_stratagus_tileset86) 
(send texture-handler add-texture 50x50_stratagus_tileset85) 
(send texture-handler add-texture 50x50_stratagus_tileset84) 
(send texture-handler add-texture 50x50_stratagus_tileset83) 
(send texture-handler add-texture 50x50_stratagus_tileset82) 
(send texture-handler add-texture 50x50_stratagus_tileset81) 
(send texture-handler add-texture 50x50_stratagus_tileset80) 
(send texture-handler add-texture 50x50_stratagus_tileset79) 
(send texture-handler add-texture 50x50_stratagus_tileset78) 
(send texture-handler add-texture 50x50_stratagus_tileset77) 
(send texture-handler add-texture 50x50_stratagus_tileset76) 
(send texture-handler add-texture 50x50_stratagus_tileset75) 
(send texture-handler add-texture 50x50_stratagus_tileset74) 
(send texture-handler add-texture 50x50_stratagus_tileset73) 
(send texture-handler add-texture 50x50_stratagus_tileset72) 
(send texture-handler add-texture 50x50_stratagus_tileset71) 
(send texture-handler add-texture 50x50_stratagus_tileset70) 
(send texture-handler add-texture 50x50_stratagus_tileset69) 
(send texture-handler add-texture 50x50_stratagus_tileset68) 
(send texture-handler add-texture 50x50_stratagus_tileset67) 
(send texture-handler add-texture 50x50_stratagus_tileset66) 
(send texture-handler add-texture 50x50_stratagus_tileset65) 
(send texture-handler add-texture 50x50_stratagus_tileset64) 
(send texture-handler add-texture 50x50_stratagus_tileset63) 
(send texture-handler add-texture 50x50_stratagus_tileset62) 
(send texture-handler add-texture 50x50_stratagus_tileset61) 
(send texture-handler add-texture 50x50_stratagus_tileset60) 
(send texture-handler add-texture 50x50_stratagus_tileset59) 
(send texture-handler add-texture 50x50_stratagus_tileset58) 
(send texture-handler add-texture 50x50_stratagus_tileset57) 
(send texture-handler add-texture 50x50_stratagus_tileset56) 
(send texture-handler add-texture 50x50_stratagus_tileset55) 
(send texture-handler add-texture 50x50_stratagus_tileset54) 
(send texture-handler add-texture 50x50_stratagus_tileset53) 
(send texture-handler add-texture 50x50_stratagus_tileset52) 
(send texture-handler add-texture 50x50_stratagus_tileset51) 
(send texture-handler add-texture 50x50_stratagus_tileset50) 
(send texture-handler add-texture 50x50_stratagus_tileset49) 
(send texture-handler add-texture 50x50_stratagus_tileset48) 
(send texture-handler add-texture 50x50_stratagus_tileset47) 
(send texture-handler add-texture 50x50_stratagus_tileset46) 
(send texture-handler add-texture 50x50_stratagus_tileset45) 
(send texture-handler add-texture 50x50_stratagus_tileset44) 
(send texture-handler add-texture 50x50_stratagus_tileset43) 
(send texture-handler add-texture 50x50_stratagus_tileset42) 
(send texture-handler add-texture 50x50_stratagus_tileset41) 
(send texture-handler add-texture 50x50_stratagus_tileset40) 
(send texture-handler add-texture 50x50_stratagus_tileset39) 
(send texture-handler add-texture 50x50_stratagus_tileset38) 
(send texture-handler add-texture 50x50_stratagus_tileset37) 
(send texture-handler add-texture 50x50_stratagus_tileset36) 
(send texture-handler add-texture 50x50_stratagus_tileset35) 
(send texture-handler add-texture 50x50_stratagus_tileset34) 
(send texture-handler add-texture 50x50_stratagus_tileset33) 
(send texture-handler add-texture 50x50_stratagus_tileset32) 
(send texture-handler add-texture 50x50_stratagus_tileset31) 
(send texture-handler add-texture 50x50_stratagus_tileset30) 
(send texture-handler add-texture 50x50_stratagus_tileset29) 
(send texture-handler add-texture 50x50_stratagus_tileset28) 
(send texture-handler add-texture 50x50_stratagus_tileset27) 
(send texture-handler add-texture 50x50_stratagus_tileset26) 
(send texture-handler add-texture 50x50_stratagus_tileset25) 
(send texture-handler add-texture 50x50_stratagus_tileset24) 
(send texture-handler add-texture 50x50_stratagus_tileset23) 
(send texture-handler add-texture 50x50_stratagus_tileset22) 
(send texture-handler add-texture 50x50_stratagus_tileset21) 
(send texture-handler add-texture 50x50_stratagus_tileset20) 
(send texture-handler add-texture 50x50_stratagus_tileset19) 
(send texture-handler add-texture 50x50_stratagus_tileset18) 
(send texture-handler add-texture 50x50_stratagus_tileset17) 
(send texture-handler add-texture 50x50_stratagus_tileset16) 
(send texture-handler add-texture 50x50_stratagus_tileset15) 
(send texture-handler add-texture 50x50_stratagus_tileset14) 
(send texture-handler add-texture 50x50_stratagus_tileset13) 
(send texture-handler add-texture 50x50_stratagus_tileset12) 
(send texture-handler add-texture 50x50_stratagus_tileset11) 
(send texture-handler add-texture 50x50_stratagus_tileset10) 
(send texture-handler add-texture 50x50_stratagus_tileset9) 
(send texture-handler add-texture 50x50_stratagus_tileset8) 
(send texture-handler add-texture 50x50_stratagus_tileset7) 
(send texture-handler add-texture 50x50_stratagus_tileset6) 
(send texture-handler add-texture 50x50_stratagus_tileset5) 
(send texture-handler add-texture 50x50_stratagus_tileset4) 
(send texture-handler add-texture 50x50_stratagus_tileset3) 
(send texture-handler add-texture 50x50_stratagus_tileset2) 
(send texture-handler add-texture 50x50_stratagus_tileset1) 

;;End adding textures to texturelist
;;SETUP
(send current-level-panel set-text! (number->string (send texture-handler get-layer)))
(send current-texture-panel set-texture! (send texture-handler get-active))
(send current-texture-panel set-text! (number->string (send texture-handler get-current-number)))
(eval-text-file "new_act_parameters.txt")
(eval-text-file "rename_to_save.txt")
(transition act-name)
(send camera-obj move-me (list 10 20 20))
(display (send camera-obj my-pos))
;;END SETUP  
;; tick!: -> void
(define (tick!)
  (send MAIN-CANVAS refresh))



(define (paint! a-canvas dc)
  (send dc scale *scale* *scale*)
  (send dc set-background (make-object color% 255 255 255))
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
                    (send dc draw-bitmap (send texture get-current-texture) 0 0)  
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
            ;;(display  offset)
            ;;(display "    ")
            ;;(display (+ (- (/ (car windowsize) 2) (round (/ (car size) 2))) (car offset)))
            ;;(display "\n")
            (cond
              ((eq? anchor 'topleft)
               (send dc translate (car offset) (cdr offset))
               (Draw-panel-help obj size)
               (send dc translate (- (car offset)) (- (cdr offset))))
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