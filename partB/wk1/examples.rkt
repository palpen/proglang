#lang racket

(provide (all-defined-out))

;(define (max-of-list xs)
;  cond [(null? xs) (error "max-of-list given empty list")]
;       [(null? (cdr xs)) (car xs)]
;       [#t (let ([tlans (max-of-list (cdr xs))])
;             (if (> tlans (car xs))
;                 tlans
;                 (car xs)))])

;(define (badif e1 e2 e3)
;  (if e1 e2 e3))
;
;(define (factorial-bad x)
;  (badif (= x 0)
;         1
;         (* x (factorial-bad (- x 1)))))

;(define (my-delay f)
;  (mcons #f f))
;
;(define (my-force th)
;  (if (mcar th)
;      (mcdr th)
;      (begin (set-mcar! th #t)
;             (set-mcdr! th ((mcdr th)))
;             (mcdr th))))
;
;(define (my-mult x y-thunk)
;  (cond [(= x 0) 0]
;        [(= x 1) (y-thunk)]
;        [#t (+ (y-thunk) (my-mult (- x 1) y-thunk))]))
;
;(my-mult 2 (let ([x (my-delay (lambda () 3))]) (lambda () (my-force x))))

; streams

;; (define ones (lambda () (cons 1 ones)))
;; (define (f x) (cons x (lambda () (f (+ x 1)))))
;; (define (bad-f x) (cons x (bad-f (+ x 1))))
(define (stream-maker fn arg)
  (letrec ([f (lambda (x)
                (cons x (lambda () (f (fn x arg)))))])
    (lambda () (f arg))))
(define ones (stream-maker (lambda (x y) 1) 1))
(define nats (stream-maker + 1))
(define powers-of-two (stream-maker * 2))

(define (number-until stream tester)
  (letrec ([f (lambda (stream ans)
                (let ([pr (stream)])
                  (if
                   (tester (car pr))
                   ans
                   (f (cdr pr) (+ ans 1)))
                  ))])
    (f stream 1)))

