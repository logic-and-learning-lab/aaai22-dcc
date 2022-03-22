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
f([87, 57, 96, 56, 26, 42, 90, 33, 58, 97, 86, 85, 96, 40, 9, 48, 88, 18, 100, 8, 66, 80, 76, 5, 62, 24, 92, 77, 47, 96, 47, 4, 16, 55, 80, 77, 30, 75, 3, 60, 28, 3],47).
f([95, 46, 17, 63, 19, 45, 43, 57, 10, 84, 24, 13, 94, 36, 22, 39],95).
f([99, 82, 90, 24, 14, 14, 72, 39, 34, 81, 55, 84, 6, 40, 15, 52, 78, 74, 92, 69, 57, 9, 31, 58, 98, 68, 40, 27, 82, 42, 3, 21, 40, 76, 47, 23, 6, 67, 37, 32, 51, 6],27).
f([2, 35, 26, 90, 66, 60, 40, 12],60).
f([89, 58, 36, 97, 30, 43, 2, 7, 19, 96, 76, 17, 51, 6, 84, 34, 65, 40, 68, 6, 80, 21, 86, 35, 51, 39, 35, 91, 63, 54, 32, 6, 68, 19, 57, 50, 53, 79, 79, 40, 10, 89, 47, 45, 30, 76, 62, 41],6).
f([27, 10, 69, 76, 69, 42, 97, 37, 33, 29, 69, 28, 24, 97, 11, 6, 34, 91, 96, 64, 57, 10, 68, 76, 11, 91],97).
f([42, 50, 81, 50, 26, 20, 33, 85, 19, 47, 25, 31],42).
f([63, 88, 15, 57, 15, 72, 44, 51, 35, 38, 61, 75, 29, 96, 71, 47],29).
f([45, 57, 87, 95, 2, 80, 58, 20, 32, 21, 82, 13, 54, 94, 66],94).
f([20, 58, 13, 60, 31, 35, 94, 46, 72, 83, 8, 66, 43, 17, 44, 48, 25, 32, 25, 25],66).
:-end_in_pos.
:-begin_in_neg.
f([40, 95, 67, 74, 85, 6, 5, 33, 22, 39, 80, 48, 55, 23, 96, 84, 53, 22],76).
f([101, 18, 27, 11, 91, 29, 3, 65, 23, 24, 19, 82, 26, 64, 96, 64, 35, 40, 10, 33, 56, 97, 58, 86, 91, 38, 79, 9, 47],30).
f([45, 28, 95, 36, 30, 62, 44, 3, 95, 43, 83, 10, 100],82).
f([78, 11, 32, 69, 83, 26, 71, 70, 20, 10, 80, 77, 31, 71, 3, 39, 8, 56, 89, 13, 27, 19, 8, 52, 53],40).
f([8, 100, 44, 13, 57, 55, 14, 98, 35, 29, 61, 46, 26, 26, 94, 74, 67, 80, 85, 31, 65, 25, 2, 51, 63, 12, 1, 22, 57, 64, 64, 88],52).
f([29, 2, 31, 91, 46, 46, 56, 28, 10, 17, 61, 42, 27, 88, 36, 95, 65, 82, 18, 62, 88, 13, 9, 51, 6, 74, 53, 91, 47, 44, 51, 85, 70, 90, 11, 17, 55, 35, 64, 96, 11, 7, 48, 82, 6],37).
f([65, 67, 31, 66, 74, 1, 67, 23, 71, 93, 88, 92, 56, 83, 65, 79, 73, 20, 29, 6, 54, 43, 13, 49, 68, 78, 42, 96, 24, 39, 54, 51, 54, 43, 13, 17, 42],47).
f([7],47).
f([60],1).
f([19, 93, 61, 81],88).
:-end_in_neg.
