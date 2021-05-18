fact(0, 1).
fact(N, X) :-
    N > 0,
    M is N - 1,
    fact(M, Y),
    X is N * Y.
