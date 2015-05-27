#lang racket
(require "globals.rkt")
(require "UIdefines.rkt")
(require racket/gui/base)
(provide (all-defined-out))

(define local-nth 
  ;fungerar annorlunda, tillskillnad från vår andra nth
  ;i supportfunctions skickar den här alltid tillbaka något
  (lambda (pos lst)
    (if (null? (cdr lst))
        (car lst)
        (if (<= pos 1)
            (car lst)
            (local-nth (- pos 1) (cdr lst))))))
;här definerar vi vårt UI för dialog
(define dialog-row1
  (new UIpanel%
       [offset (cons 4 4)]))
(define dialog-row2
  (new UIpanel%
       [offset (cons 4 18)]))
(define dialog-row3
  (new UIpanel%
       [offset (cons 4 32)]))
(define dialog-row4
  (new UIpanel%
       [offset (cons 4 46)]))
(define dialog-row5
  (new UIpanel%
       [offset (cons 4 70)]))
(define dialog-row6
  (new UIpanel%
       [offset (cons 4 84)]))
;här skapar vi bakgrunden till dialog UI
(define dialog-background
  (new UIpanel%
       [texture (read-bitmap "dialog_background.png")]))
;detta gör allt ovan till en enda UI grupp
(define dialog-bar
  (new UIpanelgroup%
       [uipanels (list dialog-background dialog-row1 dialog-row2 dialog-row3 dialog-row4 dialog-row5 dialog-row6)]
       [anchor 'bottomleft]
       [size (cons 400 110)]))

(define dialog-handle% 
  (class object%
    (super-new)
    (init-field
     [current-dialog #f])
    (define/public (display-dialog dialog)
      (let ((text (send dialog get-current-text))
            (options (send dialog get-current-options)))
        (begin
          (if (< (string-length text) 21)
              (send dialog-row1 set-text! text)
              (begin
                (send dialog-row1 set-text! (substring text 1 21))
                (if (< (string-length text) 41)
                    (send dialog-row2 set-text! (substring text 21))
                    (begin
                      (send dialog-row2 set-text! (substring text 21 41))
                      (if (< (string-length text) 61)
                          (send dialog-row3 set-text! (substring text 41))
                          (begin
                            (send dialog-row3 set-text! (substring text 41 61))
                            (if (< (string-length text) 81)
                                (send dialog-row4 set-text! (substring text 61))
                                (begin
                                  (send dialog-row4 set-text! (substring text 61 81))
                                  (if (< (string-length text) 101)
                                      (send dialog-row5 set-text! (substring text 81))
                                      (error "dialog text to long"))))))))))
          (send dialog-row6 set-text! options))))
    (define/public (dialog-active bol [dialog #f])
      (if bol
          (begin
            (send *current-ui* add-uipanel dialog-bar)
            (set! current-dialog dialog))
          (send *current-ui* remove-panel dialog-bar)))
    (define/public (choose-option num)
      (if current-dialog
          (send current-dialog choose-option num)
          (void)))))
(define dialog-handler (new dialog-handle%))



(define my-dialog%
  ;skulle heta dialog% men finns redan som inbyggd funktion
  (class object%
    (super-new)
    (init-field
     [node-lst '()]
     [current-node #f]
     [current-leaf-lst '()]
     [active #f])
    (define/public (add-node node leafs-lst)
      (set! node-lst (cons (list (+ 1 (length node-lst)) node leafs-lst) node-lst)))
    (define/public (choose-option num)
      (if current-node
          (let ((action (send current-node action num))
                (next-node-num (local-nth num current-leaf-lst)))
            (if (eq? action 'end) ;speciell symbol som motsvarar EOF för dialoger
                (begin
                  (send dialog-handler dialog-active #f)
                  (set! active #f)
                  (set! current-node (car (cdr (assoc 1 node-lst))))
                  (set! current-leaf-lst (car (cdr (cdr (assoc 1 node-lst))))))
                (begin
                  (action)
                  (set! current-node (car (cdr (assoc next-node-num node-lst))))
                  (set! current-leaf-lst (car (cdr (cdr (assoc next-node-num node-lst)))))
                  (send dialog-handler display-dialog this))))
          (error this "is not initialized")))
    (define/public (initialize-dialog)
      (begin
        (set! current-node (car (cdr (assoc 1 node-lst))))
        (set! current-leaf-lst (car (cdr (cdr (assoc 1 node-lst)))))))
    (define/public (get-current-text)
      (send current-node get-text))
    (define/public (get-current-options)
      (send current-node get-option-text))))



(define dialog-node%
  (class object%
    (super-new)
    (init-field
     [text ""]
     [option ""]
     [actions (list (void))])
    (define/public (action num)
      (local-nth num actions))
    (define/public (get-text) text)
    (define/public (get-option-text) option)))



