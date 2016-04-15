% Bratko Figure 11.7. A depth-first search program that avoids cycling.

% solve(Node, Solution)
% Solution is an acyclic path (in reverse order) between Node and a goal state

solve(Node, Solution)  :-
	depthfirst([], Node, Solution).

% depthfirst(Path, Node, Solution)
% Either first node of path is a goal state or extend the path [Node|Path] recursively
% Use Prolog backtracking to explore all successors of Node in the order returned by s

depthfirst(Path, Node, [Node|Path] )  :-
	goal(Node).

depthfirst(Path, Node, Sol)  :-
	s(Node, Node1, _),			% Ignore cost
	not(member(Node1, Path)),		% Prevent a cycle
	depthfirst([Node|Path], Node1, Sol).
