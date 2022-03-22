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
f([77, 9, 73, 66, 9, 56, 71, 88, 42, 85, 61, 52, 5, 41, 14, 49, 61, 60, 88, 47, 48, 52, 39, 83, 44, 68, 3, 13, 54, 32, 39, 31, 37, 94, 89, 30, 70, 89],71).
f([86, 17, 88, 38, 80, 1, 73, 40, 9, 80, 40, 56, 100, 80, 12, 94, 88, 52, 85, 74, 83, 33, 40, 46, 36, 5, 66, 50, 85],100).
f([59, 25, 95, 7, 97, 37, 73, 20, 92, 72, 23, 54, 21, 12, 50, 48, 67, 74, 39, 91, 42, 93, 21, 36, 69, 62, 56, 17, 1, 16, 8, 86, 54, 32, 81, 36, 63, 45, 4, 60, 68, 57, 33, 4, 32, 61, 54, 61, 33, 46, 76],20).
f([47, 43, 92, 51, 62, 32, 46, 84, 38, 88, 48, 77, 17, 42, 2, 95, 37, 61],32).
f([46, 54, 49, 67, 94, 49, 50, 87, 65, 49, 2, 19, 8, 65, 84, 85, 37, 32, 75, 76, 7, 9, 45],87).
f([60, 67, 95, 42, 53, 26, 65, 49, 96, 6, 61, 84, 94, 13, 75, 97, 16, 43, 99, 96, 83, 17, 49, 5, 74, 21, 30, 16, 58, 4],75).
f([31, 25, 4],4).
f([59, 52, 45, 42, 24, 16, 16, 19, 95, 3, 1, 31, 39, 101, 80, 70, 74, 67, 80, 98, 43, 78, 41, 59, 63, 77, 46, 97, 43, 2, 58, 55, 41, 10, 52, 7, 63, 10, 17, 14, 49, 32, 14, 58, 51],39).
f([88, 20, 42, 62, 77],88).
f([82, 95, 80, 96, 2, 34, 1, 101, 96, 38, 50, 35, 95, 48, 6, 89, 76, 4, 87, 65, 35, 71, 73, 29, 90, 12, 66, 53, 55, 78],66).
:-end_in_pos.
:-begin_in_neg.
f([84, 66, 25, 99, 4, 70, 27, 43, 18, 34, 20, 53, 43, 71, 35, 27, 66, 56, 88, 94, 53, 4, 62, 89, 7, 28, 33, 37, 70, 32, 66, 72, 73, 13, 27, 47, 1, 42],26).
f([68],69).
f([90, 40, 12, 49, 94, 1, 19, 52],44).
f([99, 92, 17, 72, 47, 47, 89, 77, 2, 13, 57, 57, 61, 61, 26, 47, 72, 32, 61, 83, 7, 33],38).
f([13, 49, 75, 11, 69, 55, 97, 14, 22, 18, 39, 79, 73, 97, 89, 74, 87, 77, 39, 51, 20, 94, 9, 13, 15, 17, 15, 32, 48, 64, 11, 46, 12, 24, 90, 58, 52, 61, 71, 41, 27, 24, 61, 89, 80, 21, 39, 83, 101, 70],76).
f([39, 62, 82, 14, 73, 29, 9, 2, 56],76).
f([8, 47, 30, 101, 21, 56, 27, 89, 26, 13, 25, 31, 99, 89],4).
f([1, 33, 21, 99, 26, 100, 62, 95, 13, 101, 60, 49, 39, 81, 67, 26, 44, 20, 53, 90, 21, 80, 99, 44, 1, 55, 65, 21, 42, 45],23).
f([97, 62, 38, 90, 13, 38, 49, 60, 72, 49, 99, 98, 49, 73, 52, 67, 17, 31, 70, 88, 68, 50, 92, 78, 7, 86, 66, 24, 79, 83, 77, 2, 37, 79, 54, 65, 46, 93, 48, 16, 39, 85, 54, 71],55).
f([95, 78, 58, 4, 84, 99, 99, 66, 82, 7, 76, 91, 56, 35, 39, 32, 46, 19, 16, 81, 60, 30, 77, 51, 15, 51, 83, 45, 93, 92, 99, 96, 16, 28, 54, 53],48).
:-end_in_neg.
