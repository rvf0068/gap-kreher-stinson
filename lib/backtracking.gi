#############################################################################
##
##
#W  backtracking.gi       kreher-stinson Package             
##
##  Installation file for backtracking functions
##
#############################################################################

#F  KSCheckKnapsackInput( P, W, M )
##
InstallGlobalFunction(
    KSCheckKnapsackInput, function(P, W, M)
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
end);

#F  KSKnapsack1( P, W, M ) 
##
InstallGlobalFunction( KSKnapsack1, function(P, W, M)
    local knapaux, n, XX, OptP, OptX, CurP;
    XX := [];
    OptP := 0;
    OptX := 0;
    CurP := 0;
    n := Length(P);
    knapaux := function(l)
        if l = n then
            Print("Checking ",XX);
            if Sum(List([1..n], i -> W[i]*XX[i])) <= M then
                CurP := Sum(List([1..n], i -> P[i]*XX[i]));
                Print(", feasible, with profit ",CurP,".\n");
                if CurP > OptP then
                    Print("Improved profit!\n");
                    OptP := CurP;
                    OptX := ShallowCopy(XX);
                fi;
            else
                Print(", not feasible.\n");
            fi;
        else
            l := l+1;
            XX[l] := 1;
            knapaux(l);
            XX[l] := 0;
            knapaux(l);
        fi;
    end;
    if KSCheckKnapsackInput(P, W, M) then
        knapaux(0);
        Print("Maximum profit is ",OptP," with vector ",OptX,"\n");
    fi;
    return;
end );

#F  KSKnapsack2( P, W, M ) 
##
InstallGlobalFunction( KSKnapsack2, function(P, W, M)
    local knapaux, n, x, XX, OptP, OptX, CurP, C;
    XX := [];
    C := [];
    OptP := 0;
    OptX := 0;
    n := Length(P);
    knapaux := function(l,CurW)
        if l = n+1 then
            CurP := Sum(List([1..n], i -> P[i]*XX[i]));
            Print("Checking ",XX,"\n");
            if CurP > OptP then
                Print("Improved profit!\n");
                OptP := CurP;
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
        fi;
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
end );

#F  KSAllCliques( G ) 
##
InstallGlobalFunction( KSAllCliques, function( G )
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
end );

#F  KSQueens( n ) 
##
InstallGlobalFunction( KSQueens, function( n )
    local C, XX, queens,k;
    C := [];
    XX := [];
    k:=0;
    queens := function(l)
        local x,valid;
        valid := function()
            local i, j, Bad;
            Bad := [];
            for i in [1..l] do
                Append(Bad,[XX[i],XX[i]-l-1+i,XX[i]+l+1-i]);
            od;
            return Difference( [1..n], Bad );
        end;
        if l = n then
            Print(XX,"\n");    
        fi;
        C[l+1] := valid();
        for x in C[l+1] do
            XX[l+1] := x;
            XX := XX{[1..l+1]};
            k := k+1;
            queens(l+1);
        od;
    end;
    queens(0);
    return;
end);

#F  KSExactCover( n, S ) 
##
InstallGlobalFunction( KSExactCover, function( n, S )
    local C, XX, cover, m, A, B, H, i, j, U, Cp;
    cover := function (l, rp)
        local r, x, sol;
        if l = 0 then
            U[l+1] := [1..n];
            r := 1;
        else
            U[l+1] := Difference( U[l], S[XX[l]] );
            r := rp;
            while not(r in U[l+1]) and (r < n+1) do
                r := r + 1;
            od;
        fi;
        if r = n+1 then
            sol := List(XX,i->S[i]);
            Print(sol,"\n");
        fi;
        if l = 0 then
            Cp[l+1] := [1..m];
        else
            Cp[l+1] := Intersection( A[XX[l]], B[XX[l]], Cp[l] );
        fi;
        C[l+1] := Intersection( Cp[l+1], H[r] );
        for x in C[l+1] do
            XX[l+1] := x;
            XX := XX{[1..l+1]};
            cover(l+1,r);
        od;
    end;
    m := Length(S);
    A := [];
    B := [];
    H := [];
    C := [];
    XX := [];
    U := [];
    Cp := [];
    SortBy( S, x -> KSSubsetLexRank (n, x) );
    S := Reversed( S );
    for i in [1..m] do
        A[i] := Filtered( [1..m], j -> Intersection( S[i], S[j]) = [] );
        B[i] := [i+1..m];
    od;
    for i in [1..n] do
        H[i] := Filtered( [1..m], j -> Intersection( S[j], [1..i] ) = [i] );
    od;
    H[n+1] := [];
    cover(0, 1);
end);

#F  KSWalks( n ) 
##
InstallGlobalFunction( KSWalks, function( n )
                         local walksaux, C, steps, walk, x;
                         C:=[];
                         steps:=[-1,1,-2,2];
                         walk:=[];
                         walksaux := function( l )
                             if l=n+1 then 
                                 Print("Walk", C[l], "n");
                                 C[l]:=[];
                             else
                                 for x in steps do
                                     if x + C[l-1]=0 or x + Sum(List([1..l-1], i -> C[i]))=0 then
                                            Print("Pruning! \n");
                                     else
                                            Append(C[l],[x]);
                                     fi;
                                 od;
                             fi;
                             for x in C[l] do
                                 walksaux(l+1);
                             od;
                         end;
                         if IsPosInt(n) then
                             walksaux(1);
                         else
                             Print("Requires a natural number! \n");
                         fi;
                         return;
                     end );

#F  KSSortForRationalKnapsack(P, W) 
##
InstallGlobalFunction( KSSortForRationalKnapsack, function(P, W)
    local l, i, ls, perm;
    l := List( [1..Length(P)], i -> P[i]/W[i] );
    ls := ShallowCopy(l);
    Sort(ls);
    ls := Reversed(ls);
    perm := PermListList(ls, l);
    return [Permuted(P, perm), Permuted(W, perm)];
end);

#F  KSRationalKnapsackSorted( P, W, M ) 
##
InstallGlobalFunction( KSRationalKnapsackSorted, function( P, W, M )
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
end);

#F  KSKnapsack3( P, W, M ) 
##
InstallGlobalFunction( KSKnapsack3, function( P, W, M )
    local knapaux, n, x, XX, OptP, OptX, C, R;
    XX := [];
    C := [];
    OptP := 0;
    OptX := 0;
    n := Length(P);
    R := KSSortForRationalKnapsack(P, W);
    P := R[1];
    W := R[2];
    knapaux := function(l, CurW)
        local B;
        if l = n+1 then
            Print("Checking ", XX, "\n");
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
        fi;
        B := Sum( List ( [1..l-1] , i -> P[i]*XX[i] ) );
        B := B + KSRationalKnapsackSorted( P{[l..n]}, W{[l..n]}, M - CurW);
        for x in C[l] do
            if B <= OptP then
                Print("Pruning using Bounding Function!\n");
                return;
            fi;
            XX[l] := x;
            knapaux(l+1, CurW + W[l]*XX[l]);
        od;
    end;
    if KSCheckKnapsackInput(P, W, M) then
        knapaux(1,0);
        Print("Maximum profit is ",OptP," with vector ",OptX,"\n");
    fi;
    return;
end);

#F  KSRandomKnapsackInstance( n, Wmax ) 
##
InstallGlobalFunction( KSRandomKnapsackInstance, function( n, Wmax )
    local P, W, M, i, epsilon;
    P := [];
    W := [];
    epsilon := 0.9 + (0.2/1000000)*Random(0,1000000);
    # epsilon is a random real number between 0.9 and 1.1
    for i in [1..n] do
        W[i] := Random(1,Wmax);
        P[i] := Int(2*epsilon*W[i]);
    od;
    M := Int(Sum(W) / 2);
    return [P, W, M];
end);

#F  KSRandomTSPInstance( n, Wmax ) 
##
InstallGlobalFunction( KSRandomTSPInstance, function( n, Wmax )
    local G, i, j;
    G := [];
    for i in [1..n] do
        G[i] := [];
        G[i][i] := infinity;
    od;
    for i in [1..n] do
        for j in [i+1..n] do
            G[i][j] := Random(1,Wmax);
            G[j][i] := G[i][j];
        od;
    od;
    return G;
end);

#F  KSTSP1( G ) 
##
InstallGlobalFunction( KSTSP1, function( G )
    local C, XX, tsp, n, thecost, optcost, optX;
    C := [];
    XX := [];
    optcost := infinity;
    n := Length(G);
    tsp := function(l)
        local x,cost;
        cost := function(V)
            local c, i;
            c := 0;
            for i in [1..Length(V)-1] do
                c := c + G[V[i]][V[i+1]];
            od;
            c := c + G[V[n]][1];
            return c;
        end;
        if l = n then
            thecost := cost(XX);
            if thecost < optcost then
                optcost := thecost;
                optX := XX;
                Print("Found better route ", optX, " with cost ", optcost, "\n");
            fi;
        fi;
        if l = 0 then
            C[l+1] := [1];
        elif l = 1 then
            C[l+1] := [2..n];
        else
            C[l+1] := Difference(C[l],[XX[l]]);
        fi;
        for x in C[l+1] do
            XX[l+1] := x;
            XX := XX{[1..l+1]};
            tsp(l+1);
        od;
    end;
    tsp(0);
    return;
end);

#F  KSMinCostBound( V, G ) 
##
InstallGlobalFunction( KSMinCostBound, function( V, G )
    local c, i, len, Y, y, Yp, n;
    n := Length(G);
    len := Length(V);
    c := 0;
    for i in [1..len-1] do
        c := c + G[V[i]][V[i+1]];
    od;
    if len = n then
        c := c + G[V[len]][1];
    else
        Y := Difference([1..n], V);
        c := c + Minimum(List(Y, x -> G[V[len]][x]));
        Yp := Concatenation(Y, [V[1]]);
        for y in Y do
            c := c + Minimum(List(Yp, x -> G[y][x]));
        od;
    fi;
    return c;
end);

#F  KSReduce( M ) 
##
InstallGlobalFunction( KSReduce, function( M )
    local val, i, j, n, min, Mc;
    val := 0;
    n := Length(M);
    Mc := StructuralCopy(M);
    for i in [1..n] do
        min := Mc[i][1];
        for j in [2..n] do
            if Mc[i][j] < min then
                min := Mc[i][j];
            fi;
        od;
        for j in [1..n] do
            Mc[i][j] := Mc[i][j] - min;
        od;
        val := val + min;
    od;
    for j in [1..n] do
        min := Mc[1][j];
        for i in [2..n] do
            if Mc[i][j] < min then
                min := Mc[i][j];
            fi;
        od;
        for i in [1..n] do
            Mc[i][j] := Mc[i][j] - min;
        od;
        val := val + min;
    od;
    return val;
end);

#F  KSReduceBound( V, M ) 
##
InstallGlobalFunction( KSReduceBound, function( V, M )
    local m, n, Mp, i, j, y, x, ans;
    m := Length(V);
    n := Length(M);
    if m = n then 
        return KSMinCostBound(V, M);
    fi;
    Mp := [];
    for j in [1..n-m+1] do
        Mp[j] := [];
    od;
    Mp[1] := [];
    Mp[1][1] := infinity;
    j := 2;
    for y in Difference([1..n], V) do
        Mp[1][j] := M[V[m]][y];
        j := j + 1;
    od;
    i := 2;
    for x in Difference([1..n], V) do
        Mp[i][1] := M[x][V[1]];
        i := i + 1;
    od;
    i := 2;
    for x in Difference([1..n], V) do
        j := 2;
        for y in Difference([1..n], V) do
            Mp[i][j] := M[x][y];
            j := j + 1;
        od;
        i := i + 1;
    od;
    #Print(Mp);
    ans := KSReduce(Mp);
    for i in [1..m-1] do
        ans := ans + M[V[i]][V[i+1]];
    od;
    return ans;
end);

#F  KSTSP2( G, F ) 
##
InstallGlobalFunction( KSTSP2, function( G, F )
    local C, XX, tsp, n, thecost, optcost, optX, B;
    C := [];
    XX := [1];
    optcost := infinity;
    n := Length(G);
    tsp := function(l)
        local x;
        if l = n then
            thecost := KSMinCostBound(XX, G);
            if thecost < optcost then
                optcost := thecost;
                optX := ShallowCopy(XX);
                Print("Found better route ", optX, " with cost ", optcost, "\n");
            fi;
        fi;
        if l = 1 then
            C[l+1] := [2..n];
        else
            C[l+1] := Difference(C[l], [XX[l]]);
        fi;
        XX := XX{[1..l]};
        B := F(XX, G);
        if  B >= optcost then
            Print("XX=",XX,", B=",B,", Opt=",optcost,", Bounding used!\n");
            return;
        else
            for x in C[l+1] do
                XX[l+1] := x;
                tsp(l+1);
            od;
        fi;
    end;
    tsp(1);
    return [optX, optcost];
end);

#F  KSMaxClique1( G ) 
##
InstallGlobalFunction( KSMaxClique1, function( G )
    local allcliques, C, all, V, x, n, B, XX, optX, optS;
    C := [];
    all := [];
    XX := [];
    n := Length( G );
    V := [1..n];
    B := List( V, i -> [i+1..n] );
    optX := [];
    optS := 0;
    allcliques := function(l)
        if l = 0 then
            Add( all, [] );
        else
            Add( all, ShallowCopy(XX) );  
        fi;
        if l = 0 then
            C[l+1] := V;
        else
            C[l+1] := Intersection( G[XX[l]], C[l], B[XX[l]] );
        fi;
        if Length(XX) > optS then
            optX := ShallowCopy(XX);
            optS := Length(XX);
        fi;
        for x in C[l+1] do
            XX[l+1] := x;
            XX := XX{[1..l+1]};
            allcliques(l+1);
        od;
    end;
    allcliques(0);
    return [optX,optS];
end);

#F  KSMaxClique2( G, F ) 
##
InstallGlobalFunction( KSMaxClique2, function( G, F )
    local allcliques, C, all, V, x, n, B, BF, XX, optX, optS;
    C := [];
    all := [];
    XX := [];
    n := Length( G );
    V := [1..n];
    B := List( V, i -> [i+1..n] );
    optX := [];
    optS := 0;
    allcliques := function(l)
        if l = 0 then
            Add( all, [] );
        else
            Add( all, ShallowCopy(XX) );  
        fi;
        if l = 0 then
            C[l+1] := V;
        else
            C[l+1] := Intersection( G[XX[l]], C[l], B[XX[l]] );
        fi;
        if Length(XX) > optS then
            optX := ShallowCopy(XX);
            optS := Length(XX);
        fi;
        BF := F( XX, G, C[l+1] );
        if BF <= optS then
            #Print("XX=",XX,", B=",BF,", Opt=",optS,", Bounding used!\n");
            return;
        else
            for x in C[l+1] do
                XX[l+1] := x;
                XX := XX{[1..l+1]};
                allcliques(l+1);
            od;
        fi;
    end;
    allcliques(0);
    return [optX,optS];
end);


#F  KSSizeBound( XX, G, Cl ) 
##
InstallGlobalFunction( KSSizeBound, function( XX, G, Cl )
    return Length(XX) + Length(Cl);
end);

#F  KSGenerateRandomGraph( n ) 
##
InstallGlobalFunction( KSGenerateRandomGraph, function( n )
    local r, u, T, edges, e, j;
    u := NrCombinations([1..n],2);         # u= 10choose2 =45
    r := Random(0,2^u-1);                  # r= random in [0..2^45-1]
    T := KSSubsetLexUnrank(u, r);          # T= a subset of [1..45]
    edges := [];
    for j in T do
        e := KSkSubsetLexUnrank(j-1, 2, n);  # e= a 2-subset of [1..10]
        Add(edges,e);                        # j should be in [0..44]
    od;
    return edges;
end);

#F  KSEdgeListToAdjacencyList( Ged, n ) 
##
InstallGlobalFunction( KSEdgeListToAdjacencyList, function( Ged, n )
    local e, G, i;
    G := [];
    for i in [1..n] do
        G[i] := [];
    od;
    for e in Ged do
        Add(G[e[1]],e[2]);
        Add(G[e[2]],e[1]);
    od;
    return G;
end);

#F  KSGreedyColor( G ) 
##
InstallGlobalFunction( KSGreedyColor, function( G )
    local k, color, i, h, colorclass, V;
    color := [];
    colorclass := [];
    k := 0;
    V := Filtered([1..Length(G)], x -> IsBound(G[x]));
    for i in V do
        h := 1;
        while h <= k and IsBound(colorclass[h]) and Intersection(G[i],colorclass[h])<>[] do
            h := h+1;
        od;
        if h-1 = k then
            k := k+1;
            colorclass[h] := [];
        fi;
        Add(colorclass[h],i);
        color[i] := h;
    od;
    return [k, color, colorclass];
end);

#F  KSSamplingBound( XX, G, Cl ) 
##
InstallGlobalFunction( KSSamplingBound, function( XX, G, Cl )
    local col;
    col := KSGreedyColor(G)[2];
    return Length(XX) + Length(Set(col{Cl}));
end);

#F  KSInducedSubgraph( G, L ) 
##
InstallGlobalFunction( KSInducedSubgraph, function( G, L )
    local i, H;
    H := [];
    for i in L do
        H[i] := Intersection(G[i], L);
    od;
    return H;
end);

#F  KSGreedyBound( XX, G, Cl ) 
##
InstallGlobalFunction( KSGreedyBound, function( XX, G, Cl )
    local k;
    k := KSGreedyColor(KSInducedSubgraph(G, Cl))[1];
    return Length(XX) + k;
end);

#F  KSGenerateRandomGraph2( n, delta ) 
##
InstallGlobalFunction( KSGenerateRandomGraph2, function( n, delta )
    local x, y, edges, r;
    edges := [];
    for x in [1..n-1] do
        for y in [x+1..n] do
            r:=0.0+(1/1000000)*Random(0,1000000);
            if r >= 1-delta then
                Add(edges,[x,y]);
            fi;
        od;
    od;
    return edges;
end);
