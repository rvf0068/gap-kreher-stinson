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
