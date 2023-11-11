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

