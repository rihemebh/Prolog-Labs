%% testing course examples

concat1([],L2,L2).
concat1([X|L],L2,L3):- concat1(L,L2,L4), L3=[X|L4].


rev([],[]).

rev([X|Xs],Y) :- rev(Xs,Y1),concat1(Y1,[X],Y).

f(X,0):- X<3,!.
f(X,2):- X<6,!.
f(_,4).

different(X,Y):- X=Y,!,fail.
different(_,_).

% TD2
% Fibonacci

fibo(0,1):- !.
fibo(1,1):- !.
fibo(N,S):- N>1,N1 is N-1, N2 is N-2, fibo(N1,S1),fibo(N2,S2),S is S1+S2.

% Factorielle
fact(0,1):- !.
fact(1,1):-!.
fact(N,S) :- N1 is N-1, fact(N1,S1), S is N*S1.

%Somme des N entiers
somme(0,0):-!.
somme(N,S) :-N>0,read(X), N1 is N-1, somme(N1,S1), S is X + S1.

%Max de N entiers

nmax(1,S):- read(S), !.
nmax(N,S):-  N>1 , read(X),N1 is N-1 , nmax(N1,S1),S is max(S1,X).

% Pair
pair(0):- !.
pair(X):- X>0,X1 is X-2, pair(X1) .


element_pair([],[]):-!.
element_pair([X|L],S):- pair(X), element_pair(L,S1), S=[X|S1].
element_pair([X|L],S):-  X1 is X-1 , pair(X1), element_pair(L,S).


% Somme d'une liste
sommeList([],0):-!.
sommeList([X|L],S) :-  sommeList(L,S1) , S is S1+X.
% Longeur d'une liste
longeur([],0):-!.
longeur([_|L],S) :- longeur(L,S1), S is S1+1.

% Maximum d'une liste
maxList([],0):- !.
maxList([X|L],S) :- maxList(L,S1) ,S is max(S1,X).
%2eme methode
maxList1([],0) :- !.
maxList1([X|L],X):- maxList1(L,S1), X>S1.
maxList1([X|L],S1):- maxList1(L,S1), X < S1.
% moyennne
moyenne([],0).
moyenne(L,S):- sommeList(L,X1) , longeur(L,X2) , S is X1/X2.


%intersection

inter([],_,[]).
inter(_,[],[]).
inter(L1,L1,L1).
inter([X|L1],L2,L):- member(X,L1),!,inter(L1,L2,L).
inter([X|L1],L2,[X|L]):- member(X,L2),!,inter(L1,L2,L).
inter([_|L1],L2,L):- inter(L1,L2,L) .
%debut liste
get_next([], []).

get_next(L1, L):-
    reverse(L1, [_|M]),
    reverse(M, L2),
    L = L2.


debut([], []):- !.

debut(L1, L):-
    get_next(L1,L2),
    debut(L2, L).

debut(L, L).
debut([],_):- fail.
subList(L,L1):- debut(L,L1).

subList([_|L],SL):- subList(L,SL).


%Tri-fusion

separer([],[],[]).
separer([X|L],L1,[X|L2]):-  longeur(L,S),I is S+1, I>0,pair(S),
    separer(L,L1,L2).
separer([X|L],[X|L1],L2):- longeur(L,S),I is S+1, pair(I),
    separer(L,L1,L2).

%fusionner([],[],[]).
fusionner([],L,L):- !.
fusionner(L,[],L):- ! .
fusionner([X|L],[Y|L2],[X|L3]):- X<Y,fusionner(L,[Y|L2],L3).
fusionner([X|L],[Y|L2],[Y|L3]):- X>Y,fusionner([X|L],L2,L3).

trier([],[]):-!.
trier([X],[X]).
trier(L,S):- separer(L,L1,L2) , trier(L1,L11), trier(L2,L22), fusionner(L11,L22,S).




