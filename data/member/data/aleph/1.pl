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
f([3, 27, 93, 56, 98, 95, 57, 59, 71, 40, 14, 69, 100, 97, 83, 95, 42, 91, 79, 7, 61, 90, 89, 37, 92, 27, 9],57).
f([41, 60, 13, 101, 13, 24, 6, 63, 9, 84, 16, 51, 89, 73, 2, 28, 85, 13, 58],89).
f([22, 20],22).
f([10, 65, 67, 36, 18, 75, 35, 78, 80, 24, 29, 99, 18, 38, 74, 72, 86, 77, 42, 65, 99, 32, 88, 75, 83, 28],74).
f([41, 30, 53, 10, 69, 66, 83],41).
f([53, 75, 75, 74, 7, 7, 3, 34, 18, 91],3).
f([41, 17, 44, 56, 2, 90, 8, 71, 43, 30, 36, 87, 66],36).
f([30, 84, 44, 99, 37, 15, 27, 43, 54, 95, 62, 8, 34, 43, 68, 40, 54, 92, 8, 53, 28, 93, 46, 71, 81, 98, 43, 49, 78, 19, 15, 51, 49],98).
f([40, 63, 29, 18, 52, 21, 18, 42, 44, 100, 55, 6, 45, 2, 10, 34, 93, 44, 31, 87],34).
f([65, 24, 63, 67, 35, 54, 12, 86, 68, 56, 64, 88, 37, 2, 56, 47, 3, 25, 58, 74, 91, 11, 87, 71, 68],35).
:-end_in_pos.
:-begin_in_neg.
f([80, 16, 56, 90, 64, 76, 10, 77, 22, 76, 92, 36, 87, 5, 22, 26, 70],63).
f([84, 59, 101, 19],89).
f([50, 38, 45, 25, 13, 14, 81, 67, 32, 90, 99, 8, 70, 41, 23, 58, 25, 27, 32, 90, 21, 98, 39, 99, 15, 20, 76, 3, 86, 7],55).
f([64, 30, 58, 76, 79, 82, 39, 85, 11, 66, 68, 86, 68, 60],5).
f([72, 35, 59, 12, 63, 39, 22, 58, 72, 34, 61, 18, 63, 91, 59, 46, 15, 70, 30, 88, 48, 62, 79, 84, 19, 62, 34, 68, 63, 39, 19, 90, 16, 36, 78, 91, 12, 22, 9, 55, 58, 23, 44, 34],60).
f([33, 54, 80, 76, 32, 100, 96, 77, 12, 7, 86, 42, 8, 85, 51, 60, 26, 94, 64, 1, 43, 80, 12, 99, 38, 99, 59, 29, 26, 76, 92, 50, 10, 29, 65, 55, 67, 26, 52, 12, 75, 25, 5, 24, 79, 57, 95, 5, 39, 19],3).
f([101, 53, 96, 77, 77, 64, 70, 68, 66, 67, 50, 86, 73, 62, 6, 74, 16, 10, 74, 58, 1, 94, 83, 16, 32, 82, 17, 63, 29, 4, 21, 5, 64, 47, 46, 89, 43, 45],49).
f([7, 101, 62, 61, 39, 1, 55, 55, 92, 101, 11, 61, 3],79).
f([64, 87, 31, 31, 48, 51, 32, 38, 48],92).
f([99, 96, 89, 89, 81, 76, 98, 96, 20, 91, 41, 11, 37, 93, 77, 7, 56, 21, 75, 30, 74, 33, 76, 83, 27, 40, 3, 28, 101, 58, 17, 33, 93, 15, 70, 33, 67, 62, 44, 30, 82, 91, 30, 85, 41, 29, 34, 83, 100, 56],25).
:-end_in_neg.
