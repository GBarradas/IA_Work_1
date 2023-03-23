

estado_inicial((6, 1)).
estado_final((0, 4)).
casas_bloq([(0, 2), (1, 0), (1, 2), (1, 6), (3, 3), (4, 3), (5, 3)]).

pos_valida((X, Y)) :- casas_bloq(L), dentro_sala((X, Y)), \+member((X, Y), L).
dentro_sala((X, Y)) :- X>=0, X=<6, Y>=0, Y=<6.

op((X, Y), sobe, (Z, Y), 1) :- Z is X-1, pos_valida((Z, Y)).
op((X, Y), desce, (Z, Y), 1) :- Z is X+1, pos_valida((Z, Y)).
op((X, Y), esq, (X, Z), 1) :- Z is Y-1, pos_valida((X, Z)).
op((X, Y), dir, (X, Z), 1) :- Z is Y+1, pos_valida((X, Z)).


% manhattan
h1((A,B),C):-
	estado_final((X,Y)),
	X1 is abs(A - X), 
 	Y1 is abs(B - Y),
	C is X1 + Y1.

% euclidiana
h2((Ix,Iy),SOMA):-
	estado_final((Fx,Fy)),
	Dx is abs(Ix - Fx), 
 	Dy is abs(Iy - Fy),
	SOMA is round(sqrt(Dy ** 2 + Dx ** 2)).

h(A, B) :- h2(A, B).

