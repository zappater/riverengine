#lang racket
(require "supportfunctions.rkt")
(require "globals.rkt")


(define dialog-handle 
  (class object%
    
(define dialog%
  (class object%
    (super-new)
    (init-field
     [node-lst '()]
     [current-node #f]
     [current-leaf-lst '()]
     [active #f])
    (define/public (add-node node leafs-lst)
      (set! node-lst (cons (list (+ 1 (length node-lst)) node leafs-lst))))
    (define/public (choose-option num)
      (if current-node
          (let ((action (send current-node action num))
                (next-node-num (nth num current-leaf-lst)))
            (if (eq? action 'end)
                (begin
                  (send dialog-handler dialog-active #f)
                  (set! acitive #f)
                  (set! current-node (car (cdr (assoc 1 nodes-lst))))
                  (set! current-leaf-lst (car (cdr (cdr (assoc 1 nodes-lst))))))
                (begin
                  (action)
                  (set! current-nude (car (cdr (assoc next-node-num nodes-lst))))
                  (set! current-leaf-lst (car (cdr (cdr (assoc next-node-num nodes-lst))))))))
          (error this "is not initialized")))
    (define/public (initialize)
      (set! current-node (car (cdr (assoc 1 nodes-lst))))
      (set! current-leaf-lst (car (cdr (cdr (assoc 1 nodes-lst))))))
    (define/public (get-display-info)
      (list (send current-node get-text) (send current-node get-option-text)))))
    
      
      
      
      