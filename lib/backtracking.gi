#############################################################################
##
##
#W  backtracking.gi       kreher-stinson Package             
##
##  Installation file for backtracking functions
##
#############################################################################

#F  Knapsack1( <P>, <W>, <M> ) 
##
InstallGlobalFunction(Knapsack1, function(P, W, M)
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
    knapaux(0);
    Print("Maximum profit is ",OptP," with vector ",OptX,"\n");
    return;
end );

