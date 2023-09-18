inicio :- consult('S113.pl').

agregar(A) :- assert(animal(A)), write("Nuevo conocimiento...").

buscar(A) :- respuesta(A), !.

eliminar(A) :- retract(animal(A)).

guardar :- tell('S113.pl'), listing(animal/1), told, write("Guardado...").

fin :- guardar, retractall(animal(_)).

respuesta(A) :- animal(A), write("Es un animal").
respuesta(A) :- \+animal(A), agregar(A), write("Nuevo conocimiento...").