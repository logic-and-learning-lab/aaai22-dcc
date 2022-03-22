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
f([64, 25, 30, 78, 18, 97, 89, 77, 85, 55, 30, 48, 46, 85, 68, 64, 58, 71, 49, 20, 32, 53, 19, 13, 84, 17, 25],17).
f([56, 75, 61, 98, 83, 32, 80, 71, 14],83).
f([28, 38, 60, 79, 86, 100, 95, 49, 38, 93, 68, 18, 50, 11, 49, 85, 10, 85, 15, 29, 81, 1, 91, 13, 10, 32, 53, 14, 37, 78, 68, 66, 44, 23, 52, 2],15).
f([81, 47, 61, 53, 100, 84, 79, 87, 50, 99, 72, 3, 45, 90, 48, 1, 30, 95, 28, 97, 17, 1, 62, 23, 67, 87, 100, 90, 82, 100, 66, 25, 96, 79, 33, 32, 98, 67, 40, 99, 43, 42, 35, 74, 59, 26, 65],100).
f([47, 6, 19, 80, 15, 80, 43, 25, 92, 7, 9, 11, 7, 97, 75, 71, 78, 57, 35, 51, 33, 10, 48, 99, 46, 14, 6],7).
f([17, 84, 95, 51, 101, 97, 32, 7, 16, 34, 55, 70, 98, 18, 87, 20, 98, 52, 25, 33, 30, 53, 89, 94, 72, 89, 16, 82, 27, 67, 1, 57, 55, 73, 67],25).
f([10, 1, 38, 36, 5, 99, 17, 82, 64, 54, 85, 15, 8, 10, 25, 4, 17, 5, 93, 23, 100, 61, 24, 45, 50],10).
f([20, 42, 51, 90, 96, 77, 29, 4, 29, 98, 57, 95, 22, 97, 34, 92, 18, 26, 3, 36, 70, 92, 30, 45],45).
f([51, 60, 56, 66, 58, 49, 95, 10, 41, 95, 42, 10, 65, 6, 89, 56, 25, 96, 95, 17, 93, 7, 38, 76, 92, 94, 31, 28, 62, 48, 60, 73, 91, 16, 79, 61, 72, 60],58).
f([2, 14, 13, 98, 45, 14, 24, 42],14).
:-end_in_pos.
:-begin_in_neg.
f([17, 70, 27, 87, 26, 75, 49, 62, 85, 63, 33, 5, 100, 64, 98, 33],32).
f([6, 88, 32, 61, 44, 95, 67, 80, 32, 73, 84, 59, 71, 72, 75, 58, 77, 68, 55, 45, 52, 75, 20, 33, 31],46).
f([67, 45, 76, 4, 57, 60, 71, 44, 13, 94, 96, 32, 17, 46, 10, 45, 5, 60, 29, 24, 48, 11, 16, 100, 66, 67, 86, 30, 13, 61, 57, 21, 64, 36, 95, 78, 35, 92, 69, 2, 13, 41, 59, 68, 44, 95, 18],28).
f([17, 5, 33, 70, 73, 37, 2, 52, 19, 55, 89, 2, 72, 13, 47, 93, 100, 36, 43, 92, 90, 28, 21, 19, 15, 47, 46, 46, 41, 43, 74, 14, 10, 50, 15, 69, 33, 98, 14, 24, 91, 56, 77, 15, 36, 101, 47],12).
f([87, 30, 15, 91, 7, 62, 97, 27, 71, 19, 70, 64, 60, 4, 22, 92, 78, 73, 98, 80, 64, 64, 99, 35, 77, 96, 6, 76, 57, 36, 91, 99, 100, 97, 86],84).
f([64, 83, 23, 64, 29, 6, 86, 57, 25, 70, 31, 86, 59, 10, 25, 28, 17, 89, 26, 22, 66, 17, 33, 38, 77, 100, 91, 63, 66, 94, 84, 31, 4, 81, 98],60).
f([84, 87, 2, 27, 33, 67, 19, 92, 81, 6, 96, 19, 72, 68, 50, 32, 28, 32, 48, 43, 46, 26, 40, 45, 42, 89, 1, 20, 58, 12, 75, 79, 84, 74],17).
f([56, 33, 71, 26, 12, 64, 28, 13, 70, 17, 13, 68, 33, 30, 43, 77, 17, 24, 50, 44, 61, 23, 43, 9, 40, 33, 54, 95, 43, 38, 44, 70, 16, 29, 74, 19],6).
f([43, 54, 67, 58, 34, 5, 99, 101, 30, 79, 93, 57, 68, 101],24).
f([89, 49, 28, 57, 52, 51, 60, 10, 58],87).
:-end_in_neg.
