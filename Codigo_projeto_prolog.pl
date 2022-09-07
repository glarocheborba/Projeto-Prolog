child(redhair, widow).
child(i, dad).
child(onrun, dad).
child(baby, i).

male(i).
male(dad).
male(onrun).
male(baby).

female(redhair).
female(widow).

spouse(i, widow).
spouse(widow, i).
spouse(dad, redhair).
spouse(redhair, dad).

stepchild(X,Y) :- spouse(Y,Z), child(X,Z); spouse(Y,Z), child(W,Z), spouse(W,X); child(Z,Y), spouse(Z,X).

parent(X, Y) :- child(Y, X); stepchild(Y,X).

father(X, Y) :- child(Y, X), male(X); stepchild(Y,X), male(X).

mother(X, Y) :- child(Y, X), female(X); stepchild(Y,X), female(X).

son(X, Y) :- child(X, Y), male(X); stepchild(X, Y), male(X).

daughter(X, Y) :- child(X, Y), female(X); stepchild(X, Y), female(X).

brother(X, Y) :- male(X), child(X, Z), child(Y, Z), not(X=Y); male(X), stepchild(X,Z), child(Y,Z), not(X=Y); male(X), stepchild(X,Z), stepchild(Y,Z), not(X=Y). 

sister(X, Y) :- female(X), child(X, Z), child(Y, Z), not(X=Y); female(X), stepchild(X,Z), child(Y,Z), not(X=Y); female(X), stepchild(X,Z), stepchild(Y,Z), not(X=Y). 

uncle(X, Y) :- brother(X, Z), child(Y, Z); brother(X, Z), stepchild(Y, Z).

aunt(X, Y) :- sister(X, Z), child(Y, Z); sister(X, Z), stepchild(Y, Z).

grandparent(X, Y) :- parent(X,Z), parent(Z,Y).

grandfather(X, Y) :- father(X,Z), parent(Z,Y).

grandmother(X, Y) :- mother(X,Z), parent(Z,Y).

grandchild(X, Y) :- grandparent(Y,X).

uncles(Resp) :- setof((X,Y), uncle(X,Y), Resp).
