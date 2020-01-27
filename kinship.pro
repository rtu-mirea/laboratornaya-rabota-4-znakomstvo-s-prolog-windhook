database - tmp
  married(STRING,STRING)
  male(STRING)
  female(STRING)
  parent(STRING,STRING)
CLAUSES
  %----%
  married("John","Mary").
  married("Larry","Sue").
  %----%
  parent("Larry","John").
  parent("Sue","John").
  %----%
  parent("John","Dan").
  parent("John","Suzan").
  parent("Mary","Suzan").
  parent("Mary","Dan").
  %----%
  male("Larry").
  male("John").
  male("Dan").
  female("Sue").
  female("Mary").
  female("Suzan").
PREDICATES
  nondeterm father(STRING father,STRING child)
  nondeterm mother(STRING mother,STRING child)
  nondeterm grandfather(STRING grandfather,STRING grandchild)
  nondeterm grandmother(STRING grandmother,STRING grandchild)
  nondeterm sister(STRING,STRING)
  nondeterm brother(STRING,STRING)
CLAUSES
  father(A,B):-
	parent(A,B),male(A),A<>B.
	
  mother(A,B):-
  	parent(A,B),female(A),A<>B.
  	
  brother(A,B):-
  	parent(C,A),
  	parent(C,B),
  	male(A),A<>B.
  	
  grandfather(A,B):-
	father(A,C),
	father(C,B).
	
  sister(A,B):-
  	parent(C,A),
  	parent(C,B),
  	female(A),A<>B.
  	
  grandmother(A,B):-
	father(A,C),
	father(C,B).
	
goal
  sister("Suzan",Z),
  format(Msg,"sister (\"Suzan\",%)",Z),
  write(Msg).
  
