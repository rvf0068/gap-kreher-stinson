KSRandomKnapsackInstance := function(n,Wmax)
    local P, W, M, i, epsilon;
    P := [];
    W := [];
    epsilon := 0.9 + (0.2/100)*(Random(GlobalMersenneTwister,[1..100]) - 1);
    for i in [1..n] do
        W[i] := Random(GlobalMersenneTwister, [1..Wmax]);
        P[i] := Int(2*epsilon*W[i]);
    od;
    M := Int(Sum(W) / 2);
    return [P, W, M];
end;


                 
                                           
