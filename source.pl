

%Go! Prints out a solution. Will print out more if you fail the first one.
go :-

	write('Welcome to Hamiltonian Cycle finder!'),

	nl,

	write('Use syntax [data] to load test data.'),

	nl,

	write('If this input graph have N nodes.'),

	nl,

	write('Syntax to find all graph is hcp(N).'),

	nl.

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

hamilton(M,N,[HeadResult|TailResult]) :-
    N > 0, !,
    ((ham_it_up(M, N, [N], [HeadResult|TailResult]),
    write_solution(HeadResult, [HeadResult|TailResult]), nl); true),
    N1 is N-1,
    hamilton(M,N1, [HeadResult|TailResult]).

hamilton(_,0,_) :-!.

hcp(N):-findall(X, hamilton(N,N, X), XList).