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


