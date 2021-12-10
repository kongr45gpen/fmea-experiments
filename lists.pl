p(event1, 0.51).
p(event2, 0.3).

p(event3, P) :- p([event1, and, event2], P).

p([not | Tail], P) :-
    p(Tail, PN),
    P is 1 - PN.

p([Head | []], P) :- p(Head, P).

p([Head | [or | Tail]] , P) :-
    p(Head, P1),
    p(Tail, P2),
    P is 1 - (1 - P1) * (1 - P2).

p([Head | [and | Tail]] , P) :-
    p(Head, P1),
    p(Tail, P2),
    P is P1 * P2.

p([Head | [xor | Tail]] , P) :-
    p(Head, P1),
    p(Tail, P2),
    P is P1 + P2 - 2 * P1 * P2.
