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
f([4, 2, 66, 14, 22],14).
f([86, 96, 78, 37, 51, 19, 1, 80, 60, 54, 14, 60, 67, 43, 79, 6, 42, 49, 13, 45, 53, 69, 78, 82, 60, 70, 52, 51, 101],6).
f([8, 40, 38, 70, 30],40).
f([9, 79, 1, 28, 93, 88, 64, 24, 78, 77, 10, 21, 86, 95, 52, 15, 22, 46, 3, 28, 75, 57, 94, 21, 90, 98, 55, 22, 73, 5, 91, 45, 33, 19, 60, 81, 92, 9, 6, 33, 62, 16, 71, 60, 36, 93, 88, 1],88).
f([4, 35, 57, 62, 99, 42, 63, 8, 41, 82, 3, 34, 95, 13, 12, 90, 89, 72, 8, 81, 32, 62, 25, 13, 3, 15, 67, 69, 31, 101, 78, 67, 57, 70, 88, 79, 74, 18, 90, 45, 56, 8, 80, 101, 4, 94, 41, 72, 101],15).
f([78, 64, 61, 36, 92, 40, 19, 37, 52, 91, 74, 93, 42, 27, 76, 64, 26, 55, 46, 11, 66, 92, 57, 20, 55, 94, 3, 58, 58, 93, 27, 1, 74, 5, 24, 58, 51, 47, 42, 84],1).
f([57, 40, 23],23).
f([61, 93, 80, 83, 50, 68, 9, 89, 61, 74, 60, 2, 73, 38, 23, 34, 58, 69, 73, 34, 57, 55, 92, 30, 66, 50, 4, 89, 50, 31, 84, 88, 7, 99, 42, 71],99).
f([74, 6, 79, 48, 51, 71, 69, 4, 39, 52, 47, 97, 50, 24, 75, 54, 92, 4, 30, 42, 17, 24, 20, 60, 52, 38, 19, 49, 88, 67, 96, 88, 7, 9, 24, 101, 40, 95, 19, 96, 79],42).
f([79, 39, 88, 91, 73, 83, 86, 50, 89, 35, 20, 83, 81, 80, 45, 66, 16, 88, 99, 15],88).
:-end_in_pos.
:-begin_in_neg.
f([56, 5, 40, 36, 43, 26, 62, 25, 9, 36, 35, 78, 81, 23, 38, 8, 75, 26, 101, 55, 23, 47, 11, 84, 28, 21, 45, 11, 17, 11, 16, 70, 39, 14],27).
f([91, 94, 84, 3, 100, 31, 38, 50, 77, 83, 79, 63, 67, 59, 48, 49, 17, 39, 43, 94, 74, 59, 42, 67, 38, 71, 70, 15, 68, 36, 60, 88, 3, 66, 26, 87, 54],23).
f([3, 92, 24, 67, 42, 33, 83, 66, 9, 75],57).
f([3, 72, 2, 18, 5, 11, 85, 14, 27, 56, 76, 31, 89, 77, 46, 39, 22, 28],25).
f([90, 21, 34, 51, 8, 11, 80, 71, 15, 81, 87, 33, 20, 18, 81, 20, 91, 3, 4, 7, 41, 8, 43, 49, 83, 32, 98, 86, 73, 75, 44, 63, 90, 74, 33, 66, 101, 36, 94, 75, 70, 30],16).
f([18, 90, 36, 63, 40, 67, 99, 1, 37, 75, 96, 93, 89, 29, 46, 47, 45, 74, 36, 56, 12, 82, 34, 49, 63, 84, 15, 9, 83, 85, 73, 14, 5, 56, 96, 34, 65, 22, 76, 76, 83, 8, 34, 53, 85, 43, 31, 27, 48, 68],78).
f([88, 44, 22, 25, 12, 9, 35, 37, 75, 50, 75, 2, 87, 11, 96, 12, 39, 100],63).
f([74, 86, 26, 91, 24, 88, 45, 42, 43, 93, 61, 30, 91, 14, 78, 24, 32, 1, 72, 19, 37, 28, 9, 67, 96, 40, 48, 95, 23, 85, 75, 61, 16, 2, 24, 31, 12, 86, 49, 17, 55, 50, 52],73).
f([69, 3, 6, 93, 54],13).
f([53, 1, 96, 65, 81, 95, 66, 92, 72, 100, 52, 58, 4, 16, 74, 57, 84, 52, 60, 88, 93, 79, 14, 27, 94, 30, 100, 44, 46, 99, 31, 79, 90, 60, 97, 50, 29],49).
:-end_in_neg.
