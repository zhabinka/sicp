#lang racket

(require "../common.rkt")
(require rackunit)

(define (cube-root x)
    (if (= x 0)
        0
	    (cube-root-iter 1.0 0.1 x)))

(define (cube-root-iter guess guess-previous x)
	(if (good-enough? guess guess-previous)
			guess
			(cube-root-iter (improve guess x) guess x)))

(define (improve guess x)
	(average (/ x (square guess)) (* 2 guess) 3))

(define (good-enough? current previous)
	(< (abs (/ (- current previous) current)) 0.0000001))

(check-equal? (cube-root (cube 156)) 156.0 "integer")
(check-equal? (cube-root (cube 7465.876)) 7465.876 "float")
(check-equal? (cube-root (cube -67)) -67.0 "negative")
(check-equal? (cube-root 0) 0 "zero")