#lang racket

(require rackunit)

; (define (sum-of-biggest-squares a b c)
;   (sum-of-squares (max a b) (max (min a b) c)))

(define (square a) (* a a))

(define (sum-of-squares a b)
  (+ (square a) (square b)))

(define (sum-of-biggest-squares a b c)
  (cond ((= (min a b c) a) (sum-of-squares b c))
        ((= (min a b c) b) (sum-of-squares a c))
        (#t (sum-of-squares a b))))

(check-equal? (sum-of-biggest-squares 5 10 3) 125 "value 1")
(check-equal? (sum-of-biggest-squares 5 3 10) 125 "value 2")
(check-equal? (sum-of-biggest-squares 10 3 5) 125 "value 3")
(check-equal? (sum-of-biggest-squares 10 5 3) 125 "value 4")
(check-equal? (sum-of-biggest-squares 3 5 10) 125 "value 5")
(check-equal? (sum-of-biggest-squares 6 6 10) 136 "equal values")
