KSKnapsack2:= function(P, W, M)
    local knapaux, n, x, XX, OptP, OptX, C;
    XX := [];
    C := [];
    OptP := 0;
    OptX := 0;
    n := Length(P);
    knapaux := function(l,CurW)
        if l = n+1 then
            Print("Checking ",XX,"\n");
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
end;


CuelloTriangulos:= function(M)
    local Ciclo, n, x, XX, OptP, OptX, C, CC;
    XX := [];
    CC := [];
    C := [];
    OptP := 0;
    OptX := 0;
    n:= Length(M[1]);    
    Ciclo := function(l)
        local CC;
        CC := [];        
        if l=0 then
            for j in [1..n] do
                CC[j] := j;
            od;            
        else
            for j in [1..n] do
                if M[j][XX[l]]<>0 and then
                    for i in [1..n] do
                        if M[j][i]<>0 and i<>XX[l] then
                            Add(CC,[j
]);
                        fi;
                    od;
                fi;
            od;
        fi;
        
                        
        
        if l = n+1 then
            Print("Checking ",XX,"\n");
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
        
        for x in C[l] do
            XX[l] := x;
            knapaux(l+1);
        od;
    end;

        Ciclo(1);
        Print("El cuello es",Length(XX)," \n");
    return;
end;
