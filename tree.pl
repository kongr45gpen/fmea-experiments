:- use_rendering(svgtree, [list(false)]).

pind(event1, 0.51).
pind(event2, 0.3).

p(A, P) :- pind(A, P).

p(not(A), P) :-
    p(A, PN),
    P is 1 - PN.

p(and(A, A) , P) :-
    p(A, P).

p(and(A, B) , P) :-
    A \= B,
    pind(A, P1),
    pind(B, P2),
    P is P1 * P2.

p(or(A, A) , P) :- pind(A, P).

p(or(A, B) , P) :-
    A \= B,
    pind(A, P1),
    pind(B, P2),
    P is 1 - (1 - P1) * (1 - P2).
    
