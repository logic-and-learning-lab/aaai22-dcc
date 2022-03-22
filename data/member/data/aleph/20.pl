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
f([32, 64, 99, 51, 2, 73, 9, 60, 99, 34, 96, 36, 18, 10, 35, 40, 64, 1, 11, 16, 73, 94, 82, 101, 99, 39, 78, 66, 78, 70, 76, 8, 69, 63, 32, 70, 26, 54, 70, 19, 28, 61],101).
f([11, 42, 9, 21, 85, 40, 73, 71, 24, 1, 101, 89, 46, 79, 66, 92, 48, 29, 86, 4, 53, 23, 4, 99, 20, 91, 23, 62, 92, 15, 75, 44, 18, 70, 52],9).
f([99, 28, 36, 51, 87],99).
f([93, 50, 42, 69, 97, 21, 33, 2, 6, 20, 2, 18, 56, 34, 77, 44, 37, 83, 21, 81, 64, 74, 68, 78, 21, 51, 14, 2, 6, 50, 19, 93, 58, 4, 90, 30, 30, 5, 25, 17, 13, 94, 10, 54, 55, 56],74).
f([22, 23, 62, 43, 85, 18, 17, 7, 30, 1, 17, 44, 2, 50, 43, 24, 9, 15, 72, 97, 4, 27, 19, 98, 16, 49, 36, 82, 72, 101, 79, 90, 81, 90, 31, 42, 20, 5, 30, 16, 51],30).
f([33, 21, 76, 43, 32, 60, 44, 82, 88, 79, 7, 97, 56, 46, 14, 26, 72, 7, 69, 73, 36, 96, 42, 15, 3, 90, 38, 53, 91, 27, 29, 95, 23, 63],15).
f([3, 14, 47, 48, 17, 83, 76, 40, 84, 34, 98, 39, 17, 66, 4, 64, 28, 72, 39, 64, 91, 16, 87, 40, 22, 77, 46, 19, 53, 37, 75, 82, 26, 61, 28],87).
f([45, 49, 93, 6, 99, 70, 32, 97, 100, 41, 63, 77, 28, 39, 2, 81, 82, 14, 77, 26, 24, 3, 12, 18, 60, 100, 21, 5, 95, 81, 100, 66, 43],70).
f([2, 57, 7],7).
f([39, 18, 29, 54, 40, 100, 37, 86, 51, 9, 76, 4, 1, 83, 38, 41, 50, 54, 27, 32, 78, 17, 89, 43, 99, 100, 56, 75, 86, 99, 52, 99, 74, 76, 5, 73, 74, 12, 58, 30, 35, 85, 76, 57, 92, 13, 58, 64, 7],4).
:-end_in_pos.
:-begin_in_neg.
f([44, 31, 23, 37, 58, 33, 72],54).
f([98, 73, 14, 45, 98, 69, 86, 31, 7, 72, 31, 37, 53, 18, 78, 2, 56, 44, 5, 27, 65, 42, 27, 34, 85, 59, 52, 15, 37, 33, 23, 14, 91, 92, 86, 14, 52, 99, 33, 84, 33, 25, 21, 51, 51, 36, 39],77).
f([86, 75, 83, 45, 99, 14],60).
f([3, 58, 33, 60, 29, 42, 33, 7, 40, 63, 57, 21, 21, 93, 22, 19, 25, 55, 25, 87, 93],73).
f([56, 62, 101, 42, 5, 62, 18],2).
f([2, 59, 60, 77, 52, 53, 84, 22, 98, 33, 100, 89, 21, 99, 56, 72, 50, 40, 22, 36, 33, 14],25).
f([81, 72, 74, 36, 60, 28, 6, 34, 3, 42, 33, 37, 31, 7, 40, 25, 51, 2, 46, 61, 61, 47, 22, 6, 82, 88, 74, 6, 39, 52, 58, 56, 86, 43, 10, 36, 11, 79, 27, 88, 4, 90, 37],85).
f([3, 81, 61, 80, 101, 36, 47, 34, 35, 33, 74, 54, 32, 96, 11, 91, 56, 80, 8, 33, 82, 54, 24, 52, 77, 87, 76, 10, 27, 43, 77, 65, 42, 55, 30, 14, 51, 41, 41, 88, 46, 76, 89, 50, 38, 63, 84, 86, 22, 94, 38],72).
f([33],89).
f([48, 8, 49, 46, 76, 48, 91, 96, 17, 53, 79, 24, 40, 47, 81, 83, 38, 8, 9, 1, 17, 3, 101, 28, 2, 44, 64, 46, 4, 77, 62, 22, 23, 82, 10, 12, 11, 80, 25, 42, 91, 1, 49, 32, 98, 75],55).
:-end_in_neg.
