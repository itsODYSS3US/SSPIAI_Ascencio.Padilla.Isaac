% Arbol genealogico

hombre('Rafael').
hombre('Omar').
hombre('Saul').
hombre('Jose P').

hombre('Jose').
hombre('Juan').
hombre('Hugo').
hombre('Fernando').
hombre('Diego').

hombre('Sergio').
hombre('Carlos').
hombre('Leonel').
hombre('Cristian').
hombre('Miguel').

hombre('Jose J').
hombre('Luis').
hombre('Juan A').
hombre('J Jesus').
hombre('Ricardo').
hombre('Edgar').
hombre('Adrian').
hombre('Ivan').
hombre('Alfonso').
hombre('Eduardo').
hombre('Jaime').
hombre('Ulises').

hombre('Jaiden').
hombre('Jerald').

hombre('Alejandro').
hombre('Chuy').
hombre('Israel').
hombre('Emanuel').

mujer('Maria J').
mujer('Maria').
mujer('Mariana').
mujer('Paloma').

mujer('Elvira').
mujer('Ofelia').
mujer('Lizbeth').

mujer('Marta').
mujer('Araceli').
mujer('Estela').
mujer('Jovana').
mujer('Zaira').

mujer('Citlali').
mujer('Carol').
mujer('Alexa').
mujer('Elizabeth').
mujer('Dayana').
mujer('Rocio').

mujer('Rosa').
mujer('Angelica').
mujer('Fatima').


%Progenitor
progenitor('Rafael','Jose').
progenitor('Rafael','Juan').
progenitor('Maria J','Jose').
progenitor('Maria J','Juan').

progenitor('Jose P','Elvira').
progenitor('Jose P','Ofelia').
progenitor('Maria','Elvira').
progenitor('Maria','Ofelia').

progenitor('Omar','Hugo').
progenitor('Omar','Fernando').
progenitor('Mariana','Hugo').
progenitor('Mariana','Fernando').

progenitor('Saul','Lizbeth').
progenitor('Saul','Diego').
progenitor('Paloma','Lizbeth').
progenitor('Paloma','Diego').

progenitor('Jaun','Carlos').
progenitor('Juan','Marta').
progenitor('Juan','Araceli').
progenitor('Juan','Sergio').
progenitor('Juan','Estela').

progenitor('Elvira','Carlos').
progenitor('Elvira','Marta').
progenitor('Elvira','Araceli').
progenitor('Elvira','Sergio').
progenitor('Elvira','Estela').

progenitor('Fernando','Leonel').
progenitor('Fernando','Cristian').
progenitor('Fernando','Miguel').
progenitor('Fernando','Jovana').
progenitor('Fernando','Zaira').

progenitor('Lizbeth','Leonel').
progenitor('Lizbeth','Cristian').
progenitor('Lizbeth','Miguel').
progenitor('Lizbeth','Jovana').
progenitor('Lizbeth','Zaira').

progenitor('Marta','Citlali').
progenitor('Marta','Jose J').

progenitor('Araceli','Carol').
progenitor('Araceli','Alexa').

progenitor('Sergio','Luis').
progenitor('Sergio','Juan A').
progenitor('Sergio','J Jesus').
progenitor('Sergio','Ricardo').

progenitor('Estela','Ulises').
progenitor('Estela','Jaime').

progenitor('Leonel','Ulises').
progenitor('Leonel','Jaime').

progenitor('Cristian','Elizabeth').
progenitor('Cristian','Dayana').

progenitor('Miguel','Rocio').
progenitor('Miguel','Edgar').

progenitor('Jovana','Adrian').
progenitor('Jovana','Ivan').
progenitor('Jovana','Alfonso').

progenitor('Zaira','Eduardo').

progenitor('Ricardo','Jaiden').
progenitor('Ricardo','Jerald').

%Parejas
pareja('Sergio','Rosa').
pareja('Araceli','Alejandro').
pareja('Marta','Chuy').

pareja('Cristian','Angelica').
pareja('Miguel','Fatima').
pareja('Jovana','Israel').
pareja('Zaira','Emanuel').

padre(P,H) :- progenitor(P,H) , hombre(P).
madre(M,H) :- progenitor(M,H) , mujer(M).

hijo(H,P) :- progenitor(P,H) , hombre(H).
hija(H,P) :- progenitor(P,H) , mujer(H).
hijos(H,P) :- progenitor(P,H).


abuelo(A,N) :- progenitor(A,P) , progenitor(P,N), hombre(A).
abuelo_pat(A,N) :- padre(A,P), padre(P,N).
abuelo_mat(A,N) :- padre(A,M), madre(M,N).

abuela(A,N) :- progenitor(A,M), progenitor(M,N), mujer(A).
abuela_pat(A,N) :- madre(A,P), padre(P,N).
abuela_mat(A,N) :- madre(A,M), madre(M,N).

abuelos_pat(Ao,Aa,N) :- abuelo_pat(Ao,N) , abuela_pat(Aa,N).
abuelos_mat(Ao,Aa,N) :- abuelo_mat(Ao,N) , abuela_mat(Aa,N).

bisabuelo(B,N) :- abuelo(A,N) , progenitor(B,A) , hombre(B).
bisabuelo(B,N) :- abuela(A,N) , progenitor(B,A) , hombre(B).
bisabuela(B,N) :- abuelo(A,N) , progenitor(B,A) , mujer(B).
bisabuela(B,N) :- abuela(A,N) , progenitor(B,A) , mujer(B).

tioabuelo(T,S) :- abuelo(A,S) , hermanos(A,T), hombre(T).
tioabuelo(T,S) :- abuela(A,S) , hermanos(A,T), hombre(T).
tiaabuela(T,S) :- abuelo(A,S) , hermanos(A,T), mujer(T).
tiaabuela(T,S) :- abuela(A,S) , hermanos(A,T), mujer(T).

tios(T,S) :- hermanos(P,T) , progenitor(P,S).
tio(T,S) :- hermanos(P,T) , progenitor(P,S) , hombre(T).
tia(T,S) :- hermanos(P,T) , progenitor(P,S) , mujer(T).

tio_politico(Tp,S) :- tios(T,S) , pareja(T,Tp), hombre(Tp).
tia_politica(Tp,S) :- tios(T,S) , pareja(T,Tp), mujer(Tp).

primos(P1,P2) :- tios(T,P2) , progenitor(T,P1). 

hermanos(H1,H2) :- progenitor(P,H1) , progenitor(P,H2) , H1 \= H2.



