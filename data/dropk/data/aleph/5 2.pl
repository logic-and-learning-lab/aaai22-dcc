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
:- modeh(*,f(+list,+element,-list)).
:- modeb(*,f(+list,+element,-list)).

:- determination(f/3,head/2).
:- determination(f/3,tail/2).
:- determination(f/3,geq/2).
:- determination(f/3,empty/1).
:- determination(f/3,even/1).
:- determination(f/3,odd/1).
:- determination(f/3,one/1).
:- determination(f/3,zero/1).
:- determination(f/3,decrement/2).
:- determination(f/3,f/3).
%% :- determination(f/3,increment/2).
%% :- determination(f/3,element/2).
%% :- determination(f/3,cons/3).
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
f([9, 33, 45, 92],4,[]).
f([15, 27, 70, 46, 1, 98, 40, 81, 51, 38, 35, 12, 83, 23, 10, 58, 65, 64, 21, 35, 30, 41, 44, 67, 48, 52, 96, 93, 4, 5, 14],21,[41, 44, 67, 48, 52, 96, 93, 4, 5, 14]).
f([88, 27, 24, 94, 5, 90, 54, 85, 99],8,[99]).
f([13, 27, 84, 13, 74, 32, 36, 5, 94, 10, 47, 81, 78, 56, 7, 5, 43, 90, 96, 21, 53, 39, 54, 47, 90, 70, 88, 91, 36, 20, 45, 37, 16, 24, 76],32,[16, 24, 76]).
f([76, 16, 81, 44, 70, 85, 66, 99, 79, 74, 35, 8, 48, 6, 25, 31, 74, 63, 48, 63],11,[8, 48, 6, 25, 31, 74, 63, 48, 63]).
f([78, 31, 31, 87, 44, 6, 96, 8],3,[87, 44, 6, 96, 8]).
f([28, 58, 64, 68, 69, 80, 11, 53, 85, 49, 80, 1, 28, 10, 95, 73, 100, 80, 33, 55],8,[85, 49, 80, 1, 28, 10, 95, 73, 100, 80, 33, 55]).
f([3, 61, 10, 85, 44, 25, 50, 66, 83, 85, 32, 74, 78, 26, 88, 25],9,[85, 32, 74, 78, 26, 88, 25]).
f([88, 25, 32, 13, 35, 55, 74, 24, 64, 91, 57, 79, 48, 83, 64, 17, 76, 55, 101, 68, 62, 34, 86],4,[35, 55, 74, 24, 64, 91, 57, 79, 48, 83, 64, 17, 76, 55, 101, 68, 62, 34, 86]).
f([61, 14, 14, 87, 38, 14, 14, 23, 91, 83, 26, 17, 94, 32, 95, 21, 13, 49, 53, 76, 19, 6, 35, 75, 53, 60, 9, 68, 62, 27, 28, 23],24,[53, 60, 9, 68, 62, 27, 28, 23]).
:-end_in_pos.
:-begin_in_neg.
f([48, 5, 38, 54, 51, 7, 79, 79, 57, 38, 86, 10, 87, 4, 65, 39, 24, 20, 18, 10, 10, 45, 67, 60, 16, 21, 77, 38, 14, 66, 35, 55, 55, 97, 44, 97, 99, 96, 80, 12, 93, 9, 97, 66, 38, 87, 63],8,[44, 97, 99, 96, 80, 12, 93, 9, 97, 66, 38, 87, 63]).
f([48, 56, 94, 80, 28, 42, 8, 76, 94, 24, 72, 69, 3, 10, 5, 23, 33, 68, 101, 6, 15, 24, 53, 88, 85, 58, 53, 84, 22, 71, 8, 20, 43, 29, 100, 71, 3],34,[10, 5, 23, 33, 68, 101, 6, 15, 24, 53, 88, 85, 58, 53, 84, 22, 71, 8, 20, 43, 29, 100, 71, 3]).
f([92, 10, 60, 50, 65, 4, 19, 20, 67, 12, 71, 83, 101, 34, 101, 100, 87, 100, 85, 67, 13, 56, 17, 91, 87, 87, 51, 93, 76, 100, 29, 2, 76, 23],9,[100, 29, 2, 76, 23]).
f([24, 9, 28, 34, 84, 87, 56, 57, 49, 63, 15, 14, 29, 25, 85, 58, 24, 25, 74, 90, 80, 6, 74, 47, 48, 41, 9, 17, 95, 19, 99, 89, 44, 46, 28, 6, 25],2,[25, 85, 58, 24, 25, 74, 90, 80, 6, 74, 47, 48, 41, 9, 17, 95, 19, 99, 89, 44, 46, 28, 6, 25]).
f([17, 70, 57, 78, 71, 16, 40, 20, 72, 64, 9, 18, 13, 99, 59, 88, 38, 101, 52, 75, 24, 80, 71, 41, 21, 64, 76, 70, 61, 93, 86],22,[38, 101, 52, 75, 24, 80, 71, 41, 21, 64, 76, 70, 61, 93, 86]).
f([41, 55, 63, 84, 85, 83, 61, 50, 66, 9, 64, 71, 66, 11, 98, 89, 88, 1, 73, 30, 78, 1, 72, 30, 49, 90, 38, 54, 65, 71, 38, 25],16,[89, 88, 1, 73, 30, 78, 1, 72, 30, 49, 90, 38, 54, 65, 71, 38, 25]).
f([47, 34, 16, 101, 91, 60, 63, 34, 7, 49, 81, 18, 82, 58, 61, 85, 49, 56, 95, 68, 96, 19, 66, 80, 100, 62],20,[85, 49, 56, 95, 68, 96, 19, 66, 80, 100, 62]).
f([94, 47, 11, 70, 78, 89, 14, 52, 16, 88, 60, 75, 75, 45, 79, 101, 47, 88, 66, 60, 76, 51, 46, 36, 79, 21, 96, 37, 7, 92, 75, 18, 69, 23, 35, 48, 91, 75, 16, 53, 16, 57, 58, 31, 41, 20, 2, 91, 30, 23],38,[46, 36, 79, 21, 96, 37, 7, 92, 75, 18, 69, 23, 35, 48, 91, 75, 16, 53, 16, 57, 58, 31, 41, 20, 2, 91, 30, 23]).
f([78, 32, 64, 7, 21, 51, 45, 27, 28, 97, 36, 90, 80, 2, 98, 93, 76, 99, 35, 60, 40, 97, 27, 57, 80, 55, 75, 34, 53, 23, 24, 49, 56, 45, 51, 51, 58, 15, 40, 47],29,[57, 80, 55, 75, 34, 53, 23, 24, 49, 56, 45, 51, 51, 58, 15, 40, 47]).
f([49, 14, 91, 36, 35, 15, 19, 85, 63, 40, 69, 84],0,[91, 36, 35, 15, 19, 85, 63, 40, 69, 84]).
:-end_in_neg.
