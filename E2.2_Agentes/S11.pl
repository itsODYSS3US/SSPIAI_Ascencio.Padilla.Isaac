%Arity - Aridad
%dynamic
%asser, asserta, assertz
%retract, retractall, abolish
%_ - variable anónima

%tell, listing, told

:- dynamic mamifero/1.
mamifero(delfin).
mamifero(leon).

:- dynamic mamifero/2.
mamifero(tigre,carnivoro).
mamifero(oso,omnivoro).
mamifero(puma,carnivoro).
