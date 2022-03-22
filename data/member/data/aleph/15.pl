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
f([98, 45, 48, 37, 42, 2, 70, 65, 59, 64, 13, 22, 57, 62, 71, 63, 28, 36, 22, 56, 40, 33, 95, 51, 101, 57, 8, 64, 80, 86, 48, 6, 71, 50],22).
f([80, 75, 93, 90, 75, 79, 50, 70, 19, 60, 16, 84, 55, 76, 25, 40, 31, 62, 84],75).
f([79, 66, 61, 32, 37, 38, 52, 25, 27, 41, 100, 45, 32, 66, 52],32).
f([30, 94, 10, 97, 96, 91, 33, 38, 47, 47, 90, 23, 25, 48, 39, 75, 40, 69],48).
f([22, 24, 67, 84, 5, 76],5).
f([45, 58, 21, 35, 55, 68, 89, 42, 39, 43, 92, 60],55).
f([92, 81, 81, 30, 49, 68],68).
f([72, 101, 86, 66, 20, 8, 34, 22, 26, 94, 43, 19, 47, 40, 65, 2, 29, 20, 83],47).
f([21, 43, 67, 87],43).
f([50, 32, 42, 9, 5, 30, 27, 28, 87, 50, 36, 73, 68, 45, 99, 93, 46, 87, 51, 6, 66, 82, 95, 73, 86, 55, 80, 56, 25, 100, 98, 92, 70, 37, 83, 40, 17, 100, 75, 73, 41, 83, 21, 63, 98, 56, 24],70).
:-end_in_pos.
:-begin_in_neg.
f([65, 65, 39, 54, 71, 47],42).
f([40, 59, 37, 28, 29, 47, 71, 17, 84, 68, 37, 42, 14, 43, 98, 52, 98, 39, 72, 31, 25, 25, 74, 82, 42, 24, 34, 9, 2, 95, 52, 75, 19, 66],16).
f([93, 67, 17, 78, 90, 88, 58, 72, 52, 60, 65],1).
f([28, 51],83).
f([22, 86, 3, 66, 89, 67, 49, 70, 63, 25, 27, 76, 24, 27, 77, 26, 72, 73, 33, 9, 65, 22, 66, 38, 31, 42, 68, 14, 14, 44, 4, 23, 3, 17, 25, 65],21).
f([37, 71, 19, 46, 1, 14, 31, 66, 68, 28, 40, 63, 56, 1, 28, 12, 89, 64, 97, 62, 45, 70, 17, 20, 3, 66, 94, 5, 8, 43, 63, 61, 24, 29, 93, 80, 81, 94, 98, 69, 67, 91, 64, 56, 44, 9],34).
f([9, 8, 11, 92, 20, 72, 31, 64, 58, 43, 65, 10, 37, 1, 15, 22, 60, 14, 20],27).
f([100, 20, 55, 58, 82, 2, 4, 73, 36, 18, 12, 39, 91, 51],34).
f([83, 36, 23, 69, 17, 84, 56, 86, 17, 91, 14, 22, 73, 55, 98, 49, 14, 74, 10, 70, 99, 49, 60, 28, 29],68).
f([67, 97, 79, 65, 71, 41, 11],56).
:-end_in_neg.
