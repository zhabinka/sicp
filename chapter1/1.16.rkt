#lang racket

(require "../common.rkt")
(require rackunit)

(define (fast-expt base expt)
  (define (iter-fast-expt b counter a)
  (cond ((= counter 0) a)
        ((even? counter) (iter-fast-expt (square b) (/ counter 2) a))
        (else (iter-fast-expt b (- counter 1) (* a b)))))

  (iter-fast-expt base expt 1))

(check-eq? (fast-expt 0 0) 1)
(check-eq? (fast-expt 0 1) 0)
(check-eq? (fast-expt 2 0) 1)
(check-eq? (fast-expt 3 2) 9)
(check-eq? (fast-expt 2 10) 1024)
