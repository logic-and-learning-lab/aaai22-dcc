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
:- modeh(*,f(+list,+element,-list)).
:- modeb(*,f(+list,+element,-list)).

:- determination(f/3,head/2).
:- determination(f/3,tail/2).
:- determination(f/3,geq/2).
:- determination(f/3,empty/1).
:- determination(f/3,even/1).
:- determination(f/3,odd/1).
:- determination(f/3,one/1).
:- determination(f/3,zero/1).
:- determination(f/3,decrement/2).
:- determination(f/3,f/3).
%% :- determination(f/3,increment/2).
%% :- determination(f/3,element/2).
%% :- determination(f/3,cons/3).
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
f([96, 89, 12, 61, 81, 55, 97, 6, 7, 50, 93, 15, 25, 4, 35, 19, 71, 20, 47, 75],12,[25, 4, 35, 19, 71, 20, 47, 75]).
f([72, 83, 42, 91, 23, 77, 75, 42, 82, 12, 62, 38, 38, 77, 3, 9, 50, 80, 19, 48, 98, 73, 79, 97, 100, 99, 21, 21, 81, 18, 46, 55, 59, 36, 15, 50, 59, 27, 8, 26, 3, 15, 43],41,[15, 43]).
f([93, 1, 80, 54, 54, 37, 55, 21, 89, 15, 101, 47, 47, 96, 82, 36, 79, 4, 89, 46, 52, 99, 31, 97, 75, 58, 77, 59, 39, 93],29,[93]).
f([29, 28, 93, 76, 90, 13, 69, 69, 53, 82, 73, 3, 68, 17, 80, 17, 76, 11, 84, 98, 57, 76, 75, 79, 43, 26, 82, 82, 71, 47, 43],21,[76, 75, 79, 43, 26, 82, 82, 71, 47, 43]).
f([60, 27, 18, 98, 61, 41, 27, 36, 16, 22, 99, 39, 101, 18, 50, 78, 101, 24, 34, 45, 12, 22, 25, 66, 60, 101, 61, 84, 95, 92, 13, 90, 20, 69, 33],35,[]).
f([5, 6, 52, 73, 39, 18, 31, 67, 60, 61, 20, 65, 75, 71, 24, 3, 8, 26, 6, 37],13,[71, 24, 3, 8, 26, 6, 37]).
f([42, 29, 97, 66, 17, 51, 91, 29, 96, 30, 3, 30, 71, 88, 1, 63, 57, 67, 8, 21, 72, 23, 85, 38, 66, 33, 29, 7, 79, 9, 64, 58, 85, 23, 98, 15, 16, 51, 31, 101, 76, 55, 101, 100, 41, 27, 42, 49],8,[96, 30, 3, 30, 71, 88, 1, 63, 57, 67, 8, 21, 72, 23, 85, 38, 66, 33, 29, 7, 79, 9, 64, 58, 85, 23, 98, 15, 16, 51, 31, 101, 76, 55, 101, 100, 41, 27, 42, 49]).
f([15, 2, 1, 5, 91, 38, 48, 28, 12, 41, 70],1,[2, 1, 5, 91, 38, 48, 28, 12, 41, 70]).
f([3, 3, 31, 78],3,[78]).
f([95, 95, 91, 91, 15, 98, 38, 32, 46, 89, 82, 100, 54, 42, 31, 13, 49, 97, 98, 101, 56],1,[95, 91, 91, 15, 98, 38, 32, 46, 89, 82, 100, 54, 42, 31, 13, 49, 97, 98, 101, 56]).
:-end_in_pos.
:-begin_in_neg.
f([89, 4, 86, 68, 26, 77, 28, 31, 90, 4, 21, 61, 16, 20, 88],3,[90, 4, 21, 61, 16, 20, 88]).
f([7, 48, 101, 88, 40, 37, 60, 14, 39, 54, 20, 76, 99, 58, 69, 54, 55, 19, 97, 75, 59, 47, 28, 15, 74, 97, 100],12,[97, 100]).
f([61, 80, 57, 92, 31, 38, 37, 25, 58, 74, 2, 101, 1, 71, 39, 27],5,[1, 71, 39, 27]).
f([70, 2, 93, 67, 5, 75, 66, 55, 29],6,[29]).
f([70, 66, 40, 95, 53, 2, 83, 63, 61, 89, 55, 52, 90, 84, 92, 11, 43, 25, 62, 32, 44, 65, 43, 71, 74, 56, 68, 70, 67, 91, 84, 77, 57, 71, 87, 50, 66, 51, 49, 7, 48, 86, 93, 37, 68],28,[25, 62, 32, 44, 65, 43, 71, 74, 56, 68, 70, 67, 91, 84, 77, 57, 71, 87, 50, 66, 51, 49, 7, 48, 86, 93, 37, 68]).
f([9, 43, 63, 26, 26, 76, 61, 53, 99, 82, 96, 8, 67, 46, 67, 13, 100, 32, 40, 73, 34, 54, 57, 92, 34, 77, 55, 92, 6, 79, 23, 31, 64, 73, 49],25,[43, 63, 26, 26, 76, 61, 53, 99, 82, 96, 8, 67, 46, 67, 13, 100, 32, 40, 73, 34, 54, 57, 92, 34, 77, 55, 92, 6, 79, 23, 31, 64, 73, 49]).
f([91, 93, 55, 66, 58, 16, 26, 38, 11, 86, 51, 80, 91, 59, 93, 24, 94, 32, 21, 9, 45],5,[55, 66, 58, 16, 26, 38, 11, 86, 51, 80, 91, 59, 93, 24, 94, 32, 21, 9, 45]).
f([61, 87, 51, 87, 11, 2, 3, 86, 66, 41, 75, 75, 36, 61, 79, 29, 20, 56, 63, 3, 31, 76, 33, 92, 40, 59, 58, 84, 56, 83, 81, 54, 7, 45, 12, 21, 45, 86, 29, 50, 91, 55, 94, 74, 61, 59, 58, 46, 23, 85, 4],2,[41, 75, 75, 36, 61, 79, 29, 20, 56, 63, 3, 31, 76, 33, 92, 40, 59, 58, 84, 56, 83, 81, 54, 7, 45, 12, 21, 45, 86, 29, 50, 91, 55, 94, 74, 61, 59, 58, 46, 23, 85, 4]).
f([64, 44, 23, 52, 89, 63, 22, 15, 89, 13, 88, 29, 77, 72, 41, 34, 73, 59, 22, 76, 62, 23, 4, 5, 35, 78, 11, 7],26,[78, 11, 7]).
f([91, 51, 20, 73, 27, 1, 47, 10, 20, 57, 47, 78, 78, 69, 98, 92, 17, 69, 20, 68, 82, 36, 47, 11, 77, 19, 91, 54, 74, 69, 65, 61, 37, 26, 53],28,[82, 36, 47, 11, 77, 19, 91, 54, 74, 69, 65, 61, 37, 26, 53]).
:-end_in_neg.
