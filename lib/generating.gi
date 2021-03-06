#F  KSSubsetLexRank( n, T ) 
##
InstallGlobalFunction( KSSubsetLexRank, function( n,T )
    local r, i;
    if not(IsSubset([1..n],T)) then
        Error("the set ",T," is not a subset of [1 .. ",n,"]\n");
    fi;
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
    if (r<0) or (r>2^n-1) then
        Error("there is no subset of [1 .. ",n,"] of rank ",r,"\n");
    fi;
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
    if (Length(T)<>k) or not(IsSubset([1..n],T)) then
        Error("the set ",T," is not a ",k,"-subset of [1 .. ",n,"]\n");
    fi;
    U := [];
    r := 0;
    U[1] := 0;
    for i in [2..Length(T)+1] do
        U[i] := T[i-1];
    od;
    for i in [1..k] do
        if U[i] + 1 <= U[i+1] - 1 then
            for j in [U[i]+1..U[i+1]-1] do
                r := r + Binomial(n-j,k-i);
            od;
        fi;
    od;
    return r;
end);

#F  KSkSubsetLexUnrank( r, k, n ) 
##
InstallGlobalFunction( KSkSubsetLexUnrank, function( r, k, n )
    local x, T, i, comb;
    if (r<0) or (r>Binomial(n,k)-1) then
        Error("there is no ",k,"-subset of [1 .. ",n,"] of rank ",r,"\n");
    fi;
    T := [];
    x := 1;
    for i in [1..k] do
        while n-x>=k-i and Binomial(n-x, k-i) <= r do
            r := r - Binomial(n-x, k-i);
            x := x+1;
        od;
        T[i] := x;
        x := x+1;
    od;
    return T;
end);

#F  KSPermLexRank( n, pi ) 
##
InstallGlobalFunction( KSPermLexRank, function( n, pi )
    local r, rho, i, j;
    if not(pi in SymmetricGroup(n)) then
        Error(pi, " is not a permutation of [1 .. ",n,"]\n");
    fi;
    r := 0;
    rho := ListPerm(pi, n);
    for j in [1..n] do
        Info(InfoKS, 2, "rho=", rho, ", r=", r);
        r := r + (rho[j]-1)*Factorial(n-j);
        for i in [j+1..n] do
            if (rho[i] > rho[j]) then
                rho[i] := rho[i] - 1;
            fi;
        od;
    od;
    return r;
end);

#F  KSPermLexUnrank( n, r ) 
##
InstallGlobalFunction( KSPermLexUnrank, function( n, r )
    local pi, i, j, d;
    if (r<0) or (r>Factorial(n)-1) then
        Error("there is no permutation of [1 .. ",n,"] of rank ",r,"\n");
    fi;
    pi := [];
    pi[n] := 1;
    for j in [1..n-1] do
        d := (r mod Factorial(j+1))/Factorial(j);
        r := r - d * Factorial(j);
        pi[n-j] := d+1;
        for i in [n-j+1..n] do
            if pi[i] > d then
                pi[i] := pi[i] + 1;
            fi;
        od;
    od;
    return PermList(pi);
end);
