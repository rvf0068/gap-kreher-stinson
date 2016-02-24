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
