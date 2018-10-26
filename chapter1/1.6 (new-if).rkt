#lang lazy

; Процедура new-if сначала вычисляет переданные ей формальные параметры
; и только после этого начинает работать сама и запускает cond, который
; содержится внутри. В данном случае new-if так и не будет запущен и 
; зациклится на бесконечном вычислении sqrt-iter.
; Чтобы обойти апликативный порядок вычисления, мы объявляем язык #lang lazy
; вместо #lang racket/base.

(require "../common.rkt")

(define (new-if predicate then-clause else-clause)
	(cond (predicate then-clause)
				(else else-clause)))
				
(define (sqrt x)
	(sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
	(new-if (good-enough? guess x)
			    guess
					(sqrt-iter (improve guess x) x)))

(define (improve guess x)
	(average guess (/ x guess)))

(define (good-enough? x y)
	(< (abs (- (square x) y)) 0.0001))

; (sqrt 9)
