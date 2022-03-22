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
:- modeh(*,f(+list,-list)).
:- modeb(*,f(+list,-list)).
:- modeb(*,cons(+element,+list,-list)).

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
%% :- determination(f/2,increment/2).
%% :- determination(f/2,element/2).
:- determination(f/2,cons/3).
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
f([36, 68, 46, 35, 25, 19, 35, 69, 15, 68, 56],[36, 68, 46, 35, 25, 19, 35, 69, 15, 68]).
f([64, 57, 59, 77, 54, 55, 92, 11, 14, 74, 71, 33, 37, 11, 11, 95, 18, 6, 31, 78, 50, 33, 1, 63, 101, 68, 47, 81, 83, 36, 30, 53, 8, 3, 85, 72, 10, 52, 78, 72, 40, 83, 60, 22, 81, 89, 68, 42, 94],[64, 57, 59, 77, 54, 55, 92, 11, 14, 74, 71, 33, 37, 11, 11, 95, 18, 6, 31, 78, 50, 33, 1, 63, 101, 68, 47, 81, 83, 36, 30, 53, 8, 3, 85, 72, 10, 52, 78, 72, 40, 83, 60, 22, 81, 89, 68, 42]).
f([70, 70, 99, 30, 55, 8, 77, 14, 37, 55, 72, 55, 55, 55, 1, 81, 61, 90, 12, 83, 50, 34, 46, 89, 87, 18, 72, 64, 71, 40, 50, 50],[70, 70, 99, 30, 55, 8, 77, 14, 37, 55, 72, 55, 55, 55, 1, 81, 61, 90, 12, 83, 50, 34, 46, 89, 87, 18, 72, 64, 71, 40, 50]).
f([7, 9, 99, 84, 57, 2, 51, 24, 76, 77, 35, 56, 81, 2, 41, 101, 62, 35, 28, 19, 80, 4, 96, 16, 35, 83, 46, 34, 73, 66, 50, 1, 31, 65, 41, 81, 2, 54, 55, 74, 86, 52, 51, 64, 46],[7, 9, 99, 84, 57, 2, 51, 24, 76, 77, 35, 56, 81, 2, 41, 101, 62, 35, 28, 19, 80, 4, 96, 16, 35, 83, 46, 34, 73, 66, 50, 1, 31, 65, 41, 81, 2, 54, 55, 74, 86, 52, 51, 64]).
f([49, 38, 41, 74, 72, 80, 99, 54, 71, 12, 26, 31, 42, 62, 47, 50, 29, 65, 29, 11, 38, 96, 19, 33, 6, 24, 34, 55, 20, 99, 68, 30],[49, 38, 41, 74, 72, 80, 99, 54, 71, 12, 26, 31, 42, 62, 47, 50, 29, 65, 29, 11, 38, 96, 19, 33, 6, 24, 34, 55, 20, 99, 68]).
f([13, 41, 35, 56, 74, 31, 82, 76, 5, 55, 40, 92, 9, 101, 61, 66, 81, 84, 77, 16, 13, 6, 50, 87, 55, 34, 2, 58, 23, 56, 29, 27, 26, 59, 60, 48, 69],[13, 41, 35, 56, 74, 31, 82, 76, 5, 55, 40, 92, 9, 101, 61, 66, 81, 84, 77, 16, 13, 6, 50, 87, 55, 34, 2, 58, 23, 56, 29, 27, 26, 59, 60, 48]).
f([14, 1, 67, 12, 82, 92, 67, 36, 37, 18, 9, 26, 40, 39, 3, 81, 25, 45, 82, 90, 37, 39, 13, 40, 89, 41, 37, 74, 27],[14, 1, 67, 12, 82, 92, 67, 36, 37, 18, 9, 26, 40, 39, 3, 81, 25, 45, 82, 90, 37, 39, 13, 40, 89, 41, 37, 74]).
f([66, 58, 35, 14, 80, 59, 99, 3, 71, 50, 13, 13, 4, 31, 53, 40, 67, 19],[66, 58, 35, 14, 80, 59, 99, 3, 71, 50, 13, 13, 4, 31, 53, 40, 67]).
f([58, 19, 9, 6, 68, 55, 27, 90, 45, 28, 20, 38, 87, 51, 74, 83, 88, 55, 3, 81, 55, 49, 40, 36, 87, 50, 85, 80, 60, 26, 18, 28, 95, 15, 3, 48, 65, 18, 41, 84, 54, 37, 31, 90, 32],[58, 19, 9, 6, 68, 55, 27, 90, 45, 28, 20, 38, 87, 51, 74, 83, 88, 55, 3, 81, 55, 49, 40, 36, 87, 50, 85, 80, 60, 26, 18, 28, 95, 15, 3, 48, 65, 18, 41, 84, 54, 37, 31, 90]).
f([70, 46, 63, 79, 48, 83, 1, 80, 82, 21, 36, 77, 39, 30, 29, 8, 67, 50, 78, 38, 16, 97, 8, 21, 15, 97, 49, 4, 70, 36, 13, 31, 86, 6, 90, 81, 29, 72, 93, 69, 4, 67, 66, 27, 51, 61],[70, 46, 63, 79, 48, 83, 1, 80, 82, 21, 36, 77, 39, 30, 29, 8, 67, 50, 78, 38, 16, 97, 8, 21, 15, 97, 49, 4, 70, 36, 13, 31, 86, 6, 90, 81, 29, 72, 93, 69, 4, 67, 66, 27, 51]).
:-end_in_pos.
:-begin_in_neg.
f([25, 27, 99, 21, 73, 3, 53, 34, 27, 27, 76, 41, 100, 79, 44, 28, 66, 70, 40],[25, 27, 99, 21, 73, 3, 53, 34, 27, 27, 76, 41, 100, 79, 44, 28, 66, 70, 40]).
f([86, 36, 9, 89, 72, 61, 61, 96, 83, 82, 39, 19, 97, 82, 64, 86, 78, 41, 70, 10, 85, 89, 100, 6, 30, 65, 40, 11, 41, 6, 32, 64, 66, 44, 96, 9, 6, 51, 8, 5, 75, 87, 97, 10, 87, 79, 78, 15, 29],[86, 36, 9, 89, 72, 61, 61, 96, 83, 82, 39, 19, 97, 82, 64, 86, 78, 41, 70, 10, 85, 89, 100, 6, 30, 65, 40, 11, 41, 6, 32, 64, 66, 44, 96, 9, 6, 51, 8, 5, 75, 87, 97, 10, 87, 79, 78, 15, 29]).
f([25, 83, 62, 78, 38, 26, 91, 83, 86, 82, 14, 46, 60, 54, 10, 97, 57, 9, 6, 41, 44, 19, 44, 71, 4, 74, 32, 83, 92, 29, 39, 22, 13, 43, 25],[25, 83, 62, 78, 38, 26, 91, 83, 86, 82, 14, 46, 60, 54, 10, 97, 57, 9, 6, 41, 44, 19, 44, 71, 4, 74, 32, 83, 92, 29, 39, 22, 13, 43, 25]).
f([79, 84, 34, 95, 34, 92, 74, 26, 10, 29, 39, 27, 93, 44, 55, 81, 51, 54, 31, 78, 25, 11, 92, 6, 1, 61, 81, 100, 11, 95, 54, 100, 74, 30, 24, 3, 83, 36, 74, 7, 7, 19, 3, 59, 101, 32, 5, 94, 49, 54, 16],[79, 84, 34, 95, 34, 92, 74, 26, 10, 29, 39, 27, 93, 44, 55, 81, 51, 54, 31, 78, 25, 11, 92, 6, 1, 61, 81, 100, 11, 95, 54, 100, 74, 30, 24, 3, 83, 36, 74, 7, 7, 19, 3, 59, 101, 32, 5, 94, 49, 54, 16]).
f([94, 7, 70, 96, 33, 80, 101, 4, 5, 26],[94, 7, 70, 96, 33, 80, 101, 4, 5, 26]).
f([17, 73, 24, 11, 50, 20, 49, 58, 34, 93, 54, 78, 52, 91, 16, 78, 91, 6, 45, 101],[17, 73, 24, 11, 50, 20, 49, 58, 34, 93, 54, 78, 52, 91, 16, 78, 91, 6, 45, 101]).
f([23, 33, 51, 18, 10, 82, 37, 22, 97, 41, 24, 43, 6, 24, 33, 88, 16, 65, 90, 51, 84, 77, 3, 83, 62, 16, 6, 79, 3, 35, 68, 35, 35],[23, 33, 51, 18, 10, 82, 37, 22, 97, 41, 24, 43, 6, 24, 33, 88, 16, 65, 90, 51, 84, 77, 3, 83, 62, 16, 6, 79, 3, 35, 68, 35, 35]).
f([43, 29, 12, 16, 10, 18, 13, 25, 55],[43, 29, 12, 16, 10, 18, 13, 25, 55]).
f([31, 74, 65, 13, 84, 34, 34, 52, 93, 9, 4, 64, 83, 74, 59, 87, 16, 31, 33, 33, 63, 76, 30, 62, 75, 88, 49],[31, 74, 65, 13, 84, 34, 34, 52, 93, 9, 4, 64, 83, 74, 59, 87, 16, 31, 33, 33, 63, 76, 30, 62, 75, 88, 49]).
f([94, 22, 8, 14, 37, 96, 51, 15, 37, 58, 44, 32, 40, 30, 32, 59, 15, 96, 14, 81, 89, 39, 98, 47, 35, 42, 67, 40, 89, 52, 8, 15, 5, 20, 6, 40, 30, 47, 90],[94, 22, 8, 14, 37, 96, 51, 15, 37, 58, 44, 32, 40, 30, 32, 59, 15, 96, 14, 81, 89, 39, 98, 47, 35, 42, 67, 40, 89, 52, 8, 15, 5, 20, 6, 40, 30, 47, 90]).
:-end_in_neg.
