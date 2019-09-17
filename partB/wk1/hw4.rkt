; Homework 4, Programming Languages Part B
; Author: Palermo Penano

#lang racket
(provide (all-defined-out)) ;; so we can put tests in a second file

; Problem 1
(define (sequence low high stride)
  (if (> low high)
      '()
      ((lambda () (cons low (sequence (+ low stride) high stride))))
      ))

; Problem 2
(define (string-append-map xs suffix)
  (map (lambda (elem) (string-append elem suffix)) xs))

; Problem 3
(define (list-nth-mod xs n)
  (cond [(< n 0) (error "list-nth-mod: negative number")]
        [(null? xs) (error "list-nth-mod: empty list")]
        [#t (let ([r (remainder n (length xs))])
             (car (list-tail xs r)))]))

; Problem 4
; Problem 5
; Problem 6
; Problem 7
; Problem 8
; Problem 9
; Problem 10
; Problem 11
