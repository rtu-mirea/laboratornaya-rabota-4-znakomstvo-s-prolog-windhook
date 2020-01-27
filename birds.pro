database - tmp
  bird_color(STRING,STRING)
  bird(STRING)
CLAUSES
  %--birds--%
  bird("Eagle").
  bird("Owl").
  bird("Parrot").
  %--colors--%
  bird_color("Eagle","brown").
  bird_color("Eagle","black").
  bird_color("Owl","grey").
  bird_color("Parrot","green").
  bird_color("Parrot","blue").
  bird_color("Parrot","yellow").
  
PREDICATES
  nondeterm have_color(STRING bird,STRING color)
  
CLAUSES
  have_color(A,B):-
	bird(A),bird_color(A,B),A<>B.
	
goal
  have_color("Parrot",Z),
  format(Msg,"have color (\"Parrot\",%)",Z),
  write(Msg).
