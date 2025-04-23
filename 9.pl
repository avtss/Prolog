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

fact_up(0, 1) :- !.
fact_up(N, F) :-
    N > 0,
    N1 is N - 1,
    fact_up(N1, F1),
    F is N * F1.

fact_down(N, F) :- fact_down(N, 1, F).
fact_down(0, Acc, Acc) :- !.
fact_down(N, Acc, F) :-
    N > 0,
    NewAcc is Acc * N,
    N1 is N - 1,
    fact_down(N1, NewAcc, F).

is_square_free(N) :-
    N > 0,
    \+ (between(2, N, D),
        D*D =< N,
        0 is N mod (D*D)).

r_list(A, N):-r_list(A, N, 0, []).
r_list(A, N, N, A):-!.
r_list(A, N, K, B):-read(X), append(B,[X],B1), K1 is K+1, r_list(A, N, K1, B1).

w_list([]):-!.
w_list([H|T]) :- write(H), nl, w_list(T).

my_ap([], Y, Y).
my_ap([H|T], Y, [H|T1]) :- my_ap(T, Y, T1).

min_digit(N, Min) :-
    N > 0,
    min_digit(N, 9, Min).

min_digit(0, Min, Min).
min_digit(N, CurrentMin, Min) :-
    N > 0,
    Digit is N mod 10,
    NewMin is min(Digit, CurrentMin),
    Next is N // 10,
    min_digit(Next, NewMin, Min).

count_digits_less_3(N, Count) :-
    N >= 0,
    count_digits_less_3(N, 0, Count).

count_digits_less_3(0, Acc, Acc).
count_digits_less_3(N, Acc, Count) :-
    N > 0,
    Digit is N mod 10,
    (Digit < 3 -> NewAcc is Acc + 1; NewAcc is Acc),
    Next is N // 10,
    count_digits_less_3(Next, NewAcc, Count).

count_divisors(N, Count) :-
    N > 0,
    Max is floor(sqrt(N)),
    count_divisors(N, 1, Max, 0, Count).

count_divisors(N, D, Max, Acc, Count) :-
    D > Max, !,
    Count is Acc * 2.
count_divisors(N, D, Max, Acc, Count) :-
    N mod D =:= 0,
    (D =:= N div D -> NewAcc is Acc + 1; NewAcc is Acc + 2),
    D1 is D + 1,
    count_divisors(N, D1, Max, NewAcc, Count).
count_divisors(N, D, Max, Acc, Count) :-
    N mod D =\= 0,
    D1 is D + 1,
    count_divisors(N, D1, Max, Acc, Count).