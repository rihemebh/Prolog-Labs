%EX 3
flatten1([],[]).
flatten1([X|L],S):- is_list(X),!,append(X,L,L1), flatten1(L1,S).
flatten1([X|L],S):-  flatten1(L,S1), S = [X|S1].

traverser(nil,[]).
traverser(leaf(X),[X]):-!.
traverser(tree(R,D,G),[R|L]) :- traverser(D,L1), traverser(G,L2), append(L1,L2,L),!.
