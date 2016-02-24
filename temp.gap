KSSubsetLexRank := function( n, T )
    local r, i;
    r := 0;
    for i in [1..n] do
        if i in T then
            r := r + 2^(n-i);
        fi;
    od;
    return r;
end;

KSSubsetLexUnrank := function ( n, r )
    local T, i;
    T := [];
    for i in [n,n-1..1] do
        if r mod 2 = 1 then
            Add(T,i);
        fi;
        r := Int(r/2);
    od;
    return T;
end;

KSExactCover := function( n, S )
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
end;

        
                 
                                           
