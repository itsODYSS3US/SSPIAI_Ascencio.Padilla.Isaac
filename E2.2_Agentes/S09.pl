%Recursividad
%factorial(0,1).

inicio :- consult('S091.pl').

buscar(A,X) :- respuesta(A,X), !.

agregar(A,X) :- asserta(factorial(A,X)), write("Nuevo conocimiento...").

respuesta(A,X) :- factorial(A,X), write("El resultado es correcto"), !.
respuesta(A,X) :- \+factorial(A,X), calfactorial(A,X), agregar(A,X), write("Nuevo conocimiento...").

guardar :- tell('S091.pl'), listing(factorial/2), told, write("Guardado...").

calfactorial(0,1).
calfactorial(N,F) :- N > 0, N1 is N-1, 
    calfactorial(N1,F1),
    F is N*F1.



fibonacci(1,0).
fibonacci(2,1).
fibonacci(N,F) :- N > 1, 
    N1 is N-1, 
    fibonacci(N1,F1),
    N2 is N-2,
    fibonacci(N2,F2),
    F is F1+F2.  

