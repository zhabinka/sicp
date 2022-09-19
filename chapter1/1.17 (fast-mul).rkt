#lang racket

(require "../common.rkt")
(require rackunit)

(define (fast-mul a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-mul a (halve b))))
        (else (+ a (fast-mul a (- b 1))))))

(check-equal? (fast-mul 0 5) 0)
(check-equal? (fast-mul 1 1) 1)
(check-equal? (fast-mul 40 30) (* 40 30))
