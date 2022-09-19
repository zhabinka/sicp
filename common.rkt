#lang racket

(provide square sum-of-squares average cube halve double)

(define (square a)
 (* a a))

(define (sum-of-squares a b)
 (+ (square a) (square b)))

(define (average a b divisor)
 (/ (+ a b) divisor))

(define (cube a)
    (* a a a))

(define (halve num) (/ num 2))

(define (double num) (* num 2))
