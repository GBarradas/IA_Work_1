estado_inicial(e(1,0)).
estado_final(e(4,6)).

bloqueada([(3,1),(3,2),(3,3),(0,5),(2,5),(6,5),(2,6)]).
dentro_tabuleiro((X,Y)):- X@>=0, X@=<6, Y@>=0, Y@=<6.


op(e(X,Y), dir, e(W,Y), 1):- W is X+1, dentro_tabuleiro((W,Y)), bloqueada(L),
    \+member((W,Y),L).

op(e(X,Y), esq, e(W,Y), 1):- W is X-1, dentro_tabuleiro((W,Y)), bloqueada(L),
    \+member((W,Y),L).

op(e(X,Y), cima, e(X,W), 1):- W is Y+1, dentro_tabuleiro((X,W)), bloqueada(L),
    \+member((X,W),L).

op(e(X,Y), baixo, e(X,W), 1):- W is Y-1, dentro_tabuleiro((X,W)), bloqueada(L),
    \+member((X,W),L).

%cálculo da distância de Manhattan
h_manhattan(e(X1,Y1),e(X2,Y2),D) :-
    DeltaX is abs(X1-X2),
    DeltaY is abs(Y1-Y2),
    D is DeltaX + DeltaY.

%Cálculo de distância Euclidiana
h_euclidiana(e(X1,Y1),e(X2,Y2),D):-    
    DeltaX is X1-X2,
    DeltaY is Y1-Y2,
    D is round(sqrt((DeltaX*DeltaX - DeltaY*DeltaY))).

h(E, V) :- estado_final(Ef), h_euclidiana(E,Ef,V).