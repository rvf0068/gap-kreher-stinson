KSPMRec := function (A, B, M)
    local h, j, n, U, C, D;
    n := Length(A);
    h := Random(10,Int(n/2));
    j := Random(1,n);
    U := KSPartiallyMatchedCrossover(n, A, B, j, ((h+j) mod n)+1);
    C := U[1];
    D := U[2];
    Info(InfoKS, 2, "C=", C, ", D=", D);
    KSSteepestAscentTwoOpt(C, M);
    KSSteepestAscentTwoOpt(D, M);
    return U;
end;

KSMGKRec := function (A, B, M)
    local h, i, j, n, U, C, D, T;
    n := Length(A);
    C := [];
    D := [];
    h := Random(10,Int(n/2));
    j := Random(1,n);
    T := [];
    Info(InfoKS, 3, "h=", h, ", j=", j);
    for i in [1..h] do
        D[i] := B[((i+j) mod n)+1];
        Add(T, D[i]);
    od;
    T := Set(T);
    Info(InfoKS, 2, "T=", T, ", i=", i);
    for j in [1..n] do
        if not(A[j] in T) then
            i := i+1;
            D[i] := A[j];
        fi;
    od;
    Info(InfoKS, 2, "D=", D);
    KSSteepestAscentTwoOpt(D, M);
    j := Random(1,n);
    T := [];
    for i in [1..h] do
        C[i] := A[((i+j) mod n)+1];
        Add(T, C[i]);
    od;
    T := Set(T);
    for j in [1..n] do
        if not(B[j] in T) then
            i := i+1;
            C[i] := B[j];
        fi;
    od;
    Info(InfoKS, 2, "C=", C);
    KSSteepestAscentTwoOpt(C, M);
    return [C, D];
end;

KSGeneticTSP := function(popsize, cmax, M, R)
    local c, P, cost, n, i, Xbest, BestCost, U, CurCost;
    c := 1;
    n := Length(M);
    P := KSSelect(popsize, M);
    cost := function(XX)
        local thecost;
        thecost := 0;
        for i in [1..n-1] do
            thecost := thecost + M[XX[i]][XX[i+1]];
        od;
        thecost := thecost + M[XX[1]][XX[n]];
        return thecost;
    end;
    SortBy(P, cost);
    Xbest := P[1];
    BestCost := cost(P[1]);
    Info(InfoKS, 1, "Xbest=", Xbest, ", BestCost=", BestCost);
    while c <= cmax do
        Info(InfoKS, 1, "Iteration:", c);
        for i in [1..Int(popsize/2)] do
            U := R(P[2*i-1], P[2*i], M);
            P[popsize+2*i-1] := U[1];
            P[popsize+2*i] := U[2];
        od;
        SortBy(P, cost);
        CurCost := cost(P[1]);
        if CurCost < BestCost then
            Xbest := P[1];
            BestCost := CurCost;
            Info(InfoKS, 1, "Found better route ", Xbest, " with cost ", 
                 BestCost);
        fi;
        c := c+1;
    od;
    return [Xbest, cost(Xbest)];
end;

KSMult := function(alpha, beta, gamma)
    local i, pi0, n;
    n := Length(alpha);
    pi0 := [];
    for i in [1..n] do
        pi0[i] := alpha[beta[i]];
    od;
    for i in [1..n] do
        gamma[i] := pi0[i];
    od;
    return;
end;

KSInv := function(alpha, beta)
    local i, n;
    n := Length(alpha);
    for i in [1..n] do
        beta[alpha[i]] := i;
    od;
    return;
end;

KSSimpleGen := function(n, Gamma)
    local G, New, Last, g, h, f;
    G := [];
    New := [[1..n]];
    f := [];
    while New <> [] do
        Info(InfoKS, 2, "New=",New, ", G=", G);
        G := Union(G, New);
        Last := New;
        New := [];
        for g in Gamma do
            for h in Last do
                KSMult(n, g, h, f);
                Info(InfoKS, 3, "g=", g, ", h=", h, ", f=", f);
                if not(f in G) then
                    New := Union(New, [ShallowCopy(f)]);
                fi;
            od;
        od;
    od;
    return G;
end;

KSTrivialSSR := function(n)
    local T, i, j;
    T := [];
    for i in [1..n] do
        T[i] := [];
        for j in [1..n] do
            T[i][j] := 0;
        od;
        T[i][i] := [1..n];
    od;
    return T;
end;

KSPrettySSR := function(T)
    local T2, i, n, pretty;
    pretty := function(u)
        if IsList(u) then
            return PermList(u);
        else
            return u;
        fi;
    end;
    n := Length(T);
    T2 := [];
    for i in [1..n] do
        T2[i] := List(T[i], pretty);
    od;
    return T2;
end;
                 
KSTest := function(g, T)
    local i, j, h, pi2, pi3, n, done;
    n := Length(g);
    pi2 := [];
    pi3 := [];
    i := 0;
    done := false;
    while i < n and not(done) do
        i := i+1;
        h := T[i][g[i]];
        if h <> 0 then
            KSInv(h, pi2);
            KSMult(pi2, g, pi3);
            for j in [1..n] do
                g[j] := pi3[j];
            od;
        else
            done := true;
        fi;
    od;
    return i;
end;

KSEnter := function (g, U)
    local i, j, h, f, n;
    n := Length(g);
    Info(InfoKS, 2, "g=", g, ", U=", U);
    f := [];
    i := KSTest(g, U);
    Info(InfoKS, 2, "i=", i);
    if i = n then
        return;
    else
        U[i][g[i]] := ShallowCopy(g);
    fi;
    for j in [1..i] do
        for h in U[j] do
            if h <> 0 and h <> [1..n] then
                KSMult(g, h, f);
                Info(InfoKS, 2, "g=", g, ", h=", h, ", f=", f);
                KSEnter(f, U);
            fi;
        od;
    od;
end;

KSGen := function(Gamma)
    local U, alpha, i, n;
    n := Length(Gamma[1]);
    U := KSTrivialSSR(n);
    for alpha in Gamma do
        KSEnter(alpha, U);
    od;
    return U;
end;

### no están en el libro

KSOrbit := function(i, Gamma)
    local perm, Delta, n, x;
    Delta := [i];
    for x in Delta do
        for perm in Gamma do
            if not(perm[x] in Delta) then
                Add(Delta, perm[x]);
            fi;
        od;
    od;
    return Delta;
end;

# KSRun := function(T, Use)
#     local 
