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
