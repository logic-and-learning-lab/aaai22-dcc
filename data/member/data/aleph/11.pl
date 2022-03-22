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
f([98, 41, 40, 67, 17, 23, 82, 101, 21, 55, 86, 12, 37, 99, 10, 22, 8, 72, 53, 91, 20, 60, 57, 37, 17],21).
f([54, 58, 96, 37, 15, 47, 36, 39, 19, 85, 67, 59, 73, 100, 62, 45, 36, 91, 24, 20, 57, 31, 70, 61, 67, 24, 17],57).
f([5, 90, 62, 57, 58, 63, 36, 61, 101, 43, 88, 92, 8, 16, 47, 89, 99, 67, 45, 38, 3],47).
f([28, 35, 87, 38, 36, 1, 99, 57, 16, 52, 89, 90, 33, 91, 88, 9, 1, 60, 29, 8, 80, 15, 79, 69, 26, 66, 94, 75, 93, 97, 57, 91, 100, 40, 24, 61, 69, 8, 42, 56, 84],8).
f([69, 69, 15, 4, 55, 65, 92, 7, 15, 85, 32, 11, 82, 14, 21, 95, 84, 39, 91, 51, 66, 23, 93, 74, 17, 71, 101, 22, 47, 14, 55, 84, 77, 71, 70, 55, 29, 62],23).
f([83, 43, 88, 84, 22, 26, 87, 70, 5, 27, 13, 65, 5],5).
f([41, 57, 16, 14, 12, 100, 71, 55, 52, 92, 43, 88, 74, 71, 84, 89, 55, 45, 47, 18, 24, 15, 17, 64, 24, 75, 17, 73, 61, 11, 67, 59, 73, 58, 96, 23, 6, 60, 12, 91, 11, 74, 30, 61, 31],84).
f([4, 16, 11, 8, 49, 79, 55, 53, 100, 32, 37, 64, 76, 50, 94, 50, 17, 62, 2, 89, 65, 89, 31, 72, 96, 46, 98, 75, 18, 62, 23, 59, 76, 81, 2, 28, 88, 36, 4, 43],96).
f([33, 100, 40, 39, 96, 54, 52, 89, 57],39).
f([58, 36, 49, 84],84).
:-end_in_pos.
:-begin_in_neg.
f([38, 5, 25, 97, 21, 2, 75, 21, 18, 11, 70, 25, 82, 11, 79, 65, 31, 37, 36, 31, 84, 97, 68, 70, 63, 4, 92, 87, 6, 8, 80],90).
f([29, 43, 94, 99, 21, 36, 101, 2, 2, 68, 6, 22, 17, 30, 46, 98, 49, 31, 30, 26, 58, 25, 33, 28, 101, 32, 64, 20, 66, 60, 28, 95],9).
f([94, 46, 54, 58, 82, 29, 75, 14, 81, 51, 44, 72, 9, 35, 74, 85, 88],65).
f([34, 65, 52, 77, 24, 47, 66, 48, 33, 97, 7, 29, 42, 24, 51, 8, 98, 21, 98],73).
f([51, 26, 95, 28, 46, 55, 35, 3, 37, 26, 34, 29, 25, 69, 67, 9, 34, 49, 52, 44, 86, 90, 20, 2, 59, 81, 77, 92, 50, 38, 21, 47, 53, 43, 14, 37, 26],24).
f([77, 73, 65, 96, 23, 77, 24, 13, 20, 89, 29, 99, 78, 51, 36, 66, 5, 74, 65, 27, 81, 40, 20, 92, 90, 37, 95, 15, 43, 24, 30, 60, 34, 83, 96, 65, 48],18).
f([15, 4, 66, 60, 55, 38, 52, 99, 34, 41, 43, 79, 30, 33, 54, 58, 27, 55, 92, 95, 75, 78, 75, 35],88).
f([26, 84, 86, 75, 19, 94, 87, 65, 21, 39, 3, 56, 60, 84, 26, 93, 86, 2, 74, 3, 99, 21, 13, 17, 39, 71, 83, 81, 92, 51, 72, 66, 17, 85, 34, 11, 44, 3, 95, 15, 11, 42, 53],10).
f([60, 50, 98, 33, 70, 51, 17, 28, 41, 67, 54, 3, 13],89).
f([89, 72, 78, 29, 84, 41, 34, 67, 96, 95, 57, 28, 47, 43, 15, 52, 75, 57, 77, 56, 88, 61, 48, 92, 57, 70, 80, 51, 2, 39, 57, 18, 16, 59, 55, 55, 90, 73, 85, 67, 62, 41, 68, 63, 100, 20],19).
:-end_in_neg.
