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
f([57, 36, 94, 79, 91, 39, 12, 93, 54, 91, 43, 5, 7, 2, 45, 7, 86, 5, 55, 29, 73, 57, 95, 92, 5, 24, 3, 19],54).
f([55, 89, 84, 24, 91, 93, 11, 47, 18, 6, 17, 36, 86, 27, 29, 32],18).
f([64, 7, 6, 14, 46, 95, 82, 42, 101, 21],101).
f([62],62).
f([19, 38, 87, 97, 43, 55, 27, 91, 54, 85, 34, 91, 53, 72, 39, 17, 95, 65, 62, 85, 58, 15, 88, 100, 62, 10, 14, 23, 47, 5, 45, 12, 51, 50, 11, 73, 39, 32, 68, 101, 98, 91, 31, 88, 46, 55],31).
f([45, 43, 44, 52, 90, 22, 30, 6, 48, 31, 36, 65, 33, 23, 14, 5, 90, 10, 27, 16, 73, 66, 24, 59, 16, 22, 37, 41, 96, 90, 14, 94, 84, 89, 9, 47, 18, 72, 4, 66, 53, 39, 78, 79, 54, 3, 97, 101, 50],73).
f([82, 9, 81, 2, 21, 32, 13, 5, 36, 19, 22, 98, 50, 57, 80, 56, 64, 100, 66, 90],50).
f([67, 62, 79, 78, 53, 6, 12, 96, 61, 45],12).
f([74, 94, 76, 60, 12, 7, 76, 8, 68, 64, 39, 54, 13, 63, 17, 33, 97, 4, 21, 87, 93, 68, 100, 21, 71, 69, 36, 81],68).
f([100, 66, 15, 46, 27, 52, 77, 38, 75, 80, 85, 19, 25, 100, 63, 70, 64, 33, 37, 18, 52, 85, 81, 44, 44, 36, 33, 101, 49, 12, 88, 44, 72, 16, 12, 73, 36, 77, 24, 39, 1, 14, 61, 92, 33, 92, 28],100).
:-end_in_pos.
:-begin_in_neg.
f([78, 86, 22, 61, 19, 18, 82, 23, 70, 59, 41, 65, 46, 101, 23, 20, 49, 88, 3, 45, 46, 85, 33, 78, 24, 7, 18, 5, 68, 42],10).
f([62, 31, 47, 59, 34, 56, 86, 62, 40, 96, 26, 95, 29, 72, 50, 48, 98, 101, 47, 15, 93, 101, 83],54).
f([37, 20, 18, 10, 68, 89, 92, 42, 9, 85, 92, 1, 68, 12, 95, 58],49).
f([9],10).
f([44, 99, 66, 21, 29, 91, 60, 19, 54, 80, 11, 79, 26, 64, 56, 71, 82, 101, 26, 94, 33, 12, 80, 44, 25, 61, 51],68).
f([95, 77, 40, 87, 27, 44, 97, 97, 20, 57, 25, 24, 3, 36, 81, 49, 43, 64, 44, 77, 43, 55, 5, 40, 46, 66, 69, 42, 81, 31, 57, 80, 53, 48, 71, 13, 62, 15, 16, 34, 35, 11],23).
f([27, 28, 99, 16, 70, 24, 59, 65, 1, 81, 12, 12, 8, 28, 65, 83, 94, 45, 47, 17, 100, 57, 60, 37, 61],62).
f([25, 98, 3, 82, 15, 19, 27, 64, 52, 16, 52, 17, 83, 42, 42, 44, 84, 38, 47, 76, 19, 70, 36, 48, 80, 66, 79, 16, 20, 19, 82, 6, 100, 44, 33, 55, 19, 31, 56, 70, 65, 89, 68, 71],59).
f([72, 78, 71, 64, 58, 22, 82, 78, 101, 82, 67, 47, 80, 25, 78, 62, 30, 56, 99, 67, 28, 30, 38],16).
f([11, 80, 35, 44, 90, 86, 34, 22, 94, 49, 85, 10, 69, 37, 23, 5, 53, 78, 81, 47, 62, 86, 78, 69, 16, 19, 68, 37, 95],29).
:-end_in_neg.
