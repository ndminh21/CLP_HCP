%File: Paul_Prae.Hamiltonian_Cylce.pl
%Author: Paul Prae
%Last Edited: October 18th, 2011
%Purpose: To find a Hamiltonian Cycle given the graph presented in class.
%For: Dr. Potter and CSCI 4540 Fall 2011

%Representation of the graph.
%next_node(+Current Node, -A Next Node that is connected to Current Node).

next_node(1,2).
next_node(2,1).
next_node(1,3).
next_node(3,1).
next_node(1,4).
next_node(4,1).
next_node(2,3).
next_node(3,2).
next_node(2,4).
next_node(4,2).
next_node(3,5).
next_node(5,3).
next_node(4,6).
next_node(6,4).
next_node(5,6).
next_node(6,5).
next_node(5,7).
next_node(7,5).
next_node(6,8).
next_node(8,6).
next_node(7,8).
next_node(8,7).
next_node(7,9).
next_node(9,7).
next_node(8,10).
next_node(10,8).
next_node(9,10).
next_node(10,9).
next_node(9,11).
next_node(11,9).
next_node(10,12).
next_node(12,10).
next_node(11,12).
next_node(12,11).
next_node(11,13).
next_node(13,11).
next_node(12,14).
next_node(14,12).
next_node(13,14).
next_node(14,13).
next_node(13,15).
next_node(15,13).
next_node(14,16).
next_node(16,14).
next_node(15,17).
next_node(17,15).
next_node(15,18).
next_node(18,15).
next_node(16,17).
next_node(17,16).
next_node(16,18).
next_node(18,16).
next_node(17,18).
next_node(18,17).



%Go! Prints out a solution. Will print out more if you fail the first one.
go :-

	write('Welcome to Paul Prae''s Hamiltonian Cycle finder!'),

	nl,

	write('I labeled the nodes as unique integers from 1 to 11.'),

	nl,

	write('You will have to check the KB to understand their relationships.'),

	nl,

	write('Prolog is about to begin finding the first solution.'),

	nl,

	write('If you want more, simply ask for another solution as normal!'),

	nl,

	write('(i.e. enter in a '';'' to force a fail on the last given solution)'),

	nl,

	nl,

	write('To begin, what node would you like to start on?'),

	nl,

	write('Please enter an integer from [1,11] followed by a period.'),

	nl,

	write('(e.g. "1." which would be the center node in the diagram)'),

	nl,

	read(StartNode),

	ham_it_up(1000, StartNode, [StartNode], [HeadResult|TailResult]),


	nl,

	write('A solution is a path in the following order: '),

	nl,

	write_solution(HeadResult, [HeadResult|TailResult]).


go :-

	write('Prolog could not find any further solutions for that starting node.'),

	nl,

	write('End of this go.').

res(M,N) :-
    N > 0, !,
    write('----------'),nl,
    write(N), nl,
    ((ham_it_up(M, N, [N], [HeadResult|TailResult]),
    write_solution(HeadResult, [HeadResult|TailResult]), nl); true),
    N1 is N-1,
    res(M,N1).

res(_,0) :-!.


minh(M,N,[HeadResult|TailResult]) :-
    N > 0, !,
    %write('----------'),nl,
    %write(N), nl,
    ((ham_it_up(M, N, [N], [HeadResult|TailResult]),
    write_solution(HeadResult, [HeadResult|TailResult]), nl); true),
    N1 is N-1,
    minh(M,N1, [HeadResult|TailResult]).

minh(_,0,_) :-!.


hcp(N):-findall(X, minh(N,N, X), XList).

ham_it_up(1, CurrentNode, [Next|RestCurrentPath], [Next|RestCurrentPath]) :-

	next_node(CurrentNode, Next).


ham_it_up(Count, CurrentNode, CurrentPath, Result) :-

	next_node(CurrentNode, NextNode),

	\+ member(NextNode, CurrentPath),

	append(CurrentPath, [NextNode], NewPath),

	DownCount is Count - 1,

	ham_it_up(DownCount, NextNode, NewPath, Result).


write_solution(Start, []) :-

	write(Start),

	write('.').

write_solution(Start, [HeadPath|TailPath]):-

	write(HeadPath),

	write(', '),

	write_solution(Start, TailPath).