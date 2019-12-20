#lang scribble/manual

@require[@for-label[scribble-frog-helper
                    (except-in racket/base date)]
         scribble/eval]


@(define my-eval
   (make-eval-factory '(scribble-frog-helper
                        timable/convert
                        timable/gregor)))


@title{scribble-frog-helper}
@author[(author+email "Yanying Wang" "yanyingwang1@gmail.com")]

@defmodule[scribble-frog-helper]{
racket[Scribble] helper functions especially for writing blogs with racket[frog]. Related to:
@itemlist[
@item{@other-doc['(lib "scribblings/scribble/scribble.scrbl")]}
@item{@other-doc['(lib "frog/frog.scrbl")]}
]}

INDEX:
@(table-of-contents)

@section{raco cmd}
Install this package first and then run
@nested[#:style 'inset]{@exec{$ raco frog/hp -N title}}
to generate a scribble post with all the functions defined by this lib.



@section{examples}
a practical usage within a blog post:
@codeblock|{
#lang scribble/manual

@title{道德经}
@date{-600} @;公元前600年
@tags{哲学 思辨}

@essay{
逍遥游
-600-1-18
北冥有鱼，其名为鲲。
鲲之大，不知其几千里也；
化而为鸟，其名为鹏。
鹏之背，不知其几千里也。
}

@essay{
马蹄
-600-2-30
马，蹄可以践霜雪，毛可以御风寒，
龁草饮水，翘足而陆，此马之真性也。
虽有义台路寝，无所用之。
}
}|

And I also have a blog post using this lib, you can check @hyperlink["https://yanyingwang.github.io/2007/03/-%E6%88%91%E8%AF%B4.html" "that"] for the html shown result.


@section{procedures}
@examples[
#:eval (my-eval)
@; @#reader scribble/comment-reader

@title{a test post with scribble-frog-helper}
@date{ 2019-1-1 12:01}
@tags{tag1 tag2 tag3}

@essay{
逍遥游
2019-12-18
北冥有鱼，其名为鲲。
鲲之大，不知其几千里也；
化而为鸟，其名为鹏。
鹏之背，不知其几千里也。
}
]


@defproc[(title [str string?]) list?]{
return list of elements rendered to be: @litchar{Title: the post title}
}

@defproc[(date [str string?]) list?]{
return list of elements rendered to be: @litchar{Date: the post date}
}

@defproc[(tags [str string?]) list?]{
return list of elements rendered to be: @litchar{Tags: tag1 tag2 tag3}
}

@defproc[(meta [str string?]) list?]{
return list of elements with @racket[title], @racket[date], and @racket[tags].
}

@defproc[(essay [str string?])
          list?]{
return an essay for the @racket[str].
}
