%%%
%%% N QUEENS PROBLEM
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% AUXILIARIES
%%%
not(X):-X, !, fail.
not(_).
%%% List membership
%%%
in(H,[H|_]).
in(H,[_|T]):-in(H,T).
%%% List of integers between L and H
%%%
nums(H,H,[H]).
nums(L,H,[L|R]):-L<H, N is L+1, nums(N,H,R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% N QUEENS AUXILIARIES
%%%
%%% The number of queens/size of board
queen_no(4).
%%% All the ranks and files of the board
ranks(L):-queen_no(N), nums(1,N,L).
files(L):-queen_no(N), nums(1,N,L).
%%% R is a rank on the board
rank(R):-ranks(L), in(R,L).
%%% F is a file on the board
file(F):-files(L), in(F,L).
%%% attacks((R1,F1),(R2,F2)):
%%% does a queen on the square at rank R1, file F1 attack the square
%%% rank R2, file F2 or vice versa.
%%%
attacks((R,_),(R,_)).
attacks((_,F),(_,F)).
attacks((R1,F1),(R2,F2)):-diagonal((R1,F1),(R2,F2)).
%%% Are two squares on the same diagonal?
diagonal((X,Y),(X,Y)).
diagonal((X1,Y1),(X2,Y2)):-N is Y2-Y1,D is X2-X1, Q is N/D,Q is 1.0E+00.
diagonal((X1,Y1),(X2,Y2)):-N is Y2-Y1,D is X2-X1, Q is N/D,Q is-1.0E+00.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% N QUEENS SOLUTION
%%%
%%% placement(L): L is a list of positions on a chess board
placement([]).
placement([(R,F)|P]):-rank(R),file(F),placement(P).
placementbgr([]).
placementbgr([(R,F)|P]) :-placementbgr(P),rank(R),file(F).
%%% ok_place(L): L is a placement where no queen attacks any other queen
ok_place([]).
ok_place([(R,F)|P]):-no_attacks((R,F),P),ok_place(P).
%%% no_attacks((R,F), L): a queen at square (R,F) doesnt attack any square
%%% in list L
no_attacks(_,[]).
no_attacks((R,F),[(R2,F2)|P]):-not(attacks((R,F),(R2,F2))),no_attacks((R,F),P).
%%% Place N queens (on an NxN board)
queens(P):-queen_no(N),length(P,N),placement(P),ok_place(P).