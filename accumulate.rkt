#lang racket

(define (accumulate operation initial-term num-of-terms next-operation)
  (define (accumulate-iter result term counter)
    (let ((current-result (operation result term)))
      (if (= counter num-of-terms)
	  result
	  (accumulate-iter current-result (next-operation term) (+ counter 1)))))
  (accumulate-iter initial-term (next-operation initial-term) 1))

;; calculates 2 + 4 + 6
(accumulate + 2 3 (lambda (x) (+ x 2)))

;; calculates 2 + 4 + 16 + 256
(accumulate + 2 4 (lambda (x) (* x x)))

;; concatenates all letters of english alphabet
(accumulate string-append "a" 26
	    (lambda (letter) (string
			      (integer->char (+ 1 (char->integer (string-ref letter 0)))))))

