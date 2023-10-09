%Grafos

g1(a,b).
g1(a,b).
g1(a,i).
g1(b,c).
g1(b,a).
g1(b,e).
g1(c,b).
g1(d,a).
g1(d,e).
g1(d,i).
g1(e,b).
g1(e,d).
g1(e,f).
g1(f,e).
g1(m,m).
g1(i,a).
g1(i,d).


%Recorrido grafo no dirigido
imp(N1, N2) :- 
    write(N1), write('->'), write(N2), nl.
camino(O,D) :- g2(O,D), imp(O,D), !.
camino(O,D) :- g2(O,Nt),
    imp(O,Nt),
    camino(Nt,D), !.


%Grafo 2
g2(5,11).
g2(7,11).
g2(7,8).
g2(8,9).
g2(11,2).
g2(11,10).
g2(11,9).
g2(2,5).

%Grafo 3
g3(i,d,4).
g3(d,e,2).
g3(e,f,4).
g3(f,m,3).


g3(a,d,5).
g3(a,i,3).
g3(d,a,5).
g3(d,i,4).
g3(e,d,2).
g3(i,a,3).

imp_p(N1, N2, P) :- 
    write(N1), write('->'), write(N2),
    write('['),write(P),write(']'), nl.
camino_p(O,D,T) :- g3(O,D,P), imp_p(O,D,P),
    T is P, !.
camino_p(O,D,T) :- g3(O,Nt,P),
    imp_p(O,Nt,P),
    camino_p(Nt,D,T1), T is P+T1, !.


%Grafos con listas
grafo(gnn,[a-i,a-b,a-d,
    b-c,b-e,
    d-e,d-i,
    e-f,
    m-m]).

grafo(aus,[ao-tn,ao-as,tn-q,tn-as,as-v,as-ngs,as-q,ngs-v,q-ngs]).

vecino_nd(N1,N2,G) :- 
    grafo(G,L),
    (member(N1-N2,L) ; member(N2-N1,L)).