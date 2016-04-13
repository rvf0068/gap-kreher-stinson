#F  KSRandomkSubset( k, n ) 
##
InstallGlobalFunction( KSRandomkSubset, function( k, n )
    local r;
    r := Random(0, NrCombinations([1..n],k)-1);
    return KSkSubsetLexUnrank(r, k, n);
end);

#F  KSSelectPartition( n ) 
##
InstallGlobalFunction( KSSelectPartition, function( n )
    local r,P;
    P := [];
    P[1] := KSRandomkSubset(n,2*n);
    P[2] := Difference([1..2*n],P[1]);
    return P;
end);

#F  KSCost( G, P ) 
##
InstallGlobalFunction( KSCost, function( G, P )
    local u, v, cost;
    cost := 0;
    for u in P[1] do
        for v in P[2] do
            cost := cost + G[u][v];
        od;
    od;
    return cost;
end);

#F  KSGain( G, P, u, v ) 
##
InstallGlobalFunction( KSGain, function( G, P, u, v )
    local gain, x, y;
    gain := 0;
    for x in P[1] do
        gain := gain + G[x][v];
    od;
    for y in P[2] do
        gain := gain + G[u][y];
    od;
    for x in P[1] do
        gain := gain - G[x][u];
    od;    
    for y in P[2] do
        gain := gain - G[v][y];
    od;
    gain := gain - 2*G[u][v];
    return gain;
end);

#F  KSRandomCostMatrix( n, Wmax ) 
##
InstallGlobalFunction( KSRandomCostMatrix, function( n, Wmax )
    local G, i, j;
    G := [];
    for i in [1..n] do
        G[i] := [];
        G[i][i] := 0;
    od;
    for i in [1..n] do
        for j in [i+1..n] do
            G[i][j] := Random(0,Wmax);
            G[j][i] := G[i][j];
        od;
    od;
    return G;
end);

#F  KSAscend( G, P ) 
##
InstallGlobalFunction( KSAscend, function( G, P )
    local g, i, j, Q, t, x, y;
    Q := StructuralCopy(P);
    g := 0;
    for i in Q[1] do
        for j in Q[2] do
            t := KSGain(G, Q, i, j);
            if t > g then
                x := i;
                y := j;
                g := t;
            fi;
        od;
    od;
    if g > 0 then
        AddSet(Q[1], y);
        RemoveSet(Q[1], x);
        AddSet(Q[2], x);
        RemoveSet(Q[2], y);
        return [Q, false, g];
    else
        return [Q, true, g];
    fi;
end);

#F  KSUGP( G, cmax ) 
##
InstallGlobalFunction( KSUGP, function( G, cmax )
    local P, c, Q;
    P := KSSelectPartition(Length(G)/2);
    Info(InfoKS, 1, "Start with partition ", P, ", cost: ", KSCost(G,P));
    c := 1;
    while c <= cmax do
        Info(InfoKS, 1, "Attempt c=", c);
        Q := KSAscend(G, P);
        if not Q[2] then
            P := Q[1];
            Info(InfoKS, 1, "Better cost with ", P, ", cost: ", KSCost(G,P));
        else
            return P;
        fi;
        c := c+1;
    od;
end);

#F  KSConstructBlocks( v, other ) 
##
InstallGlobalFunction( KSConstructBlocks, function( v, other )
    local B, x, y, z;
    B := [];
    for x in [1..v] do
        for y in [x+1..v] do
            z := other[x][y];
            if z > y then
                Add(B,[x,y,z]);
            fi;
        od;
    od;
    return B;
end);

#F  KSRevisedStinsonAlgorithm( v ) 
##
InstallGlobalFunction( KSRevisedStinsonAlgorithm, function( v )
    local RevisedSwitch, NumBlocks, other, Initialize, 
          InsertPair, DeletePair,
          NumLivePoints,
          LivePoints,
          IndexLivePoints,
          NumLivePairs,
          LivePairs,
          IndexLivePairs;
    
    Initialize := function ()
        local x, y;
        LivePoints := [];
        IndexLivePoints := [];
        NumLivePairs := [];
        NumLivePoints := v;
        LivePairs := [];
        IndexLivePairs := [];
        other := [];
        for x in [1..v] do
            LivePoints[x] := x;
            IndexLivePoints[x] := x;
            NumLivePairs[x] := v-1;
            LivePairs[x] := [];
            IndexLivePairs[x] := [];
            for y in [1..v-1] do
                LivePairs[x][y] := ((y+x-1) mod v) + 1;
            od;
            other[x] := [];
            for y in [1..v] do
                IndexLivePairs[x][y] := (y-x) mod v;
                other[x][y] := 0;
            od;
        od;
        Info(InfoKS, 2, "LivePoints=", LivePoints,
              ", IndexLivePoints=", IndexLivePoints,
              ", NumLivePairs=", NumLivePairs,
              ", NumLivePoints=", NumLivePoints,
              ", LivePairs=", LivePairs,
              ", IndexLivePairs=", IndexLivePairs,
              ", other=", other);
    end;
    
    InsertPair := function (x, y)
        local posn;
        if NumLivePairs[x] = 0 then
            NumLivePoints := NumLivePoints + 1;
            LivePoints[NumLivePoints] := x;
            IndexLivePoints[x] := NumLivePoints;
        fi;
        NumLivePairs[x] := NumLivePairs[x] + 1;
        posn := NumLivePairs[x];
        LivePairs[x][posn] := y;
        IndexLivePairs[x][y] := posn;
    end;
    
    DeletePair := function (x, y)
        local posn, num, z;
        posn := IndexLivePairs[x][y];
        num := NumLivePairs[x];
        z := LivePairs[x][num];
        LivePairs[x][posn] := z;
        IndexLivePairs[x][z] := posn;
        LivePairs[x][num] := 0;
        IndexLivePairs[x][y] := 0;
        NumLivePairs[x] := NumLivePairs[x] - 1;
        if NumLivePairs[x] = 0 then
            posn := IndexLivePoints[x];
            z := LivePoints[NumLivePoints];
            LivePoints[posn] := z;
            IndexLivePoints[z] := posn;
            LivePoints[NumLivePoints] := 0;
            IndexLivePoints[x] := 0;
            NumLivePoints := NumLivePoints - 1;
        fi;
    end;
    
    RevisedSwitch := function ()
        local r, s, t, x, y, z, w, U,
              AddBlock, ExchangeBlock;
        
        AddBlock := function (x, y, z)
            other[x][y] := z;
            other[y][x] := z;
            other[x][z] := y;
            other[z][x] := y;
            other[y][z] := x;
            other[z][y] := x;
            DeletePair(x,y);
            DeletePair(y,x);
            DeletePair(x,z);
            DeletePair(z,x);
            DeletePair(y,z);
            DeletePair(z,y);
        end;
        
        ExchangeBlock := function (x, y, z, w)
            other[x][y] := z;
            other[y][x] := z;
            other[x][z] := y;
            other[z][x] := y;
            other[y][z] := x;
            other[z][y] := x;
            other[w][y] := 0;
            other[y][w] := 0;
            other[w][z] := 0;
            other[z][w] := 0;
            InsertPair(w,y);
            InsertPair(y,w);
            InsertPair(w,z);
            InsertPair(z,w);
            DeletePair(x,y);
            DeletePair(y,x);
            DeletePair(x,z);
            DeletePair(z,x);
        end;
            
        r := Random(1, NumLivePoints);
        x := LivePoints[r];
        U := KSRandomkSubset(2, NumLivePairs[x]);
        s := U[1];
        t := U[2];
        y := LivePairs[x][s];
        z := LivePairs[x][t];
        Info(InfoKS, 2, "x=", x, ", y=", y, ", z=", z);
        if other[y][z] = 0 then
            AddBlock(x, y, z);
            NumBlocks := NumBlocks + 1;
            Info(InfoKS, 1, "Adding: ", Set([x,y,z]));
        else
            w := other[y][z];
            ExchangeBlock(x, y, z, w);
            Info(InfoKS, 1, "Exchange: ", Set([y,z,w]), " by ", Set([x,y,z]));
        fi;
        Info(InfoKS, 2, "LivePoints=", LivePoints,
              ", IndexLivePoints=", IndexLivePoints,
              ", NumLivePairs=", NumLivePairs,
              ", NumLivePoints=", NumLivePoints,
              ", LivePairs=", LivePairs,
              ", IndexLivePairs=", IndexLivePairs,
              ", other=", other);
    end;
    
    NumBlocks := 0;
    Initialize();
    while NumBlocks < v*(v-1)/6 do
        RevisedSwitch();
    od;
    return KSConstructBlocks(v, other);
end);

#F  KSKnapsackSimulatedAnnealing( K, cmax, T0, alpha ) 
##
InstallGlobalFunction( KSKnapsackSimulatedAnnealing, function( K, cmax, T0, alpha )
    local c, T, XX, CurW, CurP, Xbest, n, j, Y, P, W, M, r;
    c := 0;
    T := T0;
    P := K[1];
    W := K[2];
    M := K[3];
    n := Length(K[1]);
    XX := List([1..n], x -> 0);
    CurW := 0;
    Xbest := XX;
    while c <= cmax do
        Info(InfoKS, 1, "Attempt: ", c);
        j := Random(1,n);
        Y := ShallowCopy(XX);
        Y[j] := 1 - XX[j];
        if not((Y[j] = 1) and (CurW + W[j] > M)) then
            if Y[j] = 1 then
                XX := ShallowCopy(Y);
                CurW := CurW + W[j];
                CurP := Sum(List([1..n], i -> P[i]*XX[i]));
                if CurP > Sum(List([1..n], i -> P[i]*Xbest[i])) then
                    Info(InfoKS, 1, "Improved profit: ", CurP);
                    Xbest := ShallowCopy(XX);
                fi;
            else
                r := 0.0 + (1/1000000)*Random(0,1000000);
                Info(InfoKS, 1, "Downward move with probability ", Exp(-P[j]/T));
                if r < Exp(-P[j]/T) then
                    Info(InfoKS, 1, "Downward move!");
                    XX := ShallowCopy(Y);
                    CurW := CurW - W[j];
                fi;
            fi;
        fi;
        c := c + 1;
        T := alpha*T;
        Info(InfoKS, 2, "Temperature: ", T);
    od;
    return [Xbest, Sum(List([1..n], i -> P[i]*Xbest[i]))];
end);

#F  KSRandomFeasibleSolutionKnapsack( K ) 
##
InstallGlobalFunction( KSRandomFeasibleSolutionKnapsack, function( K )
    local P, W, M, i, n, XX, x;
    P := K[1];
    W := K[2];
    M := K[3];
    n := Length(K[1]);
    XX := List([1..n], x -> 0);
    i := 1;
    while i <= n and Sum(List([1..n], x -> W[x]*XX[x])) <= M do
        XX[i] := Random(0, 1);
        i := i + 1;
    od;
    if i = n+1 and Sum(List([1..n], x -> W[x]*XX[x])) <= M then
        Info(InfoKS, 3, "Done!");
        return XX;
    else
        XX[i-1] := 0;
        Info(InfoKS, 3, "i=", i, ". A lot of weight!");
        return XX;
    fi;
end);

#F  KSKnapsackTabuSearch( K, cmax, L ) 
##
InstallGlobalFunction( KSKnapsackTabuSearch, function( K, cmax, L )
    local c, XX, CurW, CurP, Xbest, n, i, j, N, P, W, M, start, TabuList, 
          maxinlist;
    maxinlist := function(l, F)
        local i, l2, best, ibest;
        l2 := List(l,F);
        best := -infinity;
        ibest := 0;
        for i in [1..Length(l)] do
            if l2[i] > best then
                ibest := i;
                best := l[i];
            fi;
        od;
        return l[ibest];
    end;
    c := 1;
    P := K[1];
    W := K[2];
    M := K[3];
    n := Length(K[1]);
    XX := KSRandomFeasibleSolutionKnapsack(K);
    CurW := Sum(List([1..n], i -> W[i]*XX[i]));
    Xbest := ShallowCopy(XX);
    TabuList := [];
    while c <= cmax do
        Info(InfoKS, 1, "Attempt: ", c);
        Info(InfoKS, 1, "XX: ", XX);
        Info(InfoKS, 2, "TabuList: ", TabuList);
        N := [1..n];
        start := Maximum(1, c-L);
        N := Difference(N, TabuList{[start..c-1]});
        for i in N do
            if (XX[i] = 0) and (CurW + W[i] > M) then
                N := Difference(N, [i]);
            fi;
        od;
        Info(InfoKS, 2, "N: ", N);
        if N = [] then
            break;
        fi;
        Info(InfoKS, 2, "List: ", List(N, i->(-1)^XX[i]*(P[i]/W[i])));
        i := maxinlist(N,i->(-1)^XX[i]*(P[i]/W[i]));
        Info(InfoKS, 2, "i: ", i);
        TabuList[c] := i;
        XX[i] := 1 - XX[i];
        if XX[i] = 1 then
            CurW := CurW + W[i];
        else
            CurW := CurW - W[i];
        fi;
        if Sum(List([1..n], i -> P[i]*XX[i])) > 
           Sum(List([1..n], i -> P[i]*Xbest[i])) then
            Xbest := ShallowCopy(XX);
        fi;
        Info(InfoKS, 2, "Xbest: ", Xbest, ", CurW: ", CurW);
        c := c+1;
    od;
    return [Xbest, Sum(List([1..n], i -> P[i]*Xbest[i]))];
end);
