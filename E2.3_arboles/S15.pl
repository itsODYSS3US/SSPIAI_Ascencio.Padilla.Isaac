%arbol(Raiz,Hijo_izq,Hijo_der)
%arbol(raiz,hizq,hder).

% arbol(a,
%     arbol(e,i,o),
%     u).

arbol(a,
    arbol(o,
    arbol(e),
    arbol(d)),
    arbol(u)).

inorden(arbol(Raiz,Hizq,Hder)) :- 
    inorden(Hizq),
    write(Raiz),
    inorden(Hder), !.
inorden(H) :- write(H).

preorden(arbol(Raiz,Hizq,Hder)) :-
    write(Raiz),
    preorden(Hizq),
    preorden(Hder), !.
preorden(H) :- write(H).

postorden(arbol(Raiz,Hizq,Hder)) :-
    postorden(Hizq),
    postorden(Hder),
    write(Raiz), !.
postorden(H) :- write(H).