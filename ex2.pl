
%-------------------------estados--------------------------

estado_inicial(s(a(6, 1), c(5, 1))).

estado_final(s(a(_, _), c(0, 4))).

casas_bloq([p(0, 2), p(1, 0), p(1, 2), p(1, 6), p(3, 3), p(4, 3), p(5, 3)]).


%-------------------------restriçoes--------------------------

pos_valida(a(X, Y)):- casas_bloq(L),
						 dentro_sala(p(X, Y)),
						 \+member(p(X, Y), L).

pos_valida(c(X, Y)):- casas_bloq(L),
						 dentro_sala(p(X, Y)),
						 \+ member(p(X, Y), L).


dentro_sala(p(X, Y)) :- X >= 0, X =< 6,
                      Y >= 0, Y =< 6.


%-------------------------operações--------------------------

%op(Estado_act,operador,Estado_seg,Custo)
op(s(a(Xa, Ya), c(Xc, Yc)) ,emp_esq, s(a(Xa, Za), c(Xc, Zc)) ,1):- Za is Ya-1,
																   Zc is Yc-1,
																   (Xc, Yc) = (Xa, Za),
																   pos_valida(a(Xa, Za)),
																   pos_valida(c(Xc, Zc)).

op(s(a(Xa, Ya), c(Xc, Yc)) ,move_esq, s(a(Xa, Za), c(Xc, Yc)) ,1):- Za is Ya-1,
																	(Xc, Yc) \= (Xa, Za),
																	pos_valida(a(Xa, Za)). 


op(s(a(Xa, Ya), c(Xc, Yc)), emp_dir, s(a(Xa, Za), c(Xc, Zc)), 1):- Za is Ya+1,
																   Zc is Yc+1,
																   (Xc, Yc) = (Xa, Za),
																   pos_valida(a(Xa, Za)),
																   pos_valida(c(Xc, Zc)).

op(s(a(Xa, Ya), c(Xc, Yc)), move_dir, s(a(Xa, Za), c(Xc, Yc)), 1):- Za is Ya+1,
																    (Xc, Yc) \= (Xa, Za),
																    pos_valida(a(Xa, Za)). 


op(s(a(Xa, Ya), c(Xc, Yc)), emp_sobe, s(a(Za, Ya), c(Zc, Yc)), 1):- Za is Xa-1,
																	Zc is Xc-1,
																	(Xc, Yc) = (Za, Ya),
																	pos_valida(a(Za, Ya)),
																	pos_valida(c(Zc, Yc)).

op(s(a(Xa, Ya), c(Xc, Yc)), move_sobe, s(a(Za, Ya), c(Xc, Yc)), 1):- Za is Xa-1,                               
																	 (Xc, Yc) \= (Za, Ya),
																	 pos_valida(c(Za, Ya)).


op(s(a(Xa, Ya), c(Xc, Yc)), emp_desce, s(a(Za, Ya), c(Zc, Yc)), 1):- Za is Xa+1,
																	 Zc is Xc+1,
																	 (Xc, Yc) = (Za, Ya),
																	 pos_valida(a(Za, Ya)),
																	 pos_valida(c(Zc, Yc)).

op(s(a(Xa, Ya), c(Xc, Yc)), move_desce, s(a(Za, Ya), c(Xc, Yc)), 1):- Za is Xa+1,                               
																	  (Xc, Yc) \= (Za, Ya),
																	  pos_valida(c(Za, Ya)).


