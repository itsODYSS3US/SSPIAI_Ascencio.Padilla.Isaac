;Isaac Ulises Ascencio Padilla
;Saul Mercado Predoza

;Ascencio Mercado
(setf apellidos '(o ((e ((s ((A nil)(c nil)))(c((n nil)(i nil))))) (c ((e((M nil)(r nil)))(d((a nil)(o nil))))))))

; Recorrer el arbol:
; Sin puntitos -> first, second, ... rest.

;consulta para letra inicial y final
;first apellidos
;first(second(second(second (second (second (second apellidos))))))


;inorden - I, R, D
(defun inord (a)
    (if (endp a)
        nil
    (append (inord (first (second a))) ;Izquierda
            (cons (first a) ;Raiz 
            (inord (second(second a))) ;Derecha
            )
        )
    )
)
;inord apellidos
; (A S C E N C I O M E R C A D O)

;preorden - R, I, D
(defun preor (a)
    (if (endp a)
        nil
    (append (cons (first a) ;Raiz
            (preor (first (second a)))) ;Izquierda
            (preor (second(second a))) ;Derecha
        )
    )
)
;preor apellidos
;(O E S A C C N I C E M R D A O)

;postorden - I, D, R
(defun post (a)
    (if (endp a)
        nil
    (append 
            (post (first (second a))) ;Izquierda
            (post (second(second a))) ;Derecha
            (list (first a)) ;Raiz
        )
    )
)
; post apellidos
; (A C S N I C E M R E A O D C O)


;busqueda
