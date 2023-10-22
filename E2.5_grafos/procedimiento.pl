%Isaac Ulises Ascencio Padilla
bc :- consult('grafos.pl').
%cd('SSPIAI_Ascencio.Padilla.Isaac/E2.5_grafos').

%Procedimientos genéricos
inicio :- bc, nl,
    write('---Menu---'), nl, 
    write('1. Nodos vecinos'), nl, 
    write('2. Conjunto de aristas'), nl, 
    write('3. Lista de nodos'), nl, 
    write('4. Cantidad de nodos'), nl, 
    write('5. Cantidad de aristas'), nl, 
    write('6. Buscar nodo'), nl, 
    write('7. Recorrido'), nl, 
    write('8. Camino hamiltoniano'), nl, 
    write('9. Camino hamiltoniano desde n nodo'), nl, 
    write('10. Crear grafo'), nl, 
    write('11. Salir'), nl, 
    write('Ingresa una opcion (1-9)'), nl, 
    read(Op), opcion(Op), !.


opcion(1) :- n_vecinos, inicio. 
opcion(2) :- listar, inicio. 
opcion(3) :- listar_n, inicio. 
opcion(4) :- contar_n, inicio. 
opcion(5) :- contar_aristas, inicio. 
opcion(6) :- buscar, inicio. 
opcion(7) :- recorrido_anchura, inicio. 
opcion(8) :- hamiltoniano, inicio. 
opcion(9) :- hamiltoniano_n, inicio. 
opcion(10) :- guardar, inicio. 
opcion(11) :- write('Fin de programa...'), !. 
opcion(_) :- write('Revisa que el numero ingresado corresponda a una opcion (1-11) '), inicio. 


%Identificar los nodos adyacentes o vecinos
n_vecinos :- write('Ingrese el grafo: '), nl,
    read(G), nl,
    write('Ingrese el nodo: '), nl,
    read(N), nl, n_vecinos(N,G).
n_vecinos(N, G) :-
    grafo(G, L),
    encontrar_vecinos(N, L, V),
    write('Vecinos de '), write(N), write(': '), write(V),!, nl.

encontrar_vecinos(_, [], []).

encontrar_vecinos(N, [N-N2 | T], [N2 | TV]) :-
    encontrar_vecinos(N, T, TV).
encontrar_vecinos(N, [N2-N | T], [N2 | TV]) :-
    encontrar_vecinos(N, T, TV).

encontrar_vecinos(N, [_-_ | T], V) :-
    encontrar_vecinos(N, T, V).
encontrar_vecinos(N, [_-_ | T], V) :-
    encontrar_vecinos(N, T, V).


%Mostrar el conjunto de artistas del grafo
listar :- write('De que grafo mostrar las aristas?: '),
    nl, read(Tipo), nl, grafo(Tipo,Lista), imprimir(Lista).

imprimir([]).
imprimir([H|T]) :- write('-> '), write(H), nl,
    imprimir(T).

%Imprimir la lista de nodos
listar_n :- write('De que grafo mostrar los nodos?: '),
    nl, read(G), nl, listar_n(G).
listar_n(G) :-
    grafo(G,L), nodos(L,[]).
nodos([],Lr) :- sort(Lr, Lf), write(Lf).
nodos([N1-N2|T],Lr) :- 
    L1 = [N1|Lr],
    L2 = [N2|L1],
    nodos(T,L2).

%Mostrar la cantidad de nodos
contar_n :- write('De que grafo mostrar la cantidad de nodos?: '), nl,
    read(G), nl, contar_n(G,C), write('La cantidad de nodos es:' ), write(C).
contar_n(Grafo, CantidadNodos) :-
    grafo(Grafo, Aristas),
    findall(Nodo, (member(Arista, Aristas), Arista =..
        [_, Nodo1, Nodo2], 
        (Nodo1 \= Nodo2, (Nodo1 = Nodo2 -> false; true)), member(Nodo, [Nodo1, Nodo2])), Nodos),
    sort(Nodos, NodosUnicos),
    length(NodosUnicos, CantidadNodos).

%Mostrar la cantidad de aristas
longitud([], 0).
longitud([_|T], L) :- longitud(T,L1), L is L1 + 1.

contar_aristas :- write('De que grafo mostrar la cantidad de aristas?: '), 
    nl, read(Tipo), nl, contar_aristas(Tipo,Cant), write('La cantidad de aristas del grafo '), write(Tipo), write(' son: '), write(Cant). 

contar_aristas(Tipo,Cant) :-
    grafo(Tipo,Lista),
    longitud(Lista,Cant).

%Buscar si un nodo existe
buscar :- write('De que grafo quiere buscar un nodo?: '), nl,
    read(G), nl,
    write('Que nodo quiere buscar?: '), nl,
    read(N), nl, buscar(G,N).
buscar(G, N) :- 
    grafo(G, L),
    (member(N-_, L) ; member(_-N, L)),!,
    write('El nodo si existe').


%Recorrido
recorrido_anchura :- write('Que grafo quiere recorrer?: '), nl,
    read(G), nl, write('De que nodo quiere comenzar?: '), nl,
    read(Inicio), nl, recorrido_anchura(G,Inicio,R), write('El resultado del recorrido es: '),write(R).
recorrido_anchura(G,Inicio, Recorrido) :-
    recorrido_anchura_aux(G,[Inicio], [], Recorrido).

recorrido_anchura_aux(_,[], _, []).

recorrido_anchura_aux(G,[Nodo|Nodos], Visitados, [Nodo|Recorrido]) :-
    \+ member(Nodo, Visitados),
    grafo(G, Aristas),
    findall(Adyacente, member(Nodo-Adyacente, Aristas), Adyacentes),
    append(Nodos, Adyacentes, Nodos1),
    recorrido_anchura_aux(G,Nodos1, [Nodo|Visitados], Recorrido).

%Caminos hamiltonianos
hamiltoniano :- write('Que grafo quiere recorrer?: '), nl,
    read(G), nl, hamiltoniano(G,C), write('El resultado del camino es: '), write(C).
vecinos(N1,N2,G) :- 
    grafo(G,L),
    (member(N1-N2,L) ; member(N2-N1,L)).

vertices(G,Ln) :- 
    setof(N1,N2^vecinos(N1,N2,G), Ln).

recorrido(G,O,D,C) :- 
    recorrido_aux(G,O,[D],C).
recorrido_aux(_,O,[O|C1],[O|C1]).
recorrido_aux(G,Ax,[Dx|C1],C) :-
    vecinos(Nt,Dx,G),
    not(member(Nt,[Dx|C1])),
    recorrido_aux(G,Ax,[Nt,Dx|C1],C). 

hamiltoniano(G,C) :-
   vertices(G,L),   
   length(L,N),     
   length(C,N), 
   recorrido(G,_,_,C).

%Camino hamiltoniano con un nodo dado
hamiltoniano_n :- write('Que grafo quiere recorrer?: '), nl,
    read(G), nl,
    write('De que nodo quiere comenzar?: '), nl,
    read(O), nl, 
    hamiltoniano_n(G,O,C), write('El resultado del camino es: '), write(C).
hamiltoniano_n(G, O, C) :-
    vertices(G, L),
    length(L, N),
    length(C, N),
    recorrido(G, O, _, C).

%Crear grafo
guardar :- write('Ingrese el nombre del grafo: '), nl,
    read(NombreGrafo), nl,
    write('Ingrese la lista de aristas: Ejemplo: [a-b,b-c,...]'), nl,
    read(ListaAristas), nl, guardar(NombreGrafo,ListaAristas).
guardar(NombreGrafo, ListaAristas) :-
    tell('grafos.pl'),
    listing(grafo/2),
    write('grafo('), write(NombreGrafo), write(', ['),
    escribir_aristas(ListaAristas),
    write(']).'), nl,
    
    told. 

escribir_aristas([]).
escribir_aristas([Arista|Resto]) :-
    write(Arista),
    (Resto = [] -> write('') ; write(',')),
    escribir_aristas(Resto).