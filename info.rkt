#lang info
(define collection "scribble-frog-helper")
(define deps '("base" "gregor" "timable" "frog" "at-exp-lib" "scribble-lib" "racket-doc"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/scribble-frog-helper.scrbl" ())))
(define pkg-desc "scribble helper functions especially for writing blogs with frog")
(define version "0.1")
(define pkg-authors '("Yanying Wang"))
(define raco-commands '(("frog/helper" (submod scribble-frog-helper main) "generate a frog Scribble Blog post with extended Helper functions" #f)))
