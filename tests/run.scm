(import chibi-generic test)

(test-begin "chibi-generic")

(test-group "add"
  (define-generic add)
  (define-method (add (x number?) (y number?))
    (+ x y))
  (define-method (add (x string?) (y string?))
    (string-append x y))
  (define-method (add x (y list?))
    (append x y))
  (test 4 (add 2 2))
  (test "22" (add "2" "2"))
  (test '(2 2) (add '() '(2 2)))
  (test '(2 2) (add '(2) '(2)))
  (test '(2 2) (add '(2 2) '()))
  (test-error (add #f '(2)))
  (test-error (add #(2) #(2))))

(test-group "mul"
  (define-generic mul)
  (define-method (mul (x number?) (y number?))
    (* x y))
  (define-method (mul (x inexact?) (y inexact?))
    (+ (* x y) 0.1))
  (define-method (mul (x exact?) (y exact?))
    (inexact->exact (call-next-method)))
  (test 21 (mul 3 7))
  (test 21.0 (mul 3.0 7))
  (test 21.0 (mul 3 7.0))
  (test 21.1 (mul 3.0 7.0)))

(test-end)
