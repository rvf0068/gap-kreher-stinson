ReducedLatinSquares := function(n)
    local latin, XX, sols, g, C, Good, Bad;
    XX := [()];
    sols := [];
    C := [];
    g := SymmetricGroup(n);
    latin := function(l)
        local x, valid, BadNow;
        valid := function()
            local i, j, s, h;
            if l = 1 then
                for j in [1..n] do
                    Bad := Union(Bad, Elements(Stabilizer(g,j)));
                od;
            else
                s := XX[l];
                for j in [1..n] do
                    h := Stabilizer(g,j);
                    Bad := Union(Bad, Elements(RightCoset(h,(j,j^s))));
                od;
            fi;
            Good := Difference(Good, Bad);
            BadNow := Filtered(Good, x -> 1^x<>(l+1));
            return Difference(Good, BadNow);
        end;
        if l = n then
            Add(sols, ShallowCopy(XX));
        fi;
        C[l+1] := valid();
        for x in C[l+1] do
            XX[l+1] := x;
            XX := XX{[1..l+1]};
            latin(l+1);
        od;      
    end;
    Good := Elements(g);
    Bad := [];
    latin(1);
    return sols;
end;

PrintLatinSquare := function(sq)
    local n;
    n := Length(sq);
    Display(List(sq,x->List([1..n],y->y^x)));
end;

AllLatinSquares := function(n)
    local latin, XX, sols, C;
    XX := [];
    sols := [];
    C := [];
    latin := function(l)
        local x, valid, Good, Bad;
        valid := function()
            local i, badindices;
            badindices := function()
                local row, col, i, BadI, XX;
                BadI := [];
                col := l mod n;
                if col = 0 then
                    col := n;
                fi;
                row := (l-col)/n+1;
                for i in [n*(row-1)+1..l-1] do
                    BadI := Union(BadI, [i]);
                od;
                for i in [col,col+n..l-n] do
                    BadI := Union(BadI, [i]);
                od;
                return BadI;
            end;
            Good := [1..n];
            Bad := [];
            for i in badindices() do
                Bad := Union(Bad, [XX[i]]);
            od;
            Good := Difference(Good, Bad);
            #Print("l:= ",l,", Good: ",Good,", Bad: ", Bad, "\n");
            return Good;
        end;
        if l = n^2+1 then
            Add(sols, ShallowCopy(XX));
        fi;
        C[l] := valid();
        for x in C[l] do
            XX[l] := x;
            XX := XX{[1..l]};
            latin(l+1);
        od;
    end;
    latin(1);
    return sols;
end;

ReducedLatinSquaresTwo := function(n)
    local latin, XX, sols, C;
    XX := [];
    sols := [];
    C := [];
    latin := function(l)
        local x, valid, Good, Bad;
        valid := function()
            local i, badindices, row, col;
            badindices := function()
                local i, BadI, XX;
                BadI := [];
                for i in [n*(row-1)+1..l-1] do
                    BadI := Union(BadI, [i]);
                od;
                for i in [col,col+n..l-n] do
                    BadI := Union(BadI, [i]);
                od;
                return BadI;
            end;
            col := l mod n;
            if col = 0 then
                col := n;
            fi;
            row := (l-col)/n+1;
            if row = 1 then
                return [l-1];
            fi;
            if col = 1 then
                return [row-1];
            fi;
            Good := [0..n-1];
            Bad := [];
            for i in badindices() do
                Bad := Union(Bad, [XX[i]]);
            od;
            Good := Difference(Good, Bad);
            #Print("l:= ",l,", Good: ",Good,", Bad: ", Bad, "\n");
            return Good;
        end;
        if l = n^2+1 then
            Add(sols, ShallowCopy(XX));
        fi;
        C[l] := valid();
        for x in C[l] do
            XX[l] := x;
            XX := XX{[1..l]};
            latin(l+1);
        od;
    end;
    latin(1);
    return sols;
end;

