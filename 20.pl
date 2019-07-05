% Figure 9.20  Finding an acyclic path, Path, from A to Z in Graph.


% path( A, Z, Graph, Path): Path is an acyclic path from A to Z in Graph
path( A, Z, Graph, Path)  :-
  path1( A, [Z], Graph, Path).

% path1( A, Path1, G, Path) if there is an acyclic Path
% that starts from A and ends with Path1
path1( A, [A | Path1], _, [A | Path1] ).

path1( A, [Y | Path1], Graph, Path)  :-
  adjacent( X, Y, Graph),
  not( member( X, Path1)),                        % No-cycle condition
  path1( A, [X, Y | Path1], Graph, Path).

% adjacent for graphs represented by node and edge sets (represented as lists)
adjacent( X,Y,graph(_,Edges)) :-
 member( e(X,Y),Edges)
 ;
 member( e(Y,X),Edges).

% example
test(A, Z, Graph, Path) :-
 A = a, Z = d, Graph = graph( [a,b,c,d], [e(a,b),e(b,d),e(b,c),e(c,d)]),
 path( A,Z,Graph,Path).

% Hamiltonian path
hamiltonian( Graph,Path) :-
 path(_,_,Graph,Path),
 covers( Path,Graph).

covers( Path,Graph) :-
 not( (node( N,Graph), not( member(N, Path)))).

node( N,graph(Nodes,_)) :- member( N,Nodes).

% example
test2(Graph,HamiltonianPath) :-
 Graph = graph( [a,b,c,d], [e(a,b),e(b,d),e(b,c),e(c,d)]),
 hamiltonian( Graph,HamiltonianPath).