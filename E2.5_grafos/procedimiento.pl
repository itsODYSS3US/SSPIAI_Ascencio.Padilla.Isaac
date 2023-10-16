%Isaac Ulises Ascencio Padilla
bc :- consult('grafos.pl').


%Procedimientos genéricos


%Seleccionar el grafo a trabajar

%Identificar los nodos adyacentes o vecinos
vecinos(N1,N2,G) :- 
    grafo(G,L),
    (member(N1-N2,L) ; member(N2-N1,L)).

vecinos(G,N,L) :- grafo(G,L), lista(L,[]).
lista([],Lr) :-  

%Mostrar el conjunto de artistas del grafo
imprimir_ar(G) :-
    grafo(G,L), nodos1(L,1).
nodos1([],0).
nodos1([H|T],N) :-
    write(N), write(' - '), write(H), nl,
    N2 is N+1, nodos1(T,N2).

%Imprimir la lista de nodos
listar_n(G) :-
    grafo(G,L), nodos(L,[]).
nodos([],Lr) :- sort(Lr, Lf), write(Lf).
nodos([N1-N2|T],Lr) :- 
    L1 = [N1|Lr],
    L2 = [N2|L1],
    nodos(T,L2).

%Mostrar la cantidad de nodos

%Mostrar la cantidad de aristas

%Buscar si un nodo existe
buscar(G,N) :- grafo(G,L), (member(N-_,L), write('El nodo si existe'),! ; member(_-N,L), write('El nodo si existe'),!).

%Recorrido

%Caminos hamiltonianos

%Camino hamiltoniano con un nodo dado

%Crear grafo