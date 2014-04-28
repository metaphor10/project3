dog(fido). large(fido).
cat(mary). large(mary).
dog(rover). dog(jane).
dog(tom). large(tom). cat(harry).
dog(fred). dog(henry).
cat(bill). cat(steve).
small(henry). large(fred).
large(steve). large(jim).
large(mike).

large_animal(X):-dog(X),large(X).
large_animal(Z):-cat(Z),large(Z).
chases(X,Y):-dog(X),cat(Y),write(X),write('chases'),write(Y),nl.

go:-chases(A,B).