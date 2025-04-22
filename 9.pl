max(X, Y, X) :- X>Y,!.
max(_, Y, Y).

max(X, Y, Z, U) :- 
    max(X, Y, M), max(M, Z, U).

max3(X, Y, Z, X) :- X>Y, X>Z,!.
max3(_, Y, Z, Y): Y>Z,!.
max3(_, _, Z, Z).

sumcifr(0, 0) :- !.
sumcifr(N, S) :- Cifr is  N mod 10, NewN is N div 10, sumcifr(NewN, NewSum), S is NewSum+Cifr.

sumnum(X, Answer) :-
    sumnumtailed(X, 0, Answer).
sumnumtailed(0, Acc, Acc):-!.
sumnumtailed(X, Acc, Answer) :-
    X1 is X div 10,
    Acc1 is Acc + X mod 10,
    sumnumtailed(X1, Acc1, Answer).

my_ap([], Y, Y).
my_ap([X|Tail], Y, [X|Tail]) :- my_ap(Tail, Y, Tail1).

in_list([], _) :- false.
in_list([X|Tail], X).
in_list([_|T], X) :- in_list(T, X).
