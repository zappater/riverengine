#lang racket
(require "supportfunctions.rkt")
(require "actclass.rkt")
(require "globals.rkt")
(provide (all-defined-out))

(define granpa%
  ;parentobject for all "objects" in the world such as characters (NPC and PC), chests etc
  ;includes basefunctionality such as moving around objects in the world, checking their position
  ;adding textures and interacting with the object
  (class object%
    (super-new)
    (init-field [position #f]
                [name #f]
                [animations '()]
                [texture #f])
    (define/public (my-pos)
      ;first it asks the current act if the object is where it thinks it is, this operation is relatively quick
      ;if it is then it just returns its position
      ;but if the object isn't where it thinks it is then it asks the act to find out where it is
      ;this is a much slower procedure, which is why we try to avoid using it, it is necessary as the act is the master
      (if (and (valid-pos? position) (eq? (send *current-act* get-obj-at-pos position) this))
          position
          (begin (update-pos!)
                 position)))
    (define/private (update-pos!)
      ;slow procedure, requires the act to go through all levels it contains until it finds the object
      ;however it is always correct, by definition as an object is where an act thinks it is and never anywhere else
      (set! position (send *current-act* get-obj-pos this)))
    (define/public (set-pos! new-pos obj)
      ;takes a 3D position as a list in the format (lvl-cor, y-cor, x-cor) and an object
      ;first we check if the object is a game-act which uses the function, you can consider it semi-private
      ;if a game-act is using the function it updates the objects position variabel otherwise it doesn't do anything
      (if (eq? (send obj get-type) 'game-act) 
          (set! position new-pos) 
          (void))) 
    (define/public (move-me position)
      ;takes a 3D position as a list in the format (lvl-cor, y-cor, x-cor)
      ;this function is only intended to be used by objects such as teleporters, a person shall never have direct access to it
      ;instead we use this function to implement movement in the character class
      (send *current-act* move-obj this (my-pos) position))
    (define/public (get-name)
      name)
    (define/public (interact) 
      ;all objects can be interacted with but as default nothing happens
      ;use override to provide functionality
      void)
    (define/public (get-current-texture)
      ;simple texturehandling
      ;if more advanced functionality is needed use override
      texture) 
    
    ;DEBUG!!!!!!!
    (define/public (debug-get-pos)
      ;this should never be used except for debugging
      ;as the position returned may be wrong
      position)))

