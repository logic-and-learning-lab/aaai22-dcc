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
f([80, 83, 101, 80, 80, 84, 60, 25, 13, 61, 13, 71, 72, 79, 16, 80, 80, 16, 44, 95, 85, 17, 18, 58, 54, 88, 91, 43, 42, 85, 17, 81, 79, 99, 24, 82, 60, 50, 73],13).
f([7, 50, 78, 91, 40, 23, 71, 4, 61, 5, 42, 29, 15, 88, 67, 7, 96, 34, 85, 81, 73, 27, 93, 74, 91, 99, 15, 79, 16],99).
f([20, 31, 25, 87, 60, 98, 76, 4, 55, 95, 62, 46, 29, 28],95).
f([86, 42, 19, 7, 17, 94, 47, 71, 84, 48, 10, 90, 56, 34, 54, 30, 70, 86, 4, 79, 39, 13, 46, 86, 75, 69, 79, 62, 21, 69, 88, 70, 58, 24],86).
f([7, 99, 80, 76, 45, 101, 55, 67, 99, 74, 1, 5, 4, 90, 80, 97, 33, 72, 39, 14, 39, 51, 39, 49, 57, 46, 55, 15, 57, 3, 24, 80, 54, 88, 95, 28, 72, 72],80).
f([9, 21, 21, 48, 89, 36, 53, 94, 46, 34, 46, 31, 86],21).
f([90, 53],90).
f([32, 23, 16, 20, 77, 66, 17, 49, 84, 2, 80, 1, 1, 15, 55, 34, 53, 35],53).
f([25, 17, 48, 16, 54, 62, 95, 2, 7, 52, 97, 47, 24, 5, 17, 54, 32, 95, 23, 21, 2, 28, 47, 37, 60, 69, 37, 4, 7, 81, 71, 51, 100, 47, 70, 71, 66, 33, 75, 92, 88, 36, 15, 91, 97, 80],92).
f([24, 39, 47, 72, 5, 96, 44, 3, 5, 1, 71, 99, 74, 81, 98, 96, 68, 34, 21, 83, 71, 43, 90, 11, 82, 12, 83, 84, 90, 26, 29, 74, 31, 49, 69, 7, 59, 58, 57, 83, 89, 85, 27, 6],1).
:-end_in_pos.
:-begin_in_neg.
f([48, 69, 59, 4, 81, 38, 77, 31, 68, 22, 79, 25, 37, 72, 43, 85, 25, 46, 72, 5, 41, 77, 99, 93, 61, 64, 71, 51, 84, 34, 63, 88, 57, 44, 40, 61, 35, 33, 46, 23, 63, 46, 12, 32, 28, 98],91).
f([88, 55, 95, 11, 69, 25, 65, 47, 96, 89, 100, 49, 9, 63, 10, 85, 61, 92, 56, 93, 34, 30, 2, 52, 47, 24, 77, 94, 10, 79, 44, 101, 10, 45, 45, 68, 91, 30, 29, 4, 88, 23, 63, 19, 31],35).
f([89, 93, 25, 36, 41, 18, 84, 47, 98, 19, 101, 29, 4, 97, 35, 51, 48, 8, 20, 21, 78, 63, 101, 74, 64, 89, 2, 31, 44, 55, 37, 68, 58, 68, 7, 32, 94, 44, 16],60).
f([17, 68, 18, 98, 24, 41, 76, 28, 89, 100, 51, 8, 76, 35, 40, 42, 34, 6, 62],47).
f([19, 26, 54, 84, 85, 49, 48, 100, 74, 59, 2, 22],30).
f([24, 89, 11, 21, 1, 60, 96, 76, 16, 9, 62, 49, 34, 53, 36, 13, 54, 100, 74, 24, 65, 40, 82, 21, 34, 18, 12, 67, 93, 44, 63, 52, 79, 94, 46, 12, 32],55).
f([74, 69, 81, 31, 75, 12, 70, 51, 89, 17, 19, 12, 63, 21, 98, 2, 57, 52, 72, 96, 78, 91, 33, 93, 86, 97, 10, 72, 49, 23, 96, 91, 26, 35],66).
f([74, 3, 46, 7, 71, 96, 8, 27, 29, 9, 23, 31, 100, 28, 100, 101, 25, 82, 44, 61, 22, 43, 67, 61, 16, 33, 72, 77, 25, 53, 74, 12, 77, 71, 17, 40, 14, 56, 86, 29, 96],24).
f([90, 29, 91, 47, 90, 51, 36, 63, 25, 37, 16, 41, 80, 27, 90, 76],14).
f([96, 31, 72, 27, 64, 44, 34, 22, 63, 56, 98, 8, 38, 80, 37, 38, 40, 7, 38, 64, 80, 50, 79, 14, 67, 50, 88, 27, 18, 84, 42, 77, 78, 83, 22, 26, 28, 90, 59, 90, 29, 99, 52],43).
:-end_in_neg.
