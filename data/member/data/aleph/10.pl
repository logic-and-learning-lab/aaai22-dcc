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
f([43, 29, 100, 95, 64, 52, 10, 23, 98, 37, 6, 101, 8, 55, 52, 9, 45, 25, 67, 35, 31, 99, 57, 72, 18, 75, 84, 86, 52, 8],67).
f([42, 8, 85, 92, 58, 94, 96, 1],94).
f([95, 65, 56, 74, 22, 29, 94, 5, 3, 5, 77, 83, 61, 94, 80, 47, 91, 80, 98, 45, 6],80).
f([2, 40, 92, 6, 26, 38, 85, 43, 32, 3, 80, 98, 55, 26, 93, 38, 57, 27, 1, 60, 91, 40, 51, 88, 44, 52, 29, 23, 49, 52, 1, 38, 30, 84, 32, 27, 28, 35, 24, 9],27).
f([99, 63, 51, 101, 56, 38, 63, 41, 95, 3, 70, 42, 21, 86, 34],86).
f([51, 81, 20, 32, 29, 86, 97, 23, 86, 24, 34, 45, 27, 74, 88, 98, 97, 86, 35, 93, 28, 35, 42, 88, 95, 51, 86, 17, 13, 44, 33, 12, 64, 81, 27, 88, 94, 47, 51, 52, 54, 19, 27, 39, 47, 44],74).
f([33, 69, 14, 84, 9, 14, 84, 93, 1, 3],9).
f([14, 77, 87, 15, 2, 83, 10, 75, 100, 38, 91, 31, 8, 78, 62, 78, 52, 85, 8, 35, 71, 56, 65, 54, 51, 62, 81, 73, 15, 37, 85, 20, 4, 11, 17, 52, 16, 97, 66, 25, 67, 91, 18, 76, 54, 7],35).
f([51, 94, 47, 12, 30, 38, 26, 55, 4, 82, 3, 96, 38, 96, 55, 84, 88, 3, 74, 33, 8, 94, 19, 29, 38],94).
f([18, 85, 91, 64, 79, 54, 75, 80, 38, 5, 83, 5, 50, 55, 43, 15, 92, 12, 66, 41],64).
:-end_in_pos.
:-begin_in_neg.
f([68, 87, 15, 63, 93, 81, 55, 9, 26, 17, 27, 64, 22, 74, 63, 49, 77, 60, 12, 59, 23, 37, 38, 95, 9, 83, 68, 22, 99, 79, 19, 67, 100, 78, 45, 40, 16, 55, 80, 91, 68],89).
f([6, 15, 34, 52, 101, 71, 28, 18, 29, 26, 25, 59, 72, 9, 88, 68, 2, 96, 30, 50, 58, 64, 89, 101, 40, 31, 77, 41, 26],3).
f([67, 95, 25, 2, 54, 94, 56, 81, 8, 29, 26, 93, 30, 45, 37, 71, 63, 72, 59, 60, 97, 100, 60, 49, 80, 70, 94, 100, 26, 35, 29, 32, 12, 37, 21, 87, 51, 40, 18, 41, 94, 6, 80, 61, 76, 55],90).
f([100, 8, 66, 40, 80, 72, 39, 50, 26, 4, 25],41).
f([51, 92, 53, 72, 39, 87, 72, 6, 10, 68, 78, 86, 74, 64, 4, 99, 1, 34, 96, 74, 65, 28, 46, 98],84).
f([39, 90, 84, 81, 22, 13, 38, 41, 1, 75, 36, 33, 8, 3, 74, 13, 29, 80, 96, 39, 8, 40, 39, 36, 69, 40, 16, 52, 94, 45, 21, 92, 47, 12, 18, 25, 95, 40, 87, 8, 24, 5, 62, 30, 4, 92, 91, 21],53).
f([32, 31, 79, 59, 10, 100, 50, 38, 46, 32, 46, 95, 62, 47, 99, 60, 67, 74, 42, 82, 94, 42, 96, 59, 16, 35, 45, 55, 3, 33, 56, 91, 42, 31, 52, 41, 49, 72, 7, 83, 23, 45, 58, 40, 60, 66, 28, 32, 43],5).
f([5, 20, 13, 70, 39],40).
f([26, 92, 33],81).
f([34, 16, 81, 3, 61, 66, 41, 56, 59, 39, 72, 34, 35],67).
:-end_in_neg.
