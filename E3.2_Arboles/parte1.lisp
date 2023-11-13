;Isaac Ulises Ascencio Padilla

;Representacion anidada
(setq arbol-b '(1 (2 (4) (5)) (3)))

;Con etiqueta y relaciones
(setq etq '(1 2 3 4 5 6 7))
(setq rel '((1 (1 3)) (2 (4 5)) (3 (6 7))))


;Ejemplo:
;       5
;      / \
;     3   7
;    / \   \
;   1   4   9

(setq arb '(5 (3 (1 () ()) (4 () ())) (7 () (9 () ()))))

(setq arb1 '(5 (left (3 (left (1 () ()) (right (4 () ())))) (right (7 () (right (9 () ())))))))


;Arbol
(setf tree1 '(1 . ((2 . nil).(3 . nil))))

(setf ar1 '(1 ((2((4 nil)(5 nil)))(3 ((6 nil)(7 nil))))))
(setf ar3 '(1 . ((2 .((4 . nil) . (5 . nil)))(3 . ((6 . nil) . (7 . nil))))))


(setf ar2 '(1 ((2 nil)(3 nil))))

;car, cdr, c..r
;first, second, ..., rest

;5
;caddr ( cadr ar3)


;Recorridos
;Inorden - I, R, D
(defun inord (a)
    (if (endp a)
        nil
    (append (inord (first (second a)))
        (cons (first a)
            (inord (second(second a)))
            )
        )
    )
)

;capi
(defun node-children (node)
    (when (< node 25)
        (list (* node 2)
            (1+ (* node 2))
        )
    )
)

; (setq tree (capi:contain
;     (make-instance 'capi:graph-pane
;     ;Construcción
;     :roots '(3)
;     :children-function 'node-children
;     :edge-pinboard-class 'capi:rigth-angle-line-pinboard-object
;     :node-pinboard-class 'capi:push-button
;     :layout-function
;     :top-down
;     :y-adjust :top
;     :x-adjust :left
;     )
;     ;tamaño
;     :best-width 500
;     :best-height 500
; ))

; (setf (capi:graph-pane-roots tree)'(3))


;Listas
(setf lista '(u l i s e s a s c e n c i o))
(setf lista1 '(1 2 3 4 5 6 7 8 9))
(setf lista2 '(u 1 l 2 i 3 s 4 e 5 s 6 a 7 s 8 c 9 e 10 n 11 c 12 i 13 o 14))

;Ejemplos para extraer datos
; CAR, CDR, C...R
; First, Second, ..., Rest, Last
; Member, Append, Cons, List, Length, Nth, Push y Pop

;car lista --regresa el primer elemento de la lista
;cdr lista1 --regresa el resto de la lista
;caddr lista2 -- regresa el tercer elemento de la lista

;first lista --regresa el primer elemento de la lista
;second lista1 --regresa el segundo elemento de la lista
;rest lista --regresa la lista sin el pirmer elemento
;last lista2 --regresa el ultimo elemento

;member 1 lista1 --verifica si un elemento esta en la lista
;append lista lista1 --concatena dos listas
;cons 'cdr lista2 --agrega un elemento al pricipio de la lista
;list lista --crea una lista con los elementos de la lista
;length lista1 --regresa la longitud de una lista
;nth 6 lista1 --regresa el elemento de la posición señalada
;push 0 lista1 --agrega un elemento al principio de la lista
;pop lista1 --elimina el primer elemento de la lista

;crear lista usuario
(defun agregar (n)
  (let ((mi-lista (make-list n)))
    (loop
      for i from 1 to n do
        (print "Agrega un elemento: ")
        (setf (nth (1- i) mi-lista) (read))
      finally (return mi-lista))))

; (agregar 5)

; "Agrega un elemento: " 1

; "Agrega un elemento: " 2

; "Agrega un elemento: " 3

; "Agrega un elemento: " 4

; "Agrega un elemento: " 5
; (1 2 3 4 5)

;procesamiento
;multiplicar por 2 cada elemento de la lista
(defun multiplicar (l)
    (mapcar #'(lambda (x) (* 2 x)) l)
)
; (multiplicar lista1)
; (2 4 6 8 10 12 14 16 18)

;sumar cada elemento de la lista
(defun sumar (l)
    (reduce #'+ l)
)
; (sumar lista1)
; 45

;eliminar los números pares de la lista
(defun eliminarPares (l)
    (remove-if #'evenp l)
)
; (eliminarPares lista1)
; (1 3 5 7 9)