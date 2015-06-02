#lang racket
(provide (all-defined-out))


(define arena ((lambda (lst)  (new act% [levels lst])) (mcons lvl1  (mcons lvl2  (mcons lvl3  (mcons lvl4  (mcons lvl5  (mcons lvl6  (mcons lvl7  (mcons lvl8  (mcons lvl9  (mcons lvl10  '())))))))))))) 