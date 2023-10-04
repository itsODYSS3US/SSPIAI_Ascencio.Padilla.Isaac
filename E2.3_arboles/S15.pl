%arbol(Raiz,Hijo_izq,Hijo_der)
%arbol(raiz,hizq,hder).

% arbol(a,
%     arbol(e,i,o),
%     u).

arbol(a,arbol(o,arbol(e,arbol(s,a,c),arbol(c,n,i)),arbol(d,arbol(p,' ',a),arbol(l,i,l))),arbol(u,arbol(a,arbol(i,' ',s),arbol(c,a,' ')),arbol(e,arbol(i,l,s),arbol(' ',s,' ')))).
arbol1(a,arbol1(s,c,e),arbol1(n,c,arbol1(i,o,' '))). 
arbol2(o,arbol2(' ',arbol2(i,u,l),arbol2(s,s,e)),arbol2(i,arbol2(c,a,s),arbol2(c,e,n))).

inorden(arbol(Raiz,Hizq,Hder)) :- 
    inorden(Hizq),
    write(Raiz),
    inorden(Hder), !.
inorden(H) :- write(H).
%inorden(arbol(a,arbol(o,arbol(e,arbol(s,a,c),arbol(c,n,i)),arbol(d,arbol(p,' ',a),arbol(l,i,l))),arbol(u,arbol(a,arbol(i,' ',s),arbol(c,a,' ')),arbol(e,arbol(i,l,s),arbol(' ',s,' '))))).

preorden(arbol1(Raiz,Hizq,Hder)) :-
    write(Raiz),
    preorden(Hizq),
    preorden(Hder), !.
preorden(H) :- write(H).
%preorden(arbol1(a,arbol1(s,c,e),arbol1(n,c,arbol1(i,o,' ')))).

postorden(arbol2(Raiz,Hizq,Hder)) :-
    postorden(Hizq),
    postorden(Hder),
    write(Raiz), !.
postorden(H) :- write(H).
%postorden(arbol2(o,arbol2(' ',arbol2(i,u,l),arbol2(s,s,e)),arbol2(i,arbol2(c,a,s),arbol2(c,e,n)))).