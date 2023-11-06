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