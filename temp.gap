KSWalks :=function(n)
local walksaux, C, steps, walk, x, s, p, i, j, k, a, suma,valores, c;
      steps:=[[-1,0],[1,0],[0,1],[0,-1]];
      C:=[[]];                                                 
      walk:=[[]];
      suma:=[0,0]; 
      valores:=[];
      c:=0;
      walksaux:=function( s )
          if s=n+1 then
              Print("Walk", walk, "\n");             
              C[s]:=[];
              c:=c+1;
          else
              C[s]:=[];
              suma:=[0,0];
              for i in [1..s] do
                  valores:=[];
                  C[s]:=[];
                  a:=0;
                  for p in [1..4] do
                      for j in [1..i] do
                          suma :=Sum(List([1..j-1], k -> Reversed(walk)[k])) + steps[p];
                          if suma=[0,0] then
                              a:=0;
                              Print("Pruning! \n");
                              break;
                          else
                              a:=1;
                          fi;
                      od; 
                      if a=1 then 
                          Add(valores,p);
                      fi;
                      suma:=[0,0];
                  od;   
              od;
                  for x in valores do
                      Add(C[s], steps[x]);
                  od;                   
          fi;
          for x in C[s] do
              walk[s] :=x; 
              walk :=walk{[1..s]};
              walksaux(s+1);
          od;
      end;
      if IsPosInt(n) then 
          walksaux(1);
      else
          Print("Needs a positive integer number \n");
      fi;
      Print("Total self-avoiding walks of length ", n, ":  ", c, "\n");
      return;
end;
