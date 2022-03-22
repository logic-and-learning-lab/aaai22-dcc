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
f([85, 67, 6, 38, 54],1,[67, 6, 38, 54]).
f([90, 48, 8, 29, 90, 64, 37, 78, 23, 48, 75, 69, 29, 45],13,[45]).
f([21, 6, 87, 20, 101, 31, 86, 31, 62, 74],8,[62, 74]).
f([10, 97, 50, 54, 63, 54, 16, 59, 61, 60, 54, 16, 74, 14, 43, 83, 93, 16, 96, 58, 35, 11, 5, 69, 11, 70, 10, 68, 58, 40, 83, 56, 92, 71, 37, 80, 90, 4, 79, 64, 4, 44, 101, 39, 24],11,[16, 74, 14, 43, 83, 93, 16, 96, 58, 35, 11, 5, 69, 11, 70, 10, 68, 58, 40, 83, 56, 92, 71, 37, 80, 90, 4, 79, 64, 4, 44, 101, 39, 24]).
f([81, 101, 75, 20, 79, 31, 33, 3, 32, 68, 92, 18],10,[92, 18]).
f([77, 68, 23],2,[23]).
f([37, 58, 95, 67, 61, 56, 29, 84, 38, 93, 32, 88, 88, 23, 62, 32, 26, 33, 30, 41, 4, 90, 56, 90, 21, 22, 98, 80],13,[23, 62, 32, 26, 33, 30, 41, 4, 90, 56, 90, 21, 22, 98, 80]).
f([79, 61, 49, 43, 64, 82, 60, 94, 71, 45, 7, 9, 9, 92, 13],13,[92, 13]).
f([81, 65, 47],3,[]).
f([31, 19, 73, 21, 46, 79, 63, 57, 15, 90, 28, 78, 13, 65, 10, 88, 39, 100, 83, 6, 90, 99, 91, 56],21,[99, 91, 56]).
:-end_in_pos.
:-begin_in_neg.
f([19, 38, 59, 99, 99, 50, 99, 50, 21, 17, 35, 74, 11, 57, 47, 25, 75, 88, 63, 82, 56, 74, 101, 71, 75, 7, 12, 94, 93, 56, 72, 57, 37, 79, 100, 9, 7, 36, 3, 48, 77, 79],33,[50, 21, 17, 35, 74, 11, 57, 47, 25, 75, 88, 63, 82, 56, 74, 101, 71, 75, 7, 12, 94, 93, 56, 72, 57, 37, 79, 100, 9, 7, 36, 3, 48, 77, 79]).
f([59, 44, 33, 82, 37, 1, 82, 9, 51, 58, 84, 18, 31, 66, 38, 91, 80, 72, 46, 43, 75, 22, 32, 74, 76, 53, 74],9,[32, 74, 76, 53, 74]).
f([17, 40, 92, 48, 21, 17, 82, 31, 39, 62, 11, 2],6,[31, 39, 62, 11, 2]).
f([14, 93, 25, 14, 28, 72, 68, 6, 52, 4, 12, 82, 84, 71, 49, 13, 59, 23, 2, 22, 75, 38, 33, 67, 5, 57, 73],0,[71, 49, 13, 59, 23, 2, 22, 75, 38, 33, 67, 5, 57, 73]).
f([56, 50, 69, 81, 89, 95, 83, 9, 27, 45, 8, 3, 9, 53],4,[45, 8, 3, 9, 53]).
f([36, 37, 64, 5, 77, 90, 60, 82, 93, 57, 3, 46, 47, 72, 35, 2, 3],8,[64, 5, 77, 90, 60, 82, 93, 57, 3, 46, 47, 72, 35, 2, 3]).
f([48, 45, 88, 58, 49, 57, 61, 33, 67, 4, 6, 45, 39, 46, 27, 88, 96, 81, 63, 25, 29, 16, 30, 32, 47, 2, 32, 20, 66, 48],10,[63, 25, 29, 16, 30, 32, 47, 2, 32, 20, 66, 48]).
f([3, 67, 42, 48, 87, 90, 54, 33, 16, 10, 41, 1, 13, 67, 59, 68, 86, 87, 93, 28, 62, 92, 44, 40, 42, 15, 65, 95, 28, 89, 76, 13, 21, 64],6,[89, 76, 13, 21, 64]).
f([82, 28, 96, 37, 14, 37, 81, 64, 49, 12, 99, 3, 47],4,[99, 3, 47]).
f([9, 5, 67, 48, 5, 97, 69, 87, 50, 10, 25, 40, 41, 75, 75, 40, 25, 60, 52, 11, 66, 6, 8, 13, 21, 35, 29, 16, 13, 15, 16, 79, 8, 44, 58, 45],4,[87, 50, 10, 25, 40, 41, 75, 75, 40, 25, 60, 52, 11, 66, 6, 8, 13, 21, 35, 29, 16, 13, 15, 16, 79, 8, 44, 58, 45]).
:-end_in_neg.
