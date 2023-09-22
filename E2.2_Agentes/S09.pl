%Recursividad
%factorial(0,1).

inicio :- consult('S091.pl').

buscar(A,X) :- respuesta(A,X), !.

agregar(A,X) :- asserta(factorial(A,X)), write("Nuevo conocimiento...").

respuesta(A,X) :- factorial(A,X), write("El resultado es correcto"), !.
respuesta(A,X) :- \+factorial(A,X), calfactorial(A,X), agregar(A,X).

guardar :- tell('S091.pl'), listing(factorial/2), told, write("Guardado...").

calfactorial(0,1).
calfactorial(N,F) :- N > 0, N1 is N-1, 
    calfactorial(N1,F1),
    F is N*F1.


iniciof :- consult('S092.pl').

buscarf(A,X) :- respuestaf(A,X), !.

agregarf(A,X) :- asserta(fibonacci(A,X)), write("Nuevo conocimiento...").

respuestaf(A,X) :- fibonacci(A,X), write("El resultado es correcto"), !.
respuestaf(A,X) :- \+fibonacci(A,X), calfibonacci(A,X), agregarf(A,X).

guardarf :- tell('S092.pl'), listing(fibonacci/2), told, write("Guardado...").

calfibonacci(1,0).
calfibonacci(2,1).
calfibonacci(N,F) :- N > 1, 
    N1 is N-1, 
    calfibonacci(N1,F1),
    N2 is N-2,
    calfibonacci(N2,F2),
    F is F1+F2.  

