KSGainTSP := function(XX, i, j, M)
    local Y;
    Y := ShallowCopy(XX);
    #Add(Y, XX[1]);
    Y[Length(M)+1] := XX[1];
    return M[Y[i]][Y[i+1]] + M[Y[j]][Y[j+1]] - M[Y[i+1]][Y[j+1]] - M[Y[i]][Y[j]];
end;

KSSteepestAscentTwoOpt := function(XX, M)
    local done, g0, i0, j0, g, i, j, n, Y;
    n := Length(M);
    done := false;
    Y := ShallowCopy(XX);
    while not(done) do
        Info(InfoKS, 2, "Y=", Y);
        done := true;
        g0 := 0;
        for i in [1..n] do
            for j in [i+2..n] do
                Info(InfoKS, 3, "i=", i, ", j=", j);
                g := KSGainTSP(Y, i, j, M);
                Info(InfoKS, 3, "g=", g, ", g0=", g0);
                if g > g0 then
                    g0 := g;
                    i0 := i;
                    j0 := j;
                fi;
            od;
        od;
        if g0 > 0 then
            Y := Concatenation(Y{[1..i0]}, Y{[j0,j0-1..i0+1]}, Y{[j0+1..n]});
            Info(InfoKS, 2, "i0=", i0, ", j0=", j0);
            done := false;
        fi;
        for i in [1..n] do
            XX[i] := Y[i];
        od;
    od;
    return;
end;

testlist := function(l)
    l := Concatenation(l,["hi"]);
    #l[Length(l)+1] := "hi";
    Print(l,"\n");
    return;
end;

KSSelect := function (popsize, M)
    local r, i, P, n;
    n := Length(M);
    P := [];
    for i in [1..popsize] do
        r := Random(0, Factorial(n)-1);
        P[i] := ListPerm(KSPermLexUnrank(n, r), n);
        KSSteepestAscentTwoOpt(P[i], M);
    od;
    return P;
end;

KSPartiallyMatchedCrossover := function(n, alpha, beta, j, k)
    local gamma, delta, i, r, s;
    gamma := ShallowCopy(alpha);
    delta := ShallowCopy(beta);
    for i in [j..k] do
        Info(InfoKS, 2, "i=", i, ", gamma=", gamma, ", delta=", delta);
        if alpha[i] <> beta[i] then
            r := Position(gamma, alpha[i]);
            s := Position(gamma, beta[i]);
            gamma[r] := beta[i];
            gamma[s] := alpha[i];
            r := Position(delta, alpha[i]);
            s := Position(delta, beta[i]);
            delta[r] := beta[i];
            delta[s] := alpha[i];
        fi;
    od;
    return [gamma, delta];
end;

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

            
    
    
