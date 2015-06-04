#lang racket
(require "supportfunctions.rkt")
(require "globals.rkt")
(provide (all-defined-out))

;library containing all baseclasses used to create new classes with specific usage
;will replace the following files: 
;textureclass.rkt
;granpaclass.rkt
;charclass.rkt
;PCclass.rkt

(define texture%
  ;base class for everything
  ;as an act can contain hundreds of the same texture moving them could cause a lot of problems
  ;as the texture can also be in several places at the same time it should not know its position
  ;cause it can have a few hundred positions at the same time
  ;the only point of this class is to make a granpa% that does not have any idea about where it is and cannot be moved
  (class object%
    (super-new)
    (init-field [position #f]
                [animations '()]
                [texture #f])
    (define/public (my-pos)
      #f)
    (define/public (get-current-texture)
      ;simple texturehandling
      ;if more advanced functionality is needed use override
      texture)))

(define granpa%
  ;parentobject for all accessible "objects" in the world such as characters (NPC and PC), chests etc
  ;includes basefunctionality such as moving around objects in the world, checking their position
  ;and interacting with the object
  (class texture%
    (super-new)
    (init-field [name "unknown"])
    (inherit-field position)
    (define/override (my-pos)
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
    
    ;DEBUG!!!!!!!
    (define/public (debug-get-pos)
      ;this should never be used except for debugging
      ;as the position returned may be wrong
      position)))

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
(define PC%
  (class char%
    (super-new)
    (init-field [equipment #f] ;preparation for future versions of the engine, currently not used
                [stats #f]) ;currently not used either
    (inherit-field name)
    (inherit-field facing)
    (inherit move-me)
    (inherit my-pos)
    (inherit inc-pos)
    (define/override (interact)
      ;differs from interact for all other characters in that it makes another object use its interact function
      ;void is not invoked as a function because in the current implementation the demo-game invokes the function returned by interact
      ;this is to avoid some bugs, might be changed in the future
      (let ((world-object (get-world-object)))
        (if (null? world-object)
            void
            (send world-object interact))))
    (define/private (get-world-object)
      ;returns the object which the character is facing
      (send *current-act* get-obj-at-pos (inc-pos)))
    (define/override (walk dir)
      ;compared to the implementation in character% this allows the person playing the game greater control of the character
      ;by making sure you can change direction your character is facing without moving
      ;it is however not wanted when scripting movement of an NPC as it makes it harder to implement a route
      (if (eq? dir facing)
          (move-me (inc-pos))
          (set! facing dir)))))