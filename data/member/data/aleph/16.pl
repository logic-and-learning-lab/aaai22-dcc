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
f([33, 57, 45, 37, 74, 87, 68, 75, 40, 89, 72, 96, 43, 41, 4, 55, 53, 16, 10, 7, 10, 74, 90, 40, 54, 101, 17, 88, 99, 47, 3, 45, 5, 21, 16, 3, 35],90).
f([51, 63, 35, 28, 59, 47, 61, 6, 24, 40, 46, 29, 10, 55, 96, 96, 6, 17],24).
f([90, 85, 63, 33, 21, 18, 3, 12, 28, 25, 40, 47, 16, 46, 54, 62, 22, 39, 77],63).
f([70, 82, 55, 13, 94, 14, 82, 20, 79, 47, 86, 97, 79, 72, 58, 43, 17],97).
f([35, 73, 39, 89, 17, 37, 87, 99, 1, 63, 28, 9, 1, 17, 39, 76, 97, 18, 62, 77, 6, 25, 63, 10, 20, 69, 33, 46, 70, 25, 35, 18, 44, 74, 4, 68, 76, 39, 42, 86, 85],68).
f([7, 94, 43, 42, 80],80).
f([101, 24, 56, 32, 53, 18, 24, 40, 2, 7, 50, 37],32).
f([79, 71, 99, 96, 94, 41, 88, 63, 62, 35, 98, 19, 36, 34],36).
f([43, 76, 42, 86, 90, 43, 34, 16, 27, 37, 61, 31, 19, 99, 96, 2, 18, 35, 52, 54, 58, 89, 75],89).
f([46, 34, 32, 54, 74, 86, 68, 64, 20, 19, 46, 58, 29, 87, 37, 54, 94, 89, 17, 42, 52, 58],19).
:-end_in_pos.
:-begin_in_neg.
f([24, 44, 85, 55, 94, 71, 20, 51, 40, 2, 10, 77, 23, 28, 75, 77, 25, 64, 74, 88, 32, 74, 64, 55, 3, 53, 73, 70, 92, 33, 57, 70, 68, 88, 81, 38, 91, 27, 20, 33, 27],45).
f([63, 27, 10, 92, 14, 79, 59, 8, 36, 16, 50, 4, 77, 90, 89, 81, 41, 25, 44, 8, 15, 22, 15, 72, 80, 79, 37, 51, 9],97).
f([2, 48, 2, 58, 88, 66, 73, 93, 67, 3, 65, 26, 38, 79],49).
f([53, 44, 22, 7, 80, 95, 6, 96, 22, 28, 99, 8, 14, 20, 93, 15, 51, 66, 32, 96, 11, 97, 10, 54],19).
f([20, 88, 87, 34, 92, 22, 21, 88, 41, 32, 36, 41, 36, 45, 79, 9, 8, 35, 84, 41],10).
f([57, 57, 67, 96, 17, 89, 98, 19, 15, 19, 58, 36, 31, 22, 2, 20, 93, 100, 96, 28, 82, 31, 7, 2, 78, 55, 74, 81, 65, 13, 83, 95, 36, 79, 59, 88, 8, 22, 15, 66, 70, 30, 7, 72],84).
f([65, 72, 21, 42, 38, 13, 32, 66, 96],57).
f([3, 59, 95, 10, 52, 19, 25, 82, 30, 77, 71, 71, 74, 56, 82, 56, 57, 73, 71, 85, 78, 50, 46, 76, 53, 39, 17, 15, 2, 65, 19, 33, 70, 51, 97, 4, 63, 15, 65, 86, 85, 22, 62, 58],13).
f([5, 41, 15, 44, 6, 37, 70, 36, 20, 63, 58, 78, 16, 86, 25, 23, 60, 55, 60, 28, 87, 51, 65, 99, 101, 38, 86, 68, 26, 83, 12, 68, 49, 6, 1, 24, 24, 19, 22, 49, 15, 99, 27, 55, 60, 94, 77],54).
f([88, 55, 39, 36, 15, 42, 17, 40, 7, 77, 27, 79, 12, 52, 18, 44, 28, 96, 37, 4, 12, 46, 7, 43],93).
:-end_in_neg.
