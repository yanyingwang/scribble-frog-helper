#lang scribble/manual

@require[@for-label[scribble-bl-helper
                    racket/base]]


@(define my-eval
   (make-eval-factory '(scribble-bl-helper
                        timable/convert
                        timable/gregor)))


@title{scribble-bl-helper}
@author[(author+email "Yanying Wang" "yanyingwang1@gmail.com")]

@defmodule[scribble-bl-helper]{
scribble helper functions especially for writing blogs
}


Install this package and run @racketcode{raco frog/hp -N title} to generate a scribble post with all the functions defined in this lib.


@examples[
#:eval (my-eval)
(title "a test post with scribble-bl-helper")
(date "2019-1-1")
(date "2019-1-1 12:01")
]



@defproc[(title [str string?]) string?]{
return text: @literal{Title: the post title}
}


@defproc[(date [str string?]) string?]{
return text: @literal{date: the post date}
}


@defproc[(tags [str string?]) string?]{
return text: @literal{tags: tag1 tag2 tag3}
}
