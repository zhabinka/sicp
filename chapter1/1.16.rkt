#lang racket

(require "../common.rkt")
(require rackunit)

(define (iter-expt-fast b counter a)
  (cond ((= counter 0) a)
        ((even? counter) (iter-expt-fast (square b) (/ counter 2) a))
        (else (iter-expt-fast b (- counter 1) (* a b))))
)

(define (expt-fast base expt)
  (iter-expt-fast base expt 1)
)

(check-eq? (expt-fast 0 0) 1)
(check-eq? (expt-fast 0 1) 0)
(check-eq? (expt-fast 2 0) 1)
(check-eq? (expt-fast 3 2) 9)
(check-eq? (expt-fast 2 10) 1024)
