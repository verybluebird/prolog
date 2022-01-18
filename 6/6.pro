DOMAINS
	FILE = input
predicates
	nondeterm repfile(file)
	g(String)
	find(String,String)
	searchstr(String,String)
CLAUSES
	repfile(_).
	repfile(F) :-not(eof(F)),repfile(F).
	searchstr(X,S):-
	concat(_, X, S),!.
	searchstr(X,S):-
	concat(X, _, S),!.
	searchstr(X,S):-
	frontchar (S,C,Rest),
	searchstr(X,Rest),!.
	find(S,L):-searchstr(S,L),write(L),nl,!.
	g(S):-openread(input,"Z:\\prolog\\input.txt"),
	readdevice(input),
	repfile(input),
	readln(L),
	find(S,L),
	fail.
GOAL g("to").
