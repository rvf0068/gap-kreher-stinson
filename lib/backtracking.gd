#############################################################################
##
##
#W  backtracking.gd       kreher-stinson Package             
##
##  Declaration file for backtracking functions
##
#############################################################################

#F  KSCheckKnapsackInput( P, W, M ) 
##
##  <#GAPDoc Label="KSCheckKnapsackInput">
##  <ManSection>
##  <Func Name="KSCheckKnapsackInput" Arg="profits, weights, capacity"/>
##
##  <Description>
##  Checks for valid input data for the Knapsack problems (Problems 1.1-1.4).
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSCheckKnapsackInput" );

#F  KSKnapsack1( P, W, M ) 
##
##  <#GAPDoc Label="KSKnapsack1">
##  <ManSection>
##  <Func Name="KSKnapsack1" Arg="profits, weights, capacity"/>
##  <Description>
##  Implementation of Algorithm 4.1.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSKnapsack1" );

#F  KSKnapsack2( P, W, M ) 
##
##  <#GAPDoc Label="KSKnapsack2">
##  <ManSection>
##  <Func Name="KSKnapsack2" Arg="profits, weights, capacity"/>
##  <Description>
##  Implementation of Algorithm 4.3.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSKnapsack2" );

#F  KSAllCliques( G ) 
##
##  <#GAPDoc Label="KSAllCliques">
##  <ManSection>
##  <Func Name="KSAllCliques" Arg="graph"/>
##
##  <Description>
##  Implementation of Algorithm 4.4. A graph <M>G</M> is defined by
##  the list <A>graph</A>, which must be a list of subsets of
##  <M>\{1,...,n\}</M>, for some integer <M>n</M>. The neighbors of 
##  vertex <M>i</M> are the elements of <A>graph[i]</A>.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSAllCliques" );

#F  KSQueens( n ) 
##
##  <#GAPDoc Label="KSQueens">
##  <ManSection>
##  <Func Name="KSQueens" Arg="size"/>
##
##  <Description>
##  Solves the <M>n</M> queens problem for a
##  <M><A>size</A>\times<A>size</A></M> board.
##  <Example>
##  gap> KSQueens(4);
##  [ 2, 4, 1, 3 ]
##  [ 3, 1, 4, 2 ]
##  </Example>
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
##  Finds an subcollection of <A>cover</A> (which is a set of subsets of 
##  <M>\{1,..,<A>number</A>\}</M>) that is an exact cover of 
##  <M>\{1,..,<A>number</A>\}</M>, 
##  if it exists.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSExactCover" );

#F KSWalks( n )
##
##  
##  <#GAPDoc Label="KSWalks">
##  <ManSection>
##  <Func Name="KSWalks" Arg="number"/>
##
##  <Description>
##  Finds all the walks in the plane of lenght <M> n </M>.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSWalks" );

#F  KSSortForRationalKnapsack( P, W ) 
##
##  <#GAPDoc Label="KSSortForRationalKnapsack">
##  <ManSection>
##  <Func Name="KSSortForRationalKnapsack" Arg="profits, weights"/>
##
##  <Description>
##  Given two vectors <A>profits</A>, <A>weights</A> of the same
##  length, this function returns a vector of the two vectors, sorted
##  in non-decreasing order of values of
##  <M><A>profits[i]</A>/<A>weights[i]</A></M>. 
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSSortForRationalKnapsack" );

#F  KSRationalKnapsackSorted( P, W, M ) 
##
##  <#GAPDoc Label="KSRationalKnapsackSorted">
##  <ManSection>
##  <Func Name="KSRationalKnapsackSorted" Arg="profits, weights, capacity"/>
##
##  <Description>
##  Solves the rational Knapsack problem with parameters given. The
##  vectors <A>profits</A>, <A>weights</A> must already be sorted.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSRationalKnapsackSorted" );

#F  KSKnapsack3( P, W, M ) 
##
##  <#GAPDoc Label="KSKnapsack3">
##  <ManSection>
##  <Func Name="KSKnapsack3" Arg="profits, weights, capacity"/>
##
##  <Description>
##  Solves the Knapsack problem with parameters given, using the
##  function KSRationalKnapsackSorted as bounding function.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSKnapsack3" );

#F  KSRandomKnapsackInstance( n, Wmax ) 
##
##  <#GAPDoc Label="KSRandomKnapsackInstance">
##  <ManSection>
##  <Func Name="KSRandomKnapsackInstance" Arg="size, maximum_weight"/>
##
##  <Description>
##  Returns a random instance of a Knapsack problem, for <A>size</A>
##  objects. The maximum weight is <A>maximum_weight</A>. For each
##  <M>i</M>, the profit <M>P[i]</M> is <M>2*W[i]*\epsilon</M>, where
##  <M>\epsilon</M> is a random number between <M>0.9</M> and <M>1.1</M>.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSRandomKnapsackInstance" );

