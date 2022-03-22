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
f([14, 7, 37, 24, 15, 48, 79, 52],52).
f([86, 78, 13, 35, 84, 76, 5, 64, 95, 85, 19, 97, 76, 52, 47, 74, 2, 66, 15, 94, 76, 58, 65, 9, 54, 19, 63],63).
f([82, 57, 35, 38, 1, 55, 93, 15, 21, 32, 37, 95, 35, 95, 20, 51, 28, 50, 10, 33, 69, 63, 47, 68, 56, 100, 87, 64, 93, 41, 63, 59, 13, 20, 21, 73, 70, 42],63).
f([32, 72, 28, 32, 43, 31, 73],28).
f([23, 73, 94, 94, 91, 79, 27, 75, 1, 19, 10],94).
f([67, 34, 78, 77, 40, 31],40).
f([22, 68, 3, 80, 44, 19, 36, 95, 62, 55, 11],55).
f([32, 54, 12, 38, 45, 84, 67, 58, 66, 18, 2, 1, 78, 31, 82, 54, 13, 90],18).
f([27, 100, 66, 82, 26, 13],26).
f([13, 82, 97, 61, 15, 38, 86, 95, 21, 41, 83, 97, 89, 57, 12, 79, 92, 47, 23, 87, 96, 19, 14, 56, 67, 16],97).
:-end_in_pos.
:-begin_in_neg.
f([67, 84, 8, 83],40).
f([41, 7, 19, 4, 73, 4, 7, 88, 82, 84, 72, 90, 16, 68, 13, 46, 2, 7, 44, 49, 55, 42, 3, 74, 80, 66, 93, 63, 17, 60, 64],43).
f([90, 50, 66, 87, 45, 97, 22, 91, 79, 100, 25, 16, 44, 43, 12, 31, 19, 32, 67, 26, 26, 26, 74, 53, 68, 7, 81, 21, 55, 58, 28, 72, 86, 22, 76, 73, 35, 80, 19, 40, 67, 68, 75, 81, 76, 27, 90, 98, 45, 67],3).
f([76, 23, 1, 43, 1, 51, 27, 94, 64, 101, 43, 19, 12, 71, 9, 101, 86, 1, 37, 89, 7, 94, 25, 53, 98, 48, 48, 66, 22, 69, 66, 56, 5, 68, 52, 1, 77, 85, 14, 2, 52, 72, 57, 64],87).
f([64, 1, 47, 21, 42, 77, 49, 39, 101, 72, 75, 88, 40, 100, 43, 33, 55, 96, 20, 72, 49, 79, 96, 56, 52, 78, 78, 29, 74, 58, 35, 43, 70, 7, 49, 57, 73, 61, 54, 49, 28, 38, 55, 95, 93, 5, 64, 3, 76],86).
f([89, 93, 39, 9, 64, 101, 25, 18, 34, 10, 1, 70, 47, 97, 47, 21, 97, 100, 16, 7, 21, 95, 63, 35, 93, 78, 92, 69, 53, 17, 20, 45, 26, 50],4).
f([42, 51, 57, 77, 94, 59, 97, 22, 47, 77, 93, 68, 48, 78],34).
f([33, 65, 14, 38, 73, 1, 94, 22, 54, 59, 85, 64, 13, 41, 59, 61, 17, 21, 50, 39, 75, 9, 95, 73, 88, 99, 47, 37, 90, 97],72).
f([14, 40, 18, 79, 59, 43, 83, 39, 64, 24, 77, 4, 36, 49, 39, 98, 71, 86, 98, 76, 73, 77, 25, 11, 29, 78, 56, 51, 99, 70, 67, 63, 21, 33, 82, 89, 19],54).
f([70, 84, 60, 40, 54, 47, 49, 7, 71, 39, 17, 42, 44, 14, 38, 3, 3, 92, 58, 19, 77, 11, 14, 34, 19, 22],97).
:-end_in_neg.
