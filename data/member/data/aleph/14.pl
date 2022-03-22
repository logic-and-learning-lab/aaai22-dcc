:- use_module(library(aleph)).
:- if(current_predicate(use_rendering/1)).
:- use_rendering(prolog).
:- endif.
:- aleph.
:-style_check(-discontiguous).

:- aleph_set(i,6).
:- aleph_set(clauselength,6).
:- aleph_set(nodes,30000).

%% :- modeh(*,f(+list,-element)). % PROBLEM SPECIFIC
:- modeb(*,head(+list,-element)).
:- modeb(*,tail(+list,-list)).
:- modeb(*,geq(+element,+element)).
:- modeb(*,empty(+list)).
:- modeb(*,even(+element)).
:- modeb(*,odd(+element)).
:- modeb(*,one(+element)).
:- modeb(*,zero(-element)).
:- modeb(*,decrement(+element,-element)).
%% :- modeb(*,increment(+element,-element)). % PROBLEM SPECIFIC
%% :- modeb(*,element(+list,-element)). % PROBLEM SPECIFIC
%% :- modeb(*,cons(+element,+list,-list)). % PROBLEM SPECIFIC
:- modeh(*,f(+list,-element)).
:- modeb(*,f(+list,-element)).
%% :- modeb(*,cons(+element,+list,-list)).

:- determination(f/2,head/2).
:- determination(f/2,tail/2).
:- determination(f/2,geq/2).
:- determination(f/2,empty/1).
:- determination(f/2,even/1).
:- determination(f/2,odd/1).
:- determination(f/2,one/1).
:- determination(f/2,zero/1).
:- determination(f/2,decrement/2).
:- determination(f/2,f/2).
%% :- determination(f/2,element/2).
%% :- determination(f/2,increment/2).
%% :- determination(f/2,element/2).
%% :- determination(f/2,cons/3).
:-begin_bg.
is_list([]).
is_list([_|_]).

increment(A,B):-
    (nonvar(A) -> \+ is_list(A); true),
    (nonvar(B) -> \+ is_list(B); true),
    succ(A,B).

decrement(A,B):-
    (nonvar(A) -> \+ is_list(A); true),
    (nonvar(B) -> \+ is_list(B); true),
    succ(B,A).

my_length(A,B):-
    (nonvar(A) -> is_list(A); true),
    (nonvar(B) -> \+is_list(B); true),
    length(A,B).

cons(A,B,C):-
    append([A],B,C).
comps([H|T],H,T).

tail([_|T],T).
head([H|_],H).
sum(A,B,C):-
    (nonvar(A) -> \+ is_list(A); true),
    (nonvar(B) -> \+ is_list(B); true),
    (nonvar(C) -> \+ is_list(B); true),
    C is A+B.
empty([]).

element([X|_],X):-!.
element([_|T],X):-
    element(T,X).

empty_in([]).
empty_out([]).

zero(0).
one(1).

gt(A,B):-
    nonvar(A),
    nonvar(B),
    \+is_list(A),
    \+is_list(B),
    A > B.

geq(A,B):-
    nonvar(A),
    nonvar(B),
    \+is_list(A),
    \+is_list(B),
    A >= B.

even(A):-
    nonvar(A),
    \+ is_list(A),
    0 is A mod 2.

odd(A):-
    nonvar(A),
    \+ is_list(A),
    1 is A mod 2.
:-end_bg.
:-begin_in_pos.
f([97, 6, 56, 31, 50, 31, 75, 71, 83, 57, 19, 56, 78, 39, 8, 78, 21, 43, 9, 96, 36, 57, 93, 45, 52],36).
f([50, 27, 14, 16, 47, 87, 24, 89, 24, 35, 72, 39, 24, 41, 35, 16, 100, 40],87).
f([58, 37, 24, 1, 95, 35, 101, 59, 72, 72, 44, 79, 37, 77, 86, 74, 60, 35],74).
f([23, 71, 22, 29, 42, 98, 27, 79, 57, 54, 68, 1, 53, 71, 29, 81, 32, 21, 26, 66, 36, 50, 90, 37, 60, 4, 101, 61, 96, 52, 55, 54, 41, 34, 39, 40, 26, 32, 87, 19, 33, 72, 21],26).
f([36, 41, 23, 7, 72, 61, 1, 31, 98, 12, 42, 72, 74, 74, 53, 8, 27, 15, 92, 66, 13, 23, 12, 91, 26, 75, 62, 88, 11, 97, 17, 92, 31, 22, 93, 7],17).
f([2, 25, 78, 13, 46, 24, 62, 23, 69, 20, 91, 9, 33, 86, 53, 97, 30, 3, 36, 74, 4, 48, 84, 49, 69, 75, 95, 97, 17, 29],78).
f([91, 46, 40, 96, 57, 95, 8, 18, 15, 86, 96, 1, 67, 6, 75, 21, 58, 31, 39, 80, 64, 68, 88, 70, 23, 69, 97, 33, 2, 9, 91, 7, 68, 40, 59, 40],9).
f([71, 18, 27, 51, 48, 15, 49, 99, 77, 77, 2, 25, 32, 90, 77, 72, 81, 79],49).
f([17, 37, 20, 101, 10, 59, 87, 12, 6, 81, 87, 52, 74, 50, 70, 97, 96, 74, 71, 62, 3, 22, 67, 91, 1, 75, 99, 26, 50, 95, 22, 28, 45, 72, 13, 20, 71, 3, 67],52).
f([72, 87, 20, 85, 100, 12, 60],20).
:-end_in_pos.
:-begin_in_neg.
f([68, 89, 92, 71, 88, 59, 51, 56, 93, 95, 83, 80, 78, 18, 77, 93, 82, 23, 46, 19, 98, 73, 35, 2, 47, 17, 57],87).
f([79, 80, 20, 91, 50, 79, 22, 43, 29, 72, 84, 44, 79, 32, 76, 64],67).
f([21, 33, 56, 34, 59, 27, 81, 39, 62, 100, 9, 41, 89, 22, 69, 1, 95, 77, 9, 21, 65, 3, 9, 71, 27, 34, 98, 90, 75, 1, 2, 8, 9, 97, 51, 42, 60, 77, 76, 5, 82, 7, 1, 71, 87, 56, 64, 17],58).
f([56, 31, 66, 34, 2, 33, 32, 73, 18, 62, 97, 56, 16, 90],49).
f([92, 91, 33, 89, 19, 43, 79, 71, 3, 46, 99, 39],35).
f([98, 62],21).
f([15, 35, 54, 81, 24, 79, 57, 15, 2, 98, 22, 62, 61, 94, 74, 7, 91, 9, 43, 41, 59, 58, 63, 58, 92, 42],84).
f([25, 78, 1, 33, 48, 53, 93, 76, 89, 21, 9, 21, 77, 59, 96, 43],46).
f([76, 6, 6, 29, 72, 69, 41, 84, 78, 52, 21, 41, 28, 5, 91, 19],18).
f([68, 13, 10, 91, 51, 39, 59, 82, 45, 101, 28, 55, 78, 91, 74, 80, 51, 69, 35, 32, 73, 54, 57, 42, 74, 56, 68, 100, 74, 4, 73, 83, 23, 59, 60, 5, 94, 97, 48, 6, 9],92).
:-end_in_neg.
