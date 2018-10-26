#lang racket

(provide square sum-of-squares average)

(define (square a)
 (* a a))

(define (sum-of-squares a b)
 (+ (square a) (square b)))

(define (average a b)
 (/ (+ a b) 2))
