walks := function (n)
local walksaux, C, steps, walk, suma,valores, c;
    steps := [ [-1,0], [1,0], [0,1], [0,-1] ];
    C := [];                                                 
    walk := [];
    suma := [0, 0]; 
    c := 0;
    walksaux:=function( s )
        local x, p, j, k, a;
        if s = n+1 then
            Print("Walk ", walk, "\n");             
            C[s] := [];
            c := c+1;
        else
            C[s] := [];
            for p in [1..4] do
                a := true;
                j := 1;
                while a and j <= s do
                    suma := Sum(List([j..s-1], k -> walk[k])) + steps[p];
                    #Print("Walk so far: ", walk,", p=",p,", j=",j,", suma=",suma,"\n");
                    if suma = [0, 0] then
                        Print("Pruning!\n");
                        a := false;
                    fi;
                    j := j + 1;
                od;
                if a then
                    Add(C[s], steps[p]);
                fi;
            od;
        fi;
        for x in C[s] do
            walk[s] := x; 
            walk := walk{[1..s]};
            walksaux(s+1);
        od;
    end;
    if IsPosInt(n) then 
        walksaux(1);
    else
        Print("Needs a positive integer number.\n");
    fi;
    Print("Total self-avoiding walks of length ", n, ":  ", c, "\n");
    return;
end;
