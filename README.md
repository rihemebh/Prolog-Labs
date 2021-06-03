# Prolog

- Fibonacci 
```Prolog
fibo(0,1):- !.
fibo(1,1):- !.
fibo(N,S):- N>1,N1 is N-1, N2 is N-2, fibo(N1,S1),fibo(N2,S2),S is S1+S2.
```
- Factoriel
```Prolog
fact(0,1):- !.
fact(1,1):-!.
fact(N,S) :- N1 is N-1, fact(N1,S1), S is N*S1.

```
- Pair 
```Prolog
pair(0):- !.
pair(X):- X>0,X1 is X-2, pair(X1) .

```
- Max
```Prolog
nmax(1,S):- read(S), !.
nmax(N,S):-  N>1 , read(X),N1 is N-1 , nmax(N1,S1),S is max(S1,X).


```

- List :
    - Max 
    ```Prolog
    maxList([],0):- !.
    maxList([X|L],S) :- maxList(L,S1) ,S is max(S1,X).

    ```
    - Length
    ```Prolog
    longeur([],0):-!.
    longeur([_|L],S) :- longeur(L,S1), S is S1+1.

    ```
    - Sum
    ```PROLOG
    sumList([],0):-!.
    sumList([X|L],S) :-  sumList(L,S1) , S is S1+X.

    ```
    - Average
       ```PROLOG
       average([],0).
       average(L,S):- sumList(L,X1) , longeur(L,X2) , S is X1/X2.

      ```
    - Merging 2 lists withou redundancy
        ```PROLOG
         inter([],_,[]).
         inter(_,[],[]).
         inter(L1,L1,L1).
         inter([X|L1],L2,L):- member(X,L1),!,inter(L1,L2,L).
         inter([X|L1],L2,[X|L]):- member(X,L2),!,inter(L1,L2,L).
         inter([_|L1],L2,L):- inter(L1,L2,L) .
         ```
 
   - Sort
      ```PROLOG
       separer([],[],[]).
       separer([X|L],L1,[X|L2]):-  longeur(L,S),I is S+1, I>0,pair(S),
       separer(L,L1,L2).
       separer([X|L],[X|L1],L2):- longeur(L,S),I is S+1, pair(I),separer(L,L1,L2).

      fusionner([],L,L):- !.
      fusionner(L,[],L):- ! .
      fusionner([X|L],[Y|L2],[X|L3]):- X<Y,fusionner(L,[Y|L2],L3).
      fusionner([X|L],[Y|L2],[Y|L3]):- X>Y,fusionner([X|L],L2,L3).

      trier([],[]):-!.
      trier([X],[X]).
      trier(L,S):- separer(L,L1,L2) , trier(L1,L11), trier(L2,L22), fusionner(L11,L22,S).


       ```

  
