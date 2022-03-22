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
f([48, 50],48).
f([77, 47, 45, 44, 35, 10, 30, 93, 9, 27, 45, 46, 78],30).
f([61, 10, 82, 72, 34, 41, 44, 62, 35, 15, 101, 97, 70, 100, 56, 69, 62],62).
f([11, 57, 70, 79, 1, 31, 65, 76, 65, 56, 9, 42, 17, 33, 46, 98, 58, 95],57).
f([75, 51, 63, 26, 16, 62, 42, 25, 42, 40, 42, 52, 68, 23, 34, 85, 33, 58, 83, 15, 94, 83, 40, 87, 87, 12, 15, 66, 76, 68, 41, 77, 56, 7, 48, 62, 99, 32, 76],12).
f([4, 71, 38, 44, 48, 100, 64, 13, 84, 4, 28, 97, 31, 75, 65, 38, 20, 46, 93, 55, 64, 70, 5, 3, 2, 73, 56, 31, 25, 16, 30, 54, 5, 63, 90, 79, 41, 34, 79, 4, 71, 85, 81, 36],93).
f([73, 14, 65, 15, 43, 52, 78, 87, 48, 17, 62, 10, 21, 82, 65, 31, 27, 9, 35, 36, 8, 42, 88, 81, 26],17).
f([39, 29, 83, 29, 24, 72, 79, 8, 76, 80, 27, 64, 29, 66, 18, 80, 3, 67, 60, 35, 52, 77],29).
f([99, 44, 34, 54, 26, 65, 45, 56, 23, 4, 80, 79, 58, 75, 33, 60, 68, 60, 56, 65, 24, 77, 58, 101, 40, 98, 46, 45, 92, 19],58).
f([80, 28, 85, 85, 10, 29, 96, 100, 2, 94, 51, 9, 79, 81, 64, 89, 20, 14, 33, 36, 21, 16, 11, 46, 88, 13, 46, 57, 6, 47, 100, 35, 15, 55, 56, 10, 46, 81, 30, 16, 14, 47, 97, 61, 30, 91, 51],16).
:-end_in_pos.
:-begin_in_neg.
f([50, 44, 72, 91, 61],39).
f([18, 7, 16, 15, 100, 77, 94, 37, 31, 60, 73, 43, 99, 97, 40, 50, 17, 89, 70, 57, 10, 12, 62, 52, 69],53).
f([46, 37, 47, 18, 94, 33, 19, 4, 27, 48, 94, 88, 16, 35, 74, 68, 65, 46, 58, 20, 40, 95, 23, 72, 26, 60, 3],49).
f([83, 7, 37, 100, 38, 90, 14, 40, 27, 18, 35, 97, 94, 56, 3, 40, 69, 72, 13, 25, 28, 82, 40],55).
f([46, 26],76).
f([13, 1, 33, 44, 32, 27, 32, 69, 25, 90, 5, 95, 24, 17, 1, 86, 36, 95, 56, 8, 12, 79, 86, 47, 81, 82, 55, 56, 83, 49, 60, 24, 62, 63, 6, 92, 73, 86, 13, 63, 41, 37, 97],14).
f([91, 25, 44, 101, 10, 13, 59, 49, 80, 20, 97, 48, 2, 71, 47, 46, 78, 92, 76, 47, 101, 15, 50, 85, 99, 32, 35, 82, 14, 76],19).
f([90, 3, 1, 28, 39, 43, 45, 59, 18, 25, 10, 82],4).
f([95, 84, 89, 15, 67, 53, 92, 40, 7, 47, 9, 92, 84, 68, 64, 12, 29, 84, 36, 86, 96, 97, 78, 54, 96, 25, 92, 27, 98, 69, 13, 60, 75, 58],82).
f([99, 5, 4, 22, 34, 77, 74, 93, 56, 28, 58, 2, 11, 51, 47, 38, 79, 23],43).
:-end_in_neg.
