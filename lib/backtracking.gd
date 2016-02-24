#############################################################################
##
##
#W  backtracking.gd       kreher-stinson Package             
##
##  Declaration file for backtracking functions
##
#############################################################################

#F  CheckKnapsackInput( <P>, <W>, <M> ) 
##
##  <#GAPDoc Label="CheckKnapsackInput">
##  <ManSection>
##  <Func Name="CheckKnapsackInput" Arg="profits, weights, capacity"/>
##
##  <Description>
##  Checks for valid input data for the Knapsack problems (Problems 1.1-1.4).
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "CheckKnapsackInput" );

#F  Knapsack1( <P>, <W>, <M> ) 
##
##  <#GAPDoc Label="Knapsack1">
##  <ManSection>
##  <Func Name="Knapsack1" Arg="profits, weights, capacity"/>
##  <Description>
##  Implementation of Algorithm 4.1.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "Knapsack1" );

#F  Knapsack2( <P>, <W>, <M> ) 
##
##  <#GAPDoc Label="Knapsack2">
##  <ManSection>
##  <Func Name="Knapsack2" Arg="profits, weights, capacity"/>
##  <Description>
##  Implementation of Algorithm 4.3.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "Knapsack2" );

#F  KSAllCliques( <G> ) 
##
##  <#GAPDoc Label="KSAllCliques">
##  <ManSection>
##  <Func Name="KSAllCliques" Arg="graph"/>
##
##  <Description>
##  Implementation of Algorithm 4.4.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSAllCliques" );

#F  KSQueens( n ) 
##
##  <#GAPDoc Label="KSQueens">
##  <ManSection>
##  <Func Name="KSQueens" Arg="Size of board"/>
##
##  <Description>
##  Solves the <M>n</M> queens problem.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSQueens" );

#F  KSExactCover( n, S ) 
##
##  <#GAPDoc Label="KSExactCover">
##  <ManSection>
##  <Func Name="KSExactCover" Arg="number,cover"/>
##
##  <Description>
##  Finds an subcollection of <M>S</M> (which is a set of subsets of 
##  <M>\{1,..,n\}</M>) that is an exact cover of <M>\{1,..,n\}</M>, 
##  if it exists.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSExactCover" );
