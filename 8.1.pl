man(ivan).
man(petr).
man(alexey).
man(sergey).
man(dmitriy).

woman(maria).
woman(olga).
woman(anna).
woman(ekaterina).
woman(natalia).

parent(ivan, petr).
parent(ivan, olga).
parent(maria, petr).
parent(maria, olga).
parent(petr, alexey).
parent(petr, anna).
parent(ekaterina, alexey).
parent(ekaterina, anna).
parent(sergey, dmitriy).
parent(sergey, natalia).
parent(olga, dmitriy).
parent(olga, natalia).

men :- man(X), write(X), nl, fail.
men.

women :- woman(X), write(X), nl, fail.
women.

children(X) :- parent(X, Y), write(Y), nl, fail.
children(X).

mother(X, Y) :- woman(X), parent(X, Y).

mother(X) :- parent(Y, X), woman(Y), write(Y), nl.

brother(X, Y) :- man(X), X \= Y, parent(P, X), parent(P, Y), !.   

brothers(X) :-
    setof(B, brother(B, X), Brothers),
    write(Brothers), nl.

b_s(X, Y) :- parent(Z, X), parent(Z, Y).

b_s(X) :- 
    setof(Y, (b_s(Y, X), Y\=X), BS),
    write(BS), nl.

daughter(X, Y) :- woman(X), parent(Y, X).
daughter(X) :- daughter(Y, X), write(Y), nl, fail.
daughter(_).

% Предикаты для мужа
husband(X, Y) :- man(X), parent(X, Z), parent(Y, Z), X \= Y.
husband(X) :- husband(Y, X), write(Y).