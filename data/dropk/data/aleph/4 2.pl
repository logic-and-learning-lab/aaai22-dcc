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
f([100, 6, 43, 68, 3, 37, 41, 32, 21, 87, 43, 100, 98, 43],14,[]).
f([33, 67, 27, 65, 29, 45, 26, 91, 8, 56, 87, 101, 84, 34, 88, 9],12,[84, 34, 88, 9]).
f([30, 73, 45, 32, 65, 25, 60, 45, 41, 45, 69, 20, 25, 92, 41, 77, 101, 24, 47, 14, 1],18,[47, 14, 1]).
f([97, 21, 68, 14, 99, 94, 53, 27, 73, 46, 23, 11, 78, 75, 43, 3, 53, 97, 94, 18, 82, 14],8,[73, 46, 23, 11, 78, 75, 43, 3, 53, 97, 94, 18, 82, 14]).
f([62, 3, 7, 55, 46, 57, 96, 38, 92, 50, 24, 88, 49, 52],6,[96, 38, 92, 50, 24, 88, 49, 52]).
f([77, 47, 92, 55],3,[55]).
f([2, 83, 16, 29, 27, 26, 75, 27, 97, 22, 32, 63, 87, 45, 73, 5, 15, 72, 14, 49, 101, 66, 45, 82, 82, 31, 23, 59, 56, 27, 12, 85],32,[]).
f([71, 82, 31, 43, 89, 77, 47, 100, 98, 12, 21, 36, 52, 4, 60, 88, 89, 62, 83, 33, 30, 72, 96, 4, 39, 51, 76, 12, 26, 45, 52, 45, 4, 85, 50, 59, 37, 7, 72, 37],34,[50, 59, 37, 7, 72, 37]).
f([94, 78, 78, 38, 39, 42, 22, 89, 67, 83, 87, 11, 16, 101, 94, 26, 20],3,[38, 39, 42, 22, 89, 67, 83, 87, 11, 16, 101, 94, 26, 20]).
f([32, 40, 61, 27, 65, 84, 66, 25, 57, 31, 94, 89],2,[61, 27, 65, 84, 66, 25, 57, 31, 94, 89]).
:-end_in_pos.
:-begin_in_neg.
f([88, 31, 97],3,[88, 31, 97]).
f([73, 89, 78, 59, 46, 75, 65, 93, 21, 47, 1, 74, 39, 27, 89, 68, 42, 36, 94, 47, 4, 25, 37, 44, 37, 70, 71, 70, 72, 37, 34, 88, 93, 101, 7, 13, 33, 44, 12, 11, 57, 29, 75, 91],27,[73, 89, 78, 59, 46, 75, 65, 93, 21, 47, 1, 74, 39, 27, 89, 68, 42, 36, 94, 47, 4, 25, 37, 44, 37, 70, 71, 70, 72, 37, 34, 88, 93, 101, 7, 13, 33, 44, 12, 11, 57, 29, 75, 91]).
f([56, 3, 96, 47, 61, 27, 45],2,[27, 45]).
f([87, 28, 39, 99, 18],2,[87, 28, 39, 99, 18]).
f([97, 94, 41, 87, 15, 20, 25, 98, 26, 42, 1, 2, 14, 59, 93, 29, 82, 35, 71, 75, 55, 41, 75, 95, 32, 68, 83, 38, 51, 75, 84, 74, 16, 65, 62, 28, 63, 76, 5, 24, 97, 40, 41, 87, 21],10,[98, 26, 42, 1, 2, 14, 59, 93, 29, 82, 35, 71, 75, 55, 41, 75, 95, 32, 68, 83, 38, 51, 75, 84, 74, 16, 65, 62, 28, 63, 76, 5, 24, 97, 40, 41, 87, 21]).
f([100, 31, 54, 47, 16, 7, 8, 9, 5, 88, 47, 60, 89, 42, 10, 52, 79, 39, 87, 90, 4, 71, 66, 42, 95, 12, 6, 54, 101, 59, 86],20,[5, 88, 47, 60, 89, 42, 10, 52, 79, 39, 87, 90, 4, 71, 66, 42, 95, 12, 6, 54, 101, 59, 86]).
f([42, 38, 96, 61, 23, 34, 23, 94, 90, 83, 15, 62, 75, 62, 15, 51, 40, 35, 16, 91, 50, 32, 57, 74, 17, 7, 33, 1, 67, 65, 72, 83, 16, 7, 53, 25, 3],8,[72, 83, 16, 7, 53, 25, 3]).
f([79, 3, 65, 94, 91, 7, 43, 75, 90, 40, 68, 67, 56, 27, 74, 43, 45, 76, 6, 35, 31, 20, 54, 92, 75, 94, 94, 29, 3, 74],20,[91, 7, 43, 75, 90, 40, 68, 67, 56, 27, 74, 43, 45, 76, 6, 35, 31, 20, 54, 92, 75, 94, 94, 29, 3, 74]).
f([8, 75, 23, 38, 100, 79, 22, 3, 73, 7, 2, 72, 51, 42, 50, 22, 73, 84],10,[73, 7, 2, 72, 51, 42, 50, 22, 73, 84]).
f([37, 64, 5, 15, 101, 38, 25, 1, 75, 33, 95, 24, 38, 19, 31, 2, 99, 22, 82, 17, 86, 48, 23, 55, 7, 30, 45],7,[33, 95, 24, 38, 19, 31, 2, 99, 22, 82, 17, 86, 48, 23, 55, 7, 30, 45]).
:-end_in_neg.
