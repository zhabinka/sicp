#lang racket

(require "../common.rkt")
(require rackunit)

(define (fast-mul a b)
  (define (iter b counter a)
    (cond ((= counter 0) a)
          ((even? counter) (iter (double b) (halve counter) a))
          (else (iter b (- counter 1) (+ a b)))))
  (iter-fast-mul a b 0))

(check-equal? (fast-mul 0 5) 0)
(check-equal? (fast-mul 1 1) 1)
(check-equal? (fast-mul 40 30) (* 40 30))
