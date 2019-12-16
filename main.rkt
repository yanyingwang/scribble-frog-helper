#lang racket/base

(module+ test
  (require rackunit))

;; Notice
;; To install (from within the package directory):
;;   $ raco pkg install
;; To install (once uploaded to pkgs.racket-lang.org):
;;   $ raco pkg install <<name>>
;; To uninstall:
;;   $ raco pkg remove <<name>>
;; To view documentation:
;;   $ raco docs <<name>>
;;
;; For your convenience, we have included LICENSE-MIT and LICENSE-APACHE files.
;; If you would prefer to use a different license, replace those files with the
;; desired license.
;;
;; Some users like to add a `private/` directory, place auxiliary files there,
;; and require them in `main.rkt`.
;;
;; See the current version of the racket style guide here:
;; http://docs.racket-lang.org/style/index.html

;; Code here


(require racket/list
         racket/string
         racket/format
         gregor
         timable/gregor
         scribble/core)


(define (frog/post/title . text)
  (list* "Title: " text))

(define (frog/post/date . text)
  (list "Date: " (datetime->iso8601 (parse/datetime (car text)))))

(define (frog/post/tags . text)
  (list "Tags: " (string-join (string-split (car text)) ", ")))

(define (frog/post/meta . text)
  (let* ([lst (string-split (string-join text) "\n" #:trim? #t)]
         [title (first lst)]
         [date (datetime->iso8601 (parse/datetime (second lst)))]
         [tags (string-join (string-split (third lst)) " ,")])
    (list "Title: " title "\n"
          "Date: " date "\n"
          "Tags: " tags)))


(define (essay-block . text)
  (let* ([seperator1 (index-of text "\n")]
          [lst1 (take text seperator1)]
          [lst1r (drop text (add1 seperator1))]
          [seperator2 (index-of lst1r "\n")]
          [lst2 (take lst1r seperator2)]
          [lst2r (drop lst1r (add1 seperator2))])
    (list (element 'bold (element 'larger lst1))
          "\n"
          (element 'smaller (flatten (list "(" lst2 ")")))
          (element 'newline '())
          (map (lambda (i)
                  (if (eq? i "\n")
                      (element 'newline '())
                      i))
                lst2r))))


(module+ test
  ;; Any code in this `test` submodule runs when this file is run using DrRacket
  ;; or with `raco test`. The code here does not run when this file is
  ;; required by another module.

  (check-equal? (+ 2 2) 4))

(module+ main
  ;; (Optional) main submodule. Put code here if you need it to be executed when
  ;; this file is run using DrRacket or the `racket` executable.  The code here
  ;; does not run when this file is required by another module. Documentation:
  ;; http://docs.racket-lang.org/guide/Module_Syntax.html#%28part._main-and-test%29

  (require racket/cmdline)
  (define who (box "world"))
  (command-line
    #:program "my-program"
    #:once-each
    [("-n" "--name") name "Who to say hello to" (set-box! who name)]
    #:args ()
    (printf "hello ~a~n" (unbox who))))
