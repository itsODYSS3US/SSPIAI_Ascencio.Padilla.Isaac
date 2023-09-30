%Isaac Ulises Ascencio Padilla

bc :- consult('listas.pl').

%Menú
inicio :- nl,
    write('---Menú---'), nl, 
    write('1. Listar'), nl, 
    write('2. Buscar'), nl, 
    write('3. Agregar'), nl, 
    write('4. Longitud'), nl, 
    write('5. Ordenar'), nl, 
    write('6. Eliminar'), nl, 
    write('7. Concatenar'), nl, 
    write('Ingresa una opción (1-7)'), nl, 
    read(Op), opcion(Op).


opcion(1) :- listar, inicio. 
opcion(2) :- buscar, inicio. 
opcion(3) :- agregar, inicio. 
opcion(4) :- contar_elementos, inicio. 
opcion(5) :- ordenar, inicio. 
opcion(6) :- eliminar, inicio. 
opcion(7) :- concatenar, inicio. 
opcion(_) :- write('Revisa que el número ingresaso corresponda a una opción (1-7) '), inicio. 



%Listar
listar :- write('Que lista va a mostrar: '),
    nl, read(Tipo), animales(Tipo,Lista), imprimir(Lista).

imprimir([]).
imprimir([H|T]) :- write('- '), write(H), nl,
    imprimir(T).


%Buscar
buscar1(X,[_|T]) :- buscar1(X,T). 
buscar1(H,[H|_]) :- write('El elemento si se encuentra en la lista'), nl.

buscar :- write('Que elemento desea buscar?: '),
    nl, read(Elemento), 
    write('En lista se encuentre dicho elemento?: '),
    nl, read(Tipo), buscar(Elemento,Tipo).

buscar(Elemento,Tipo) :- animales(Tipo,Lista), buscar1(Elemento,Lista).

%Agregar
guardar :- tell('listas.pl'), listing(animales/2), told.
insertar(E,L,Lr) :- Lr = [E|L].

agregar :- write('Ingrese el elemento que desea agragar?: '),
    nl, read(Elemento), 
    write('En que lista se va a agregar?: '),
    nl, read(Tipo), agregar(Elemento,Tipo).

agregar(Elemento,Tipo) :- animales(Tipo,Lista), 
    insertar(Elemento,Lista,Lr),
    retract(animales(Tipo,Lista)),
    assertz(animales(Tipo,Lr)), 
    guardar, write('La base de conocimientos ha sido actualizada...'), nl.
%assert(animales(Tipo,Lr))


%Longitud listo
longitud([], 0).
longitud([_|T], L) :- longitud(T,L1), L is L1 + 1.

contar_elementos :- write('Ingrese el tipo de la lista: '), 
    nl, read(Tipo), contar_elementos(Tipo,Cant), write('Los elementos en la lista '), write(Tipo), write(' son: '), write(Cant). 

contar_elementos(Tipo,Cant) :-
    animales(Tipo,Lista),
    longitud(Lista,Cant).

%Ordenamiento listo - listar
ordenar :- write('Ingresa el tipo que desea ordenar: '),
    nl, read(Tipo), ordenar(Tipo, Lr), write('La lista ordenada es la siguiente: '), nl, imprimir(Lr).

ordenar(Tipo, Lr) :- animales(Tipo,Lista), msort(Lista, Lr).

%Eliminar listo
eliminar :- write('Que elemento desea eliminar?: '),
    nl, read(Elemento), 
    write('En lista se encuentre dicho elemento?: '),
    nl, read(Tipo), eliminar(Elemento,Tipo).

eliminar(Elemmento, Tipo) :- animales(Tipo,Lista), eliminar1(Elemento, Lista, T), imprimir(T). 

eliminar1(R, [R|T], T) :- !.
eliminar1(R, [H|T], [H|T2]) :- H \= R, eliminar1(R, T, T2).

%Concatenar 2 listas
