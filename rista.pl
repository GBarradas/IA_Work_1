
peso(t1,20 ).
peso(t2, 30 ).
peso(t3, 40).
peso(t4, 60).
peso(t5, 30).
peso(t6, 120).
peso(t7, 30).
peso(t8, 10).
peso(t9, 40).
peso(t10, 40).

e(_,_,_,_).
estado_inicial(e([t1,t2,t3,t4,t5,t6,t7,t8,t9,t10],[],[],[])).
estado_final(e([],_,_,_)).
op(e([T|R],J1,J2,J3),ej1,e(R,[T|J1],J2,J3),1):- veCap([T|J1],0,140).
op(e([T|R],J1,J2,J3),ej2,e(R,J1,[T|J2],J3),1):- veCap([T|J2],0,140).
op(e([T|R],J1,J2,J3),ej3,e(R,J1,J2,[T|J3]),1):- veCap([T|J3],0,140).

veCap([],P,M):- P =< M.
veCap([T|R],P,M):- peso(T,N), P1 is P+N, veCap(R,P1,M).