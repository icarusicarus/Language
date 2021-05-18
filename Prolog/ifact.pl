ifact(0, X, X).
ifact(N, A, X) :-
    N > 0,
    M is N - 1,
    Y is N * A,
    ifact(M, Y, X).
