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
f([80, 65, 19, 94, 97, 83, 31, 33, 97, 54, 18],10,[18]).
f([84, 74, 43, 41, 28, 26, 37, 100, 12, 12, 78, 15, 28, 20, 57, 72, 87, 50, 74, 14, 56, 43, 62, 12, 82, 99, 78, 2, 93, 51, 7, 87, 38, 76, 80, 21, 13, 1, 34, 22, 80, 56, 98, 98, 8, 67, 45, 5, 9, 68, 14],48,[9, 68, 14]).
f([39, 13, 16, 91, 37, 78, 33, 6, 69, 52, 42, 19, 63, 46, 4, 76, 7, 34, 6, 45, 18, 90, 100, 91, 42, 36, 37, 79, 22, 79, 99, 36, 89, 27, 62, 81, 77, 8, 101, 59, 61, 44, 89, 34, 100, 84, 60, 22, 1],11,[19, 63, 46, 4, 76, 7, 34, 6, 45, 18, 90, 100, 91, 42, 36, 37, 79, 22, 79, 99, 36, 89, 27, 62, 81, 77, 8, 101, 59, 61, 44, 89, 34, 100, 84, 60, 22, 1]).
f([90, 95, 80, 81, 59, 90, 53, 61, 12, 36, 6, 18, 66, 22, 84, 34, 75, 93, 88, 19, 1, 71, 94, 51, 86],17,[93, 88, 19, 1, 71, 94, 51, 86]).
f([47, 32, 83, 90, 96, 59, 37, 66, 59, 37, 58, 70, 28, 11, 49, 90, 85, 39, 47, 53, 9],19,[53, 9]).
f([25, 31, 84, 40, 88, 26, 96, 10, 72, 31, 18, 36, 55, 92, 75, 77, 23, 100, 7, 2, 43, 95, 28, 46, 95, 26, 36, 13, 72, 47, 46, 85, 44],12,[55, 92, 75, 77, 23, 100, 7, 2, 43, 95, 28, 46, 95, 26, 36, 13, 72, 47, 46, 85, 44]).
f([81, 39, 93, 92, 56, 98, 75, 37, 43, 96, 17, 61, 2, 19, 37, 36, 65, 73],17,[73]).
f([84, 38, 3],3,[]).
f([76, 16, 82, 2, 2, 90, 101, 53, 69, 13, 67],8,[69, 13, 67]).
f([50, 21, 100, 3, 21, 101, 48, 37],3,[3, 21, 101, 48, 37]).
:-end_in_pos.
:-begin_in_neg.
f([82, 45, 39, 54, 46, 98, 91, 13, 34, 41, 48, 100, 52, 22, 46, 97, 25, 85, 18, 92, 88, 78, 71, 82, 58, 94, 77, 75, 16, 66, 68, 57, 85, 83, 37, 24],28,[92, 88, 78, 71, 82, 58, 94, 77, 75, 16, 66, 68, 57, 85, 83, 37, 24]).
f([69, 36, 63, 37, 8, 47, 8, 60, 20, 26, 69, 97, 94],8,[94]).
f([85, 4, 3, 24, 91, 5, 66, 51, 98, 36, 69, 90, 68, 54, 57, 34, 18, 1, 60, 98, 101, 19, 1, 20, 92, 14, 89, 1, 6, 77, 42],5,[4, 3, 24, 91, 5, 66, 51, 98, 36, 69, 90, 68, 54, 57, 34, 18, 1, 60, 98, 101, 19, 1, 20, 92, 14, 89, 1, 6, 77, 42]).
f([95, 98, 66, 47, 99, 18, 89, 37, 78, 48, 78, 86, 93, 41, 41, 5, 35, 32, 52, 62],8,[86, 93, 41, 41, 5, 35, 32, 52, 62]).
f([46, 91, 80, 96],0,[96]).
f([67, 95, 56, 8, 16, 50, 6, 77, 62, 68, 28, 41, 26, 31, 101, 89, 76, 90, 64, 25, 84, 88, 33, 12, 66],5,[66]).
f([32, 69, 17, 60, 12, 84, 7, 44, 9, 3, 57, 9, 54, 49, 68, 92, 62, 63, 27, 6, 5, 9, 75, 32, 88, 99, 81, 46, 1, 87, 27, 43, 28, 10, 27, 76],35,[57, 9, 54, 49, 68, 92, 62, 63, 27, 6, 5, 9, 75, 32, 88, 99, 81, 46, 1, 87, 27, 43, 28, 10, 27, 76]).
f([96, 29, 13, 29, 21, 92, 48, 13, 72, 55, 27, 43, 86, 47, 86, 63],13,[29, 13, 29, 21, 92, 48, 13, 72, 55, 27, 43, 86, 47, 86, 63]).
f([80, 40, 26, 98, 82, 54, 29, 14, 83, 1, 13, 97],2,[13, 97]).
f([1, 8, 50, 20, 47, 92, 68, 52, 99, 67, 54, 39, 92, 20, 36, 101, 98, 50, 100, 66],7,[92, 68, 52, 99, 67, 54, 39, 92, 20, 36, 101, 98, 50, 100, 66]).
:-end_in_neg.
