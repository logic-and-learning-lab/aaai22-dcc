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
f([21, 48, 80, 55, 42, 42, 6, 16, 94, 34, 12, 34, 64, 87, 76, 12, 97, 5, 80, 65, 90, 100, 11, 35, 26, 68, 34, 89, 75, 94, 3, 59, 12, 1, 86, 10],28,[75, 94, 3, 59, 12, 1, 86, 10]).
f([87, 1, 39, 59, 71, 19, 72, 98, 40, 62, 16, 31, 47, 80, 79, 57, 84, 90, 34, 22, 68, 33, 43, 95, 94],17,[90, 34, 22, 68, 33, 43, 95, 94]).
f([78, 22, 9],3,[]).
f([52, 95, 5, 15, 57, 18, 55, 15, 11, 12, 25, 75, 71, 80, 21, 101, 94],9,[12, 25, 75, 71, 80, 21, 101, 94]).
f([98, 53, 59, 72, 82, 48, 27, 86, 29, 81, 22, 57, 4, 45, 43, 75, 97, 90, 21, 101, 30, 38, 81, 42],18,[21, 101, 30, 38, 81, 42]).
f([72, 39, 31, 6, 65, 39, 98, 81],1,[39, 31, 6, 65, 39, 98, 81]).
f([58, 98, 55, 68, 18],2,[55, 68, 18]).
f([60, 56, 46, 45, 13, 61, 51, 59, 27, 91, 24, 84, 91, 46, 32, 95, 78, 101, 6, 34, 45, 33, 57, 22, 51, 94, 82, 48, 92, 61, 61, 34, 50, 13, 67, 15, 73, 16, 5, 18, 42],28,[92, 61, 61, 34, 50, 13, 67, 15, 73, 16, 5, 18, 42]).
f([42, 17, 95, 72, 61, 44, 48, 57, 97, 62, 88, 9, 12, 8, 81, 30, 27, 6, 81, 22],6,[48, 57, 97, 62, 88, 9, 12, 8, 81, 30, 27, 6, 81, 22]).
f([64, 28, 78, 40, 49],3,[40, 49]).
:-end_in_pos.
:-begin_in_neg.
f([48, 77, 61, 13, 4, 35, 7, 63, 50, 86, 35, 68, 46, 37, 31, 60, 96, 8, 10, 60, 13, 35, 69, 4, 68, 4, 85, 55, 25, 25, 39, 95, 93, 3, 2, 55],29,[31, 60, 96, 8, 10, 60, 13, 35, 69, 4, 68, 4, 85, 55, 25, 25, 39, 95, 93, 3, 2, 55]).
f([46, 47, 80, 80, 67, 31, 67, 44, 91, 21, 58, 48, 60, 54, 3, 4, 95, 94, 85, 22, 39, 68, 90, 13, 15],19,[47, 80, 80, 67, 31, 67, 44, 91, 21, 58, 48, 60, 54, 3, 4, 95, 94, 85, 22, 39, 68, 90, 13, 15]).
f([62, 96, 83, 95, 41, 14, 56, 52, 65, 57, 27, 28, 38, 29, 84, 23, 91, 14, 83, 52, 28, 55, 84, 25, 54, 35, 66, 26, 27, 97, 96, 86],22,[83, 95, 41, 14, 56, 52, 65, 57, 27, 28, 38, 29, 84, 23, 91, 14, 83, 52, 28, 55, 84, 25, 54, 35, 66, 26, 27, 97, 96, 86]).
f([28, 77, 60, 96, 19, 29, 3, 33, 7, 57, 47, 23, 5, 41, 2, 95, 4, 90, 61, 63, 68, 7, 94, 97, 43],20,[33, 7, 57, 47, 23, 5, 41, 2, 95, 4, 90, 61, 63, 68, 7, 94, 97, 43]).
f([14, 52, 81, 12, 55, 22, 50, 66, 68, 39, 33, 22, 26, 9, 59, 52, 68, 18, 78, 41, 41, 78, 27, 20, 25],10,[41, 41, 78, 27, 20, 25]).
f([54, 85, 82, 75, 8, 28, 54, 49, 100, 87, 29, 42, 65, 51, 75, 8, 90, 12, 77, 79, 58, 93, 48, 87, 15, 98, 75, 89, 18, 59, 87, 4, 2, 81, 26, 87, 6, 82, 76, 15, 71, 35, 69, 49, 22, 92, 49],10,[77, 79, 58, 93, 48, 87, 15, 98, 75, 89, 18, 59, 87, 4, 2, 81, 26, 87, 6, 82, 76, 15, 71, 35, 69, 49, 22, 92, 49]).
f([52, 67, 76, 8],3,[52, 67, 76, 8]).
f([35, 81, 93, 89, 4, 44, 45, 92],7,[4, 44, 45, 92]).
f([18, 88, 65, 52, 41, 25, 41, 101, 69, 99, 9, 35, 57, 2, 95, 55, 74, 24, 99, 38, 29, 62, 58, 55, 43, 98],10,[65, 52, 41, 25, 41, 101, 69, 99, 9, 35, 57, 2, 95, 55, 74, 24, 99, 38, 29, 62, 58, 55, 43, 98]).
f([82, 42, 90, 101, 46, 39, 52, 17, 91, 42, 40, 74, 32, 17, 34, 32, 37, 39, 3, 55, 17, 96, 32, 52],18,[90, 101, 46, 39, 52, 17, 91, 42, 40, 74, 32, 17, 34, 32, 37, 39, 3, 55, 17, 96, 32, 52]).
:-end_in_neg.
