#lang scribble/manual

@require[@for-label[scribble-bl-helper
                    (except-in racket/base date)]
         scribble/eval]


@(define my-eval
   (make-eval-factory '(scribble-bl-helper
                        timable/convert
                        timable/gregor)))


@title{scribble-bl-helper}
@author[(author+email "Yanying Wang" "yanyingwang1@gmail.com")]

@defmodule[scribble-bl-helper]{
scribble helper functions especially for writing blogs with frog.
}


Install this package and run @litchar{raco frog/hp -N title} to generate a scribble post with all the functions defined in this lib.


@examples[
#:eval (my-eval)
(title "a test post with scribble-bl-helper")
(date "2019-1-1")
(date "2019-1-1 12:01")
(tags "tag1 tag2 tag3")
]



@defproc[(title [str string?]) string?]{
return text: @litchar{Title: the post title}
}


@defproc[(date [str string?]) string?]{
return text: @litchar{date: the post date}
}


@defproc[(tags [str string?]) string?]{
return text: @litchar{tags: tag1 tag2 tag3}
}
