;Common LISP
;List Processing

(write-line "Hola mundo de nuevo")

(defun cuadrado (x) (* x x))

(defun patito ()
  (setq variable (read))
  (print variable)
)

(defun compa (x y)
  (if (> x y)
      (format t "~d es mayor" x)
    (format t "~d es mayor" y)
    )
)

(defun algo (x)
  (case x
    (1 (princ "Enero"))
    (2 (princ "Febrero"))
    )
)

(defun ciclo (ino fin aum)
  (loop 
    (write ini)
    (setq ini (+ ini aum))
    (terpri)
    (when (>= ini fin)
      (return ini)
    )
  )
)

(defun ciclo2 (ino fin aum)
  (dotimes (ini fin) 
    (write ini)
    (setq ini (+ ini aum))
    (terpri)
    (when (>= ini fin)
      (return ini)
    )
  )
)

(setf (symbol-function 'cuad)
  (lambda (x) (* x x))
)

;Factorial
(defun factorial (n)
  (if (> n 1)
    (* n (factorial(- n 1)))
  1)
)

;Fibonacci
(defun fibonacci (n)
  (if (<= n 1)
    n
    (+ (fibonacci (- n 1)) (fibonacci (- n 2)))  
  )
)