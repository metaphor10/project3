color(red).
color(yellow).
color(blue).
color(green).
country(X):-adj(X,_).
country(X):-adj(_,X).
not(X) :-X, !, fail.
not(_).
in(H,[H|_]).
in(H,[H2|T]):-not(H=H2), in(H,T).
coloring(CTRY,COL):-gencolor(CTRY,COL), testcolor(COL).
gencolor([],[]).
gencolor([CT|CTL],[(CT,C)|CL]):-country(CT), color(C), gencolor(CTL,CL).
testcolor([]).
testcolor([(CT,C)|T]):-adjcols(CT,CL,T), not(in(C,CL)), testcolor(T).
adjcols(_,[],[]).
adjcols(CT,[C|CL],[(CT2,C)|SL]):-adjacent(CT,CT2), adjcols(CT,CL,SL).
adjcols(CT,CL,[(CT2,_)|SL]):-not(adjacent(CT,CT2)), adjcols(CT,CL,SL).