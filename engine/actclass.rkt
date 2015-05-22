#lang racket
(provide (all-defined-out))
(require "leveldatastructure.rkt")
(require "supportfunctions.rkt")
(define act%
  (class object%
    (super-new)
    (init-field [type 'game-act]
                [name #f]
                [levels '()]) ;det här är det viktiga i act... allt annat är bara hjälpfunktioner
    
    (define/public (get-obj-at-pos position)
      (level-get-val-from-pos 
       (mnth (lvl-cor position) levels) ;returnerar rätt level
       (cdr position))) ;levels är två dimensionella och position är implementerad som (level y-cor x-cor) så vi ger bara funktionen (y-cor x-cor)
    
    (define/public (get-obj-pos obj)
      (define (get-obj-pos-help lvls obj level-cord)
        (if (null? lvls)
            #f
            (let ((in-level (level-find-obj (mcar lvls) obj))) ;ger level-find-obj en level och vårt objekt
              (if in-level ;om objektet existerar så är den sann
                  (cons level-cord in-level) ;i så fall returnerar vi positonen
                  ;annars går vi vidare i listan
                  (get-obj-pos-help (mcdr lvls)
                                    obj
                                    (+ level-cord 1))))))
      (get-obj-pos-help levels obj 1))
    (define/public (get-type) type) ;ett sätt för andra funktioner att ta reda på vilken typ av akt det är, används främst av objektens funktion "set-pos!"
    
    (define/public (move-obj obj old-cor new-cor)
      (if (valid-pos? new-cor)
          (if (available? new-cor) ;om positionen är upptagen ska vi inte tillåta att objektet rör sig dit
              (if (false? old-cor) 
                  ;om positionen är #f behöver vi inte rensa den gamla positionen
                  ;men har den en position så måste vi rensa den, i så fall gör vi false
                  (begin (level-set-object-at-pos! (get-level new-cor) ;skickar in rätt level
                                                   (cdr new-cor) ;skickar in positionen som två-dimensionell data
                                                   obj)
                         (send obj set-pos! new-cor this))
                  (begin (level-set-object-at-pos! (get-level new-cor) ;skickar in rätt level
                                                   (cdr new-cor) ;skickar in positionen som två-dimensionell data
                                                   obj)
                         (level-clear-pos! (get-level old-cor) (cdr old-cor)) ;rensar den gamla positionen
                         (send obj set-pos! new-cor this)))
              (void))
          (error "not a valid position")))
    
    (define/public (available? cor) ;kollar om en plats är ledig
      (null? (get-obj-at-pos cor))) ;public ifall objekt vill använda den men inte skadligt ifall annars
    
    (define/private (get-level pos)
      (mnth (lvl-cor pos) levels))
    
    (define/public (remove-obj obj pos)
      (if (false? pos)
          (void)
          (if (eq? obj (get-obj-at-pos pos)) ;om objektet verkligen är på den positionen, då tar man bort objektet, annars inte
              (begin (level-clear-pos! (get-level pos) (cdr pos))
                     (send obj set-pos! #f this))
              (void))))
    (define/public (get-levels)
      levels)
    (define/public (get-name)
      name)))

