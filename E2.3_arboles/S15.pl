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


%Árbol aritmético 
tree(*,tree(+,tree(*,3,5),tree(-,2,5)),3).

ino_ar(tree(Raiz,Hizq,Hder)) :- 
    write('('),
    ino_ar(Hizq),
    write(Raiz), write(' '),
    ino_ar(Hder),
    write(')'), !.
ino_ar(H) :- write(H).

pre_ar(tree(Raiz,Hizq,Hder)) :- 
    write('('),
    write(Raiz), write(' '),
    pre_ar(Hizq),
    pre_ar(Hder),
    write(')'), !.
pre_ar(H) :- write(H).

post_ar(tree(Raiz,Hizq,Hder)) :- 
    write('('),
    post_ar(Hizq),
    post_ar(Hder),
    write(Raiz), write(' '),
    write(')'), !.
post_ar(H) :- write(H).

%Árboles ternarios
%tree(Raiz,Hizq,Hcen,Hder).
%Inorden HI, R, HC, HD
%Preorden R, HI, HC, HD
%Postorden HI, HC, HD, R

%Árbol ternario con nombre y apellido
ar_tri(u,ar_tri(l,i,s,e),ar_tri(s,' ',a,s),ar_tri(c,e,n,ar_tri(c,i,o,''))).

pre_tri(ar_tri(Raiz,Hizq,Hcen,Hder)) :-
    write(Raiz),
    pre_tri(Hizq),
    pre_tri(Hcen),
    pre_tri(Hder), !.
pre_tri(H) :- write(H).
%pre_tri(ar_tri(u,ar_tri(l,i,s,e),ar_tri(s,' ',a,s),ar_tri(c,e,n,ar_tri(c,i,o,'')))).

ino_tri(ar_tri(Raiz,Hizq,Hcen,Hder)) :-
    ino_tri(Hizq),
    write(Raiz),
    ino_tri(Hcen),
    ino_tri(Hder), !.
ino_tri(H) :- write(H).

post_tri(ar_tri(Raiz,Hizq,Hcen,Hder)) :-
    post_tri(Hizq),
    post_tri(Hcen),
    post_tri(Hder),
    write(Raiz), !.
post_tri(H) :- write(H).