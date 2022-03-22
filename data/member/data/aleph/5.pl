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
f([22, 90, 68, 84, 6, 24, 14, 24, 36, 15, 7, 17, 34, 16, 60, 84, 7, 31, 21, 9, 7, 63, 46, 31, 92, 82, 75, 19, 30, 55, 17, 21, 77, 51, 86, 48],82).
f([84, 70, 99, 70, 33, 66, 90, 82, 30, 73, 60, 65, 3, 7, 20, 12, 55, 52, 32, 101, 42, 21, 24, 11, 63, 33, 37, 9, 51, 91, 14, 18, 92, 94, 12, 70, 98, 24, 32, 101, 48, 84, 78, 91, 17, 71, 94],21).
f([32, 76, 90, 31, 34, 12, 38, 81, 93, 92, 68, 87, 8, 16, 26, 27, 36, 59, 16, 49, 98, 41, 33, 88, 67, 54, 66, 101, 101, 48, 52, 14, 7, 18, 29, 41, 60, 57, 79],7).
f([94, 68, 87, 13, 69, 44, 36, 75, 21, 1, 2, 66, 6, 84, 20, 74, 39, 72, 5, 99, 37, 77, 60, 11, 5, 91, 96, 15, 26, 37, 16, 40, 54, 27, 67, 8, 2, 98, 100, 86, 98],96).
f([98, 93, 3, 99, 18, 52, 34, 28, 4, 57, 9, 75, 27, 88, 82, 67, 45, 100, 14, 17, 9, 31, 46, 26, 92, 64, 37, 70, 36, 6, 76, 85, 51, 80],34).
f([12, 100, 82, 58, 36, 89, 95, 73, 51, 100, 46],100).
f([9, 81, 79, 88, 80, 17, 100, 64, 91, 36, 11, 95, 42, 5, 7, 98, 73, 31, 55, 83, 25, 42, 85, 96, 83, 15, 36, 28, 59, 48, 23, 87],17).
f([33, 6, 83, 83, 74, 16, 73, 64, 53, 15, 60, 42, 87, 101, 12, 30, 31, 61, 54, 72, 81, 75, 78, 57, 11, 47, 88, 64, 40, 35, 17, 3, 64, 79, 87, 17, 33, 97, 61, 13, 22, 86, 13, 15, 95],74).
f([10, 17, 91, 49, 58, 78, 54, 30, 88, 75, 15, 51, 85, 94],15).
f([99, 47, 83, 19, 17, 74, 37, 25, 36, 19, 69, 27, 10, 79, 32, 37, 50, 73, 75, 70, 67, 86, 29, 37, 75, 18, 87, 21, 36, 89, 55, 24, 26, 8, 77, 83, 30, 43, 83, 7, 18, 21, 23, 25, 25, 28, 1],99).
:-end_in_pos.
:-begin_in_neg.
f([5, 58, 65, 75, 59, 45, 9, 13, 66, 27, 18],64).
f([96, 52, 62, 3, 3, 99, 59, 28, 67, 83, 12, 48, 50, 46, 40, 80, 28, 69, 57, 101, 21, 89, 12, 93, 33, 44, 56, 84, 84, 38, 26, 96, 14, 13, 91, 24, 69, 44, 24],47).
f([101, 61, 76, 86, 16, 79, 72, 21, 68, 15, 57, 62, 61, 71, 88, 2, 42, 34, 92, 71, 29, 90, 86, 3, 23, 38, 45, 53, 23, 95, 28, 29, 13, 87],5).
f([41, 81, 101, 7, 69, 14, 92, 83, 66, 89, 80, 87, 35, 26],56).
f([41, 34, 79, 12, 27, 101, 12, 84, 45, 12, 18, 93, 20, 92, 100, 24, 11, 75, 29, 66, 98, 95, 18, 71, 17, 56, 41, 6, 76, 81, 11, 30, 54, 80, 28, 80, 100, 81, 69, 30, 77, 37, 6, 66, 82, 84, 36, 12, 45, 34],70).
f([44, 50, 97, 14, 13, 21, 99, 69, 53, 34, 45, 89, 99, 12, 10, 23, 77, 74, 76, 66, 85, 28, 3, 86, 74, 39, 46, 76, 36, 23, 83, 83, 20, 25, 40, 90, 24, 38, 82],56).
f([101, 19, 46, 34, 20, 59, 71, 33, 79, 73, 96, 1, 92, 66, 37, 77, 20, 7, 88, 2, 65, 98, 71, 71],69).
f([9, 25, 36, 83, 38, 15, 6, 18, 87, 96, 9, 13, 47, 88, 33, 78, 97, 40, 60, 25, 1, 17, 6, 61, 82, 29, 9, 1],46).
f([94, 99, 22, 22, 66, 31, 55, 59, 69, 13, 24, 15, 73, 2, 60, 6, 82, 60, 9, 87, 17, 49, 48, 45, 37, 35, 93, 83, 24, 15, 12, 97, 55, 5, 94, 43, 72, 96, 4, 64, 45, 13, 33, 38, 6, 61, 89, 36],84).
f([25, 43, 64, 39, 32, 37, 97, 30, 56, 17, 38, 22, 47, 68, 54, 37, 40, 60, 28, 42, 73, 10, 52, 11],31).
:-end_in_neg.
