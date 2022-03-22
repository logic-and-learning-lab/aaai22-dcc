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
f([24, 90, 40, 70, 6, 27, 70, 62, 7, 59, 37, 94, 75, 59, 2, 38, 23, 79, 72, 77, 53, 65],79).
f([37, 52, 13, 82, 5, 3, 57, 16, 82, 76, 35, 15, 38, 74, 30, 97, 71, 70, 40, 40, 91, 15, 96, 71, 32, 84, 97, 54, 16, 60, 36, 65],38).
f([9, 20, 65, 40, 94, 88, 91, 49, 6, 10, 70, 36, 65, 84, 47, 30, 101, 72, 54, 9, 60, 61, 17, 95, 35, 101, 64, 83, 24, 78, 21, 34, 35, 40, 56, 34, 45, 39, 30, 62, 11, 100, 57, 29, 25, 65, 82, 81, 48],72).
f([19, 71, 72, 57, 2, 76, 95, 77, 101, 38, 51, 24, 78, 99, 72, 89, 14, 7, 17, 101],76).
f([4, 58, 2, 53, 60, 88, 1, 48, 40, 17, 19, 75, 45, 40, 33, 71, 9, 42, 7, 19, 40, 50, 8, 38, 41, 27, 56, 67, 61, 11, 32, 50, 26, 61, 78, 87, 3, 34, 28, 52],50).
f([1, 67, 89, 61, 46, 79],89).
f([8, 76, 48, 16, 65, 30, 78, 72, 54, 20, 40, 21, 62, 39, 85, 71, 30, 73, 19, 71, 70, 29, 59, 65, 67, 77, 28, 98, 1, 45, 100, 35, 61, 54, 97, 97, 45, 66, 90],76).
f([39, 101, 97, 57, 58, 42, 10, 69, 87, 34, 96, 61, 3, 3, 5, 21, 47, 96, 16, 29, 51, 86, 41, 88, 80, 13, 14, 20, 12, 60, 67, 12, 41, 77, 7, 33, 69, 89, 36, 82, 33, 75, 69, 61, 42, 85],97).
f([67, 79, 101],79).
f([29, 47, 14, 68, 74, 54, 19, 72, 97, 64, 42, 71, 69, 81, 23, 42, 34, 57, 11, 15, 4, 7, 27, 90],11).
:-end_in_pos.
:-begin_in_neg.
f([4, 5, 25, 63, 55, 67, 83, 82, 3, 73, 47, 20, 36, 33, 7, 79, 74, 71, 21, 9, 28, 58, 65, 75, 51, 91, 6, 54, 23, 69, 97, 53, 24],1).
f([93, 79, 93, 69, 97, 5, 95, 36, 79, 42, 18, 20, 19, 30, 42, 62, 40, 3, 97, 3, 14, 31, 1, 64, 3, 11, 80, 100, 85, 63, 64, 56, 89, 73, 62, 23, 46, 82, 57, 49, 45, 65, 14, 86, 90, 7, 80, 30, 92, 63],9).
f([73, 79, 50, 97, 33, 50, 93, 1, 8, 77, 6, 44, 2, 77, 96, 90, 71, 14, 12, 88, 89, 41, 88, 60, 22, 37, 54, 78, 38, 88, 38, 84, 62, 58, 38, 8, 10, 55, 49, 23, 72, 90, 96, 3, 65, 90, 7, 31, 53, 82],29).
f([19, 76, 24, 51, 72, 51, 40, 19, 17, 52, 52, 42, 94, 76, 66, 30, 99, 10, 5, 64, 8, 74, 18, 49, 32, 32, 58, 70, 31, 87, 82, 12, 85],61).
f([59, 2, 7, 22, 7, 62, 54, 52, 71, 25, 40, 28, 49, 74, 78, 82, 54, 90, 25, 18, 87, 53, 25, 61, 85, 71, 69, 36, 6, 22, 25, 76, 10, 60],19).
f([88, 49, 77, 55, 12, 30, 48, 61, 47, 25, 65, 9, 52, 81, 97, 54, 95, 9, 30, 36, 48, 35, 19, 56, 45, 83, 100, 61, 23, 19, 87, 57, 66, 59, 73, 34, 48, 96, 33, 2, 55, 35, 32, 90],64).
f([70, 99, 58, 35, 43, 71, 24, 29, 61, 49, 38, 27, 3, 64, 21, 68, 55, 34, 40, 77, 7, 8, 14, 7, 42, 12, 46, 77, 38, 2, 8, 6, 101, 54, 87, 2, 10, 45, 77, 91, 9, 15],31).
f([82, 99, 36, 50, 42],18).
f([92, 9, 39, 78, 19, 68, 33, 65, 5, 98, 33],6).
f([19, 11, 47, 53, 78, 31, 7, 98, 17, 62, 101, 26, 25, 84, 12, 37, 18, 36, 17, 51, 13, 96, 96, 94, 26, 52, 3, 21, 77, 79],4).
:-end_in_neg.
