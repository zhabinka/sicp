#lang racket

(require "../common.rkt")
(require rackunit)

(define (sqrt x)
	(if (= x 0)
		0
		(sqrt-iter 1.0 0.1 x)))

(define (sqrt-iter guess guess-previous x)
	(if (good-enough? guess guess-previous)
			guess
			(sqrt-iter (improve guess x) guess x)))

(define (improve guess x)
	(average guess (/ x guess) 2))

(define (good-enough? current previous)
	(< (abs (/ (- current previous) current)) 0.0000001))

(check-equal? (sqrt (square 156)) 156.0 "integer")
(check-equal? (sqrt (square 7465.8)) 7465.8 "float")
(check-equal? (sqrt (square -67)) 67.0 "negative")
(check-equal? (sqrt 0) 0 "zero")
