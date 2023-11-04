;Isaac Ulises Ascencio Padilla
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

;fibonacci 5

;Teorema de pitagoras para la hipotenusa
(defun hipotenusa (x y)
  (let ((x1 (cuadrado x))
        (y1 (cuadrado y)))
    (sqrt (+ x1 y1))))

;hipotenusa 2 5


;Formula general
(defun fgeneral (a b c)
  (let ((b1 (cuadrado b))
        (a1 (* 4 a c))
        (a2 (* 2 a)))
    (list (/ (+ (- b) (sqrt (- b1 a1))) a2)
          (/ (- (- b) (sqrt (- b1 a1))) a2))
  )
)

;fgeneral 3 -5 2