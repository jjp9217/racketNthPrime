#lang racket

;author: Jesse Pingitore
;submitted late with extension due to sickness

;Outermost wrapper. "Main", gives the recursing function it's initial args.
(define (nthPrime n)
  (last (nthW n 3 '(2)));salt w/ first prime, 2
)

;Actually find the nth prime number.
;n - limit
;c - current canidate
;past - known reasonably primes
(define (nthW n c past)
  (if (= (length past) n);primes met
      past ;return primes

      ;else - (this will increment c needlessly on the last pass)
      (nthW n (+ 1 c) (test c past)
      )
   )
)

;Canidate tester - is c prime?
;c - candiate
;past - all known past primes
(define (test c past) ;no null test needed, either clause eventually is true
  (if (> (* (car past) (car past)) c);if current prime > c
      (append past (list c)) ;add c, c is prime
      
      ;else
      (if (= 0 (modulo c (car past)));if c % prime == 0
          past ;c is composite, don't add it
          
          ;else indeterminate, try with next higher prime in list
          (cons (car past) (test c (cdr past)))
      )
   )
)


(nthPrime 100)




