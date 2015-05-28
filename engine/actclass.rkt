#lang racket
(provide (all-defined-out))
(require "leveldatastructure.rkt")
(require "supportfunctions.rkt")

#|
an act can be considered to be the world
it contains all data the game uses, and as such is given as an argument to the function draw to be drawn on the screen
it is also the master of the world, it has the final say on everything
for example if an act thinks an object is at a certain place then that object is there and nowhere else
in a traditional game engine (ex. Quake) you could consider the act to be the server with every object acting as clients

acts are objects and thus not only contains all the data but also the most essential functions for accessing and modifying that data
thus if the position or existance of an object within the world is to be changed this needs to be done by the act in use
other objects can only change data internal to themselves or other objects, world data can never be changed by anything but an act
(unless you write some really ugly code which accesses the levels directly (see leveldatastructure.rkt) but this should not be done)
|#

(define act%
  (class object%
    (super-new)
    (init-field [type 'game-act]
                [name #f]
                [levels '()]) ;levels contains all the world data as implemented in levels using leveldatastructure.rkt
    (define/public (get-obj-at-pos position)
      ;takes a 3-dimensional position as argument implemented as a list (level-coordinate y-coordinate x-coordinate)
      ;the function returns the object at that position
      (level-get-val-from-pos (mnth (lvl-cor position) levels) ;returns the correct level
                              (cdr position))) ;levels are 2D and as the position is 3D it needs to be reduced to a 2D position
    (define/public (get-obj-pos obj)
      ;takes an object as argument and then finds its position
      ;if it doesn't have a position it returns #f (which means it does not exist in the world)
      (define (get-obj-pos-help lvls obj level-cord)
        ;traverses all levels looking for the object, level-cord is used as away of remembering which level we are in
        (if (null? lvls)
            #f
            (let ((in-level (level-find-obj (mcar lvls) obj))) ;gives level-find-obj a level and the object being searched for
              (if in-level ;if the object exists it is #t otherwise #f
                  (cons level-cord in-level) ;this returns a 3D position, as in-level will be a 2D position
                  (get-obj-pos-help (mcdr lvls) ;if the object hasn't been found it just keeps looking in the next level
                                    obj
                                    (+ level-cord 1))))))
      (get-obj-pos-help levels obj 1))
    (define/public (get-type) type)
    ;a way for other functions to find out which type of act this is, primarily used by set-pos! (see granpa.rkt)
    (define/public (move-obj obj old-cor new-cor)
      ;moves an object within the world, can also be used for removing objects but easier to use remove-obj in that case
      ;also used for adding objects to the world, in that case old-cor will be #f
      (if (valid-pos? new-cor)
          (if (available? new-cor) ;if the position is already in use it can not move there (this is essentially implementation of collision detection)
              (if (false? old-cor) 
                  ;if the current position is #f then we do not need to remove it from its current position
                  (begin (level-set-object-at-pos! (get-level new-cor)
                                                   (cdr new-cor) ;levels need 2D positions
                                                   obj)
                         (send obj set-pos! new-cor this)) ;tells the object about its new position
                  (begin (level-set-object-at-pos! (get-level new-cor)
                                                   (cdr new-cor)
                                                   obj)
                         (level-clear-pos! (get-level old-cor) (cdr old-cor)) ;removes the object from the old position
                         (send obj set-pos! new-cor this)))
              (void))
          (error "not a valid position")))
    (define/public (available? cor)
      ;checks is a position is empty and thus available to be occupied by an object
      (null? (get-obj-at-pos cor)))
    (define/private (get-level pos)
      ;returns the desired level
      ;pos is a 3D position (level-coordinate y-coordinate x-coordinate)
      (mnth (lvl-cor pos) levels))
    (define/public (remove-obj obj pos)
      ;faster than move-obj but only used for removing objects from the world
      ;takes as argument an object and its position as 3D coordinate
      (if (false? pos)
          (void)
          (if (eq? obj (get-obj-at-pos pos)) ;makes sure the object actually is at that position before we remove it
              (begin (level-clear-pos! (get-level pos) (cdr pos))
                     (send obj set-pos! #f this))
              (void))))
    (define/public (get-levels)
      ;returns the complete level datastructure
      levels)
    (define/public (get-name)
      name)
    ;Why do these exist? aren't these just worse implementations of move-obj and remove-obj?
    ;flag for removal!
    
    ;these functions are used by the level editor as currently implemented
    (define/public (add-texture-obj cor obj)
      ;adds a texture to a position
      (level-set-object-at-pos! (get-level cor)
                                (cdr cor)
                                obj))
    (define/public (remove-texture-obj cor)
      ;removes a texture from a position
      (level-set-object-at-pos! (get-level cor) 
                                (cdr cor)
                                '()))))
    
    

