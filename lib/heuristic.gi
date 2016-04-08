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
    Print("Start with partition ",P,", cost: ",KSCost(G,P),"\n");
    c := 1;
    while c <= cmax do
        Print("Attempt c=",c,"\n");
        Q := KSAscend(G, P);
        if not Q[2] then
            P := Q[1];
            Print("Better cost with ",P,", cost: ",KSCost(G,P),"\n");
        else
            return P;
        fi;
        c := c+1;
    od;
end);


