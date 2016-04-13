#F  KSSubsetLexRank( n, T ) 
##
InstallGlobalFunction( KSSubsetLexRank, function( n,T )
    local r, i;
    r := 0;
    for i in [1..n] do
        if i in T then
            r := r + 2^(n-i);
        fi;
    od;
    return r;
end);

#F  KSSubsetLexUnrank( n, r ) 
##
InstallGlobalFunction( KSSubsetLexUnrank, function( n,r )
    local T, i;
    T := [];
    for i in [n,n-1..1] do
        if r mod 2 = 1 then
            Add(T,i);
        fi;
        r := Int(r/2);
    od;
    return Reversed(T);
end);

#F  KSkSubsetLexRank( T, k, n ) 
##
InstallGlobalFunction( KSkSubsetLexRank, function( T, k, n )
    local U, r, i, j;
    U := [];
    r := 0;
    U[1] := 0;
    for i in [2..Length(T)+1] do
        U[i] := T[i-1];
    od;
    for i in [1..k] do
        if U[i] + 1 <= U[i+1] - 1 then
            for j in [U[i]+1..U[i+1]-1] do
                r := r + NrCombinations([1..n-j],k-i);
            od;
        fi;
    od;
    return r;
end);

#F  KSkSubsetLexUnrank( r, k, n ) 
##
InstallGlobalFunction( KSkSubsetLexUnrank, function( r, k, n )
    local x, T, i, comb;
    T := [];
    x := 1;
    for i in [1..k] do
        while n-x>=k-i and NrCombinations([1..n-x], k-i) <= r do
            r := r - NrCombinations([1..n-x], k-i);
            x := x+1;
        od;
        T[i] := x;
        x := x+1;
    od;
    return T;
end);
