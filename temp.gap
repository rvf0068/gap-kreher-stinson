KSRandomKnapsackInstance := function(n,Wmax)
    local P, W, M, i, epsilon;
    P := [];
    W := [];
    epsilon := 0.9 + (0.2/100)*(Random(GlobalMersenneTwister,[1..100]) - 1);
    for i in [1..n] do
        W[i] := Random(GlobalMersenneTwister, [1..Wmax]);
        P[i] := Int(2*epsilon*W[i]);
    od;
    M := Int(Sum(W) / 2);
    return [P, W, M];
end;


KSWalks :=function(n)
local walksaux, C, steps, walk, x, s, p, i, j, k, a, suma,valores, c;
      steps:=[[-1,0],[1,0],[0,1],[0,-1]];
      C:=[[]];                                                 
      walk:=[[]];
      suma:=[0,0]; 
      valores:=[];
      c:=0;
      walksaux:=function( s )
          if s=n+1 then
              Print("Walk", walk, "\n");             
              C[s]:=[];
              c:=c+1;
          else
              C[s]:=[];
              suma:=[0,0];
              for i in [1..s] do
                  valores:=[];
                  C[s]:=[];
                  a:=0;
                  for p in [1..4] do
                      for j in [1..i] do
                          suma :=Sum(List([1..j-1], k -> Reversed(walk)[k])) + steps[p];
                          if suma=[0,0] then
                              a:=0;
                              Print("Pruning! \n");
                              break;
                          else
                              a:=1;
                          fi;
                      od; 
                      if a=1 then 
                          Add(valores,p);
                      fi;
                      suma:=[0,0];
                  od;   
              od;
                  for x in valores do
                      Add(C[s], steps[x]);
                  od;                   
          fi;
          for x in C[s] do
              walk[s] :=x; 
              walk :=walk{[1..s]};
              walksaux(s+1);
          od;
      end;
      if IsPosInt(n) then 
          walksaux(1);
      else
          Print("Needs a positive integer number \n");
      fi;
      Print("Total self-avoiding walks of length ", n, ":  ", c, "\n");
      return;
end;

KSCheckKnapsackInput :=function(P, W, M)
    if not(IsList(P) and IsList(W)) then
        Print("Error. First two arguments must be lists.\n");
        return false;
    elif not (Length(P)=Length(W)) then
        Print("Error. The first two arguments must be lists of the same length.\n");
        return false;
    elif not(IsInt(M)) then
        Print("Error. The third arguments must be an integer.\n");
        return false;
    else
        return true;
    fi;
end;


KSKnapsack2 :=function(P, W, M)
    local knapaux, n, x, XX, OptP, OptX, C;
    XX := [];
    C := [];
    OptP := 0;
    OptX := 0;
    n := Length(P);
    knapaux := function(l,CurW)
        if l = n+1 then
            Print("Checking ",XX,"\n");
            if Sum(List([1..n], i -> P[i]*XX[i])) > OptP then
                Print("Improved profit!\n");
                OptP := Sum(List([1..n], i -> P[i]*XX[i]));
                OptX := ShallowCopy(XX);
            fi;
            C[l] := [];
        else
            if CurW + W[l] <= M then
                C[l] := [1,0];
            else
                C[l] := [0];
                Print("Pruning!\n");
            fi;
        fi; Print("Los C ", C[l], "\n");
        for x in C[l] do
            XX[l] := x;
            knapaux(l+1, CurW + W[l]*XX[l]);
        od;
    end;
    if KSCheckKnapsackInput(P, W, M) then
        knapaux(1,0);
        Print("Maximum profit is ",OptP," with vector ",OptX,"\n");
    fi;
    return;
end;

KSSortForRationalKnapsack :=function(P, W)
    local l, i, ls, perm;
    l := List( [1..Length(P)], i -> P[i]/W[i] );
    ls := ShallowCopy(l);
    Sort(ls);
    ls := Reversed(ls);
    perm := PermListList(ls, l);
    return [Permuted(P, perm), Permuted(W, perm)];
end;

KSRationalKnapsackSorted :=function( P, W, M )
    local i, j, Ps, Ws, XX, n;
    i := 1;
    Ps := 0;
    Ws := 0;
    XX := [];
    n := Length(P);
    for j in [1..n] do
        XX[j] := 0;
    od;
    while Ws < M and i < n+1 do
        if Ws + W[i] <= M then
            XX[i] := 1;
            Ws := Ws + W[i];
            Ps := Ps + P[i];
        else
            XX[i] := (M - Ws) / W[i];
            Ws := M;
            Ps := Ps + XX[i]*P[i];
        fi;
        i := i + 1;
    od;
    return Ps;
end;

KSAllCliques:= function( G )
    local allcliques, C, all, V, x, N, n, B, XX;
    C := [];
    all := [];
    N := [];
    XX := [];
    n := Length( G );
    V := [1..n];
    B := List( V, i -> [i+1..n] );
    allcliques := function(l)
        if l = 0 then
            Add( all, [] );
        else
            Add( all, ShallowCopy(XX) );  
        fi;
        if l = 0 then
            N[l+1] := V;
        else
            N[l+1] := Intersection( G[XX[l]], N[l] );
        fi;
        if N[l+1] = [] then
            Print(XX," is maximal!\n");
        fi;
        if l = 0 then
            C[l+1] := V;
        else
            C[l+1] := Intersection( G[XX[l]], C[l], B[XX[l]] );
        fi;
        for x in C[l+1] do
            XX[l+1] := x;
            XX := XX{[1..l+1]};
            allcliques(l+1);
        od;
    end;
    allcliques(0);
    return all;
end;
