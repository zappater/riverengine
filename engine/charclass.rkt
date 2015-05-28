#lang racket
(require "granpaclass.rkt")
(require "supportfunctions.rkt")
(require "globals.rkt")
(provide (all-defined-out))

(define char%
  ;the basic class for every character, it is good enough for use as an NPC however it cannot be used for a PC (see PCclass)
  (class granpa%
    (super-new)
    (init-field [hp 100]
                [description "some existances just aren't that interesting"]
                [inventory #f]
                [use (void)]
                [facing 'up]) ;values are 'up, 'down, 'right, 'left 
    ;facing indicates the direction the character is looking, it is used for choosing texture to use and moving characters
    (inherit-field position)
    (inherit-field texture)
    (inherit move-me)
    (inherit my-pos)
    (define/public (walk direction)
      ;direction is a symbol, see above
      ;then it uses move-me from granpa% but with only inc-pos thus limiting the possible values
      (set! facing direction)
      (move-me (inc-pos)))
    (define/public (inc-pos)
      ;this checks the value of facing and then depending on its value increments the position of the character appropriately
      ;origin is calculated from the top left corner of the screen, with the y-axis inverted (standard way to do graphics)
      ;thus moving up decrements the y coordinate
      ;the else clause just exists incase something has gone wrong, such as facing having taken the value 'dwn
      ;it also check if the position is #f, if it is the character does not have a place in the world and can thus not be moved
      (let ((at (my-pos)))
        (cond ((false? at) (void))
              ((eq? facing 'up) (list (lvl-cor at) (- (y-cor at) 1) (x-cor at)))
              ((eq? facing 'down) (list (lvl-cor at) (+ (y-cor at) 1) (x-cor at)))
              ((eq? facing 'right) (list (lvl-cor at) (y-cor at) (+ (x-cor at) 1)))
              ((eq? facing 'left) (list (lvl-cor at) (y-cor at) (- (x-cor at) 1)))
              (else (void)))))
    (define/public (get-description)
      description)
    (define/public (get-hp)
      hp)
    (define/public (change-hp modifier)   
      ;this along with all the other hp functions is preparation for a combat system
      ;this simply allows a object to change another characters hp and if it is <1 the object is removed from the world
      (set! hp (+ hp modifier))
      (if (alive?)
          (void)
          (send *current-act* remove-obj this (my-pos))))
    (define/private (alive?)
      (> hp 0))
    (define/override (get-current-texture)
      ;implements texture handling for characters, it makes sure there is a texture for all four directions a character can face
      ;it depends on the init-field texture having been given a list of textures
      (cond ((not texture) #f)
            ((eq? facing 'up) (first texture))
            ((eq? facing 'down) (second texture))
            ((eq? facing 'left) (third texture))
            ((eq? facing 'right) (fourth texture))))
    (define/override (interact)
      ;if the character isn't in the world or dead it should not be able to do anything
      ;otherwise it returns its init-field use which can be a function
      (if (or (false? position) (not (alive?)))
          (void)
          use)))) 