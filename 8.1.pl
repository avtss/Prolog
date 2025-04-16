man(anatoliy).
man(dimitriy).
man(vlad).
man(kirill).
man(mefodiy).

woman(vladina).
woman(galya).
woman(sveta).
woman(zoya).
woman(katrin).

dite(dimitriy, anatoliy).
dite(dimitriy, galya).
dite(vladina, anatoliy).
dite(vladina, galya).
dite(kirill, dimitriy).
dite(mefodiy, dimitriy).
dite(kirill, sveta).
dite(mefodiy, sveta).
dite(zoya, vlad).
dite(zoya, vladina).
dite(katrin, vlad).
dite(katrin, vladina).

men :- man(X), write(X), nl, fail.
men.

women :- woman(X), write(X), nl, fail.
women.

children(X) :- dite(Y, X), write(Y), nl, fail.
children(X).

mother(X, Y) :- woman(X), dite(Y, X).

mother(X) :- dite(X, Y), woman(Y), write(Y), nl.

brother(X, Y) :- man(X), X \= Y, dite(X, P), dite(Y, P), !.   

brothers(X) :-
    setof(B, brother(B, X), Brothers),
    write(Brothers), nl.

b_s(X, Y) :- dite(X, Z), dite(Y, Z).

b_s(X) :- 
    setof(Y, (b_s(Y, X), Y\=X), BS),
    write(BS), nl.

daughter(X, Y) :- woman(X), dite(X, Y).
daughter(X) :- daughter(Y, X), write(Y), nl, fail.
daughter(_).

% Предикаты для мужа
husband(X, Y) :- man(X), dite(Z, X), dite(Z, Y), X \= Y.
husband(X) :- husband(Y, X), write(Y).

grand_ma(X, Y) :- woman(X), dite(Z, X), dite(Y, Z).
grand_mas(X) :- grand_ma(Y, X), write(Y), nl, fail.
grand_mas(_).

grand_ma_and_da(X, Y) :- 
    (grand_ma(X, Y), woman(Y));
    (grand_ma(Y, X), woman(X)).

aunt(X, Y) :- 
    woman(X),
    (sister(X, Z), dite(Y, Z));
    (wife(X, Z), brother(Z, W), dite(Y, W)).

aunts(X) :- aunt(Y, X), write(Y), nl, fail.
aunts(_).