#############################################################################
##
##
#W  backtracking.gd       kreher-stinson Package             
##
##  Declaration file for backtracking functions
##
#############################################################################

#F  KSCheckKnapsackInput( K ) 
##
##  <#GAPDoc Label="KSCheckKnapsackInput">
##  <ManSection>
##  <Func Name="KSCheckKnapsackInput" Arg="K"/>
##
##  <Description>
##
##  Checks for valid input data for the Knapsack problems (Problems
##  1.1-1.4). <A>K</A> is a list, which first element is the vector of
##  profits, the second is the vector of weights, and the third is the
##  capacity of the knapsack, which must be an integer.
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSCheckKnapsackInput" );

#F  KSKnapsack1( K ) 
##
##  <#GAPDoc Label="KSKnapsack1">
##  <ManSection>
##  <Func Name="KSKnapsack1" Arg="K"/>
##
##  <Description>
##
##  Implementation of Algorithm 4.1. <A>K</A> is a list, which
##  elements are profits, weights, capacity.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSKnapsack1" );

#F  KSKnapsack2( K ) 
##
##  <#GAPDoc Label="KSKnapsack2">
##  <ManSection>
##  <Func Name="KSKnapsack2" Arg="K"/>
##  <Description>
##
##  Implementation of Algorithm 4.3. <A>K</A> is a list, which
##  elements are profits, weights, capacity.
##
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
##  <M><A>size</A>\times<A>size</A></M> board. (Exercise 4.1.(a))
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

#F  KSRandomSubsetOfSubsets( n, delta ) 
##
##  <#GAPDoc Label="KSRandomSubsetOfSubsets">
##  <ManSection>
##  <Func Name="KSRandomSubsetOfSubsets" Arg="n, delta"/>
##
##  <Description>
##
##  Generates a random subset of the set of all subsets of
##  <M>\{1..<A>n</A>\}</M>, with density <A>delta</A>. This can be
##  used as an instance of the ExactCover problem.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSRandomSubsetOfSubsets" );


#F KSWalks( n )
##
##  <#GAPDoc Label="KSWalks">
##  <ManSection>
##  <Func Name="KSWalks" Arg="number"/>
##
##  <Description>
##
##  Finds all non-overlapping walks in the plane of length
##  <A>number</A>. (Exercise 4.1.(b))
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSWalks" );

#F  KSSortForRationalKnapsack( K ) 
##
##  <#GAPDoc Label="KSSortForRationalKnapsack">
##  <ManSection>
##  <Func Name="KSSortForRationalKnapsack" Arg="K"/>
##
##  <Description>
##
##  Given an instance <A>K</A> of the Knapsack Problem, where the two
##  first components of <A>K</A> represent profits and weights, this
##  function returns a list, where the first component is the same
##  instance of the problem, but the profits and weights have been
##  sorted in non-increasing order of values of
##  <M><A>profits[i]</A>/<A>weights[i]</A></M>. The second component
##  is the permutation applied to the original problem.
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSSortForRationalKnapsack" );

#F  KSRationalKnapsackSorted( K ) 
##
##  <#GAPDoc Label="KSRationalKnapsackSorted">
##  <ManSection>
##  <Func Name="KSRationalKnapsackSorted" Arg="K"/>
##
##  <Description>
##
##  Solves the rational Knapsack problem for the instance
##  <A>K</A>. Profits and weights must be sorted in non-increasing
##  order of values of <M><A>profits[i]</A>/<A>weights[i]</A></M>.
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSRationalKnapsackSorted" );

#F  KSRationalKnapsack( K ) 
##
##  <#GAPDoc Label="KSRationalKnapsack">
##  <ManSection>
##  <Func Name="KSRationalKnapsack" Arg="K"/>
##
##  <Description>
##
##  Solves the rational Knapsack problem for the instance
##  <A>K</A>. 
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSRationalKnapsack" );

#F  KSKnapsack3( K ) 
##
##  <#GAPDoc Label="KSKnapsack3">
##  <ManSection>
##  <Func Name="KSKnapsack3" Arg="K"/>
##
##  <Description>
##
##  Solves the Knapsack problem for the instace <A>K</A>, using the
##  function KSRationalKnapsack as bounding function.
##
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

#F  KSRandomTSPInstance( n, Wmax ) 
##
##  <#GAPDoc Label="KSRandomTSPInstance">
##  <ManSection>
##  <Func Name="KSRandomTSPInstance" Arg="n, Wmax"/>
##
##  <Description>
##
##  Returns a random instance of the TSP problem, which is a symmetric
##  <A>n</A> by <A>n</A> matrix, such that its <M>ij</M> entry is the
##  cost to travel from city <M>i</M> to city <M>j</M>. The entries in
##  the diagonal are made equal to <M>\infty</M>. Each cost is a
##  random integer between 1 and <A>Wmax</A>.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSRandomTSPInstance" );

#F  KSTSP1( G ) 
##
##  <#GAPDoc Label="KSTSP1">
##  <ManSection>
##  <Func Name="KSTSP1" Arg="G"/>
##
##  <Description>
##
##  Solves the TSP problem, for the instance <A>G</A>, traversing the
##  whole tree space.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSTSP1" );

#F  KSMinCostBound( V, G ) 
##
##  <#GAPDoc Label="KSMinCostBound">
##  <ManSection>
##  <Func Name="KSMinCostBound" Arg="V, G"/>
##
##  <Description>
##
##  A bounding function for the TSP problem.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSMinCostBound" );

#F  KSReduce( M ) 
##
##  <#GAPDoc Label="KSReduce">
##  <ManSection>
##  <Func Name="KSReduce" Arg="M"/>
##
##  <Description>
##
##  Reduce function for matrices, which will be useful to implement a
##  secound bounding function for the TSP problem.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSReduce" );

#F  KSReduceBound( V, M ) 
##
##  <#GAPDoc Label="KSReduceBound">
##  <ManSection>
##  <Func Name="KSReduceBound" Arg="V, M"/>
##
##  <Description>
##
##  A second bounding function for the TSP problem. <A>V</A> is a
##  partial solution, and <A>M</A> is the problem instance. This
##  implements Algorithm 4.12.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSReduceBound" );

#F  KSTSP2( G, F ) 
##
##  <#GAPDoc Label="KSTSP2">
##  <ManSection>
##  <Func Name="KSTSP2" Arg="G, F"/>
##
##  <Description>
##
##  Solves the TSP problem for instance <A>G</A>, using the bounding
##  function <A>F</A>.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSTSP2" );

#F  KSMaxClique1( G ) 
##
##  <#GAPDoc Label="KSMaxClique1">
##  <ManSection>
##  <Func Name="KSMaxClique1" Arg="G"/>
##
##  <Description>
##
##  Adapts the function that lists the complete subgraphs of <A>G</A>,
##  to find the size of the largest clique of <A>G</A>. This
##  implements Algorithm 4.14.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSMaxClique1" );

#F  KSMaxClique2( G, F ) 
##
##  <#GAPDoc Label="KSMaxClique2">
##  <ManSection>
##  <Func Name="KSMaxClique2" Arg="G, F"/>
##
##  <Description>
##
##  Finds the size of the maximum clique in the graph <A>G</A>, using
##  the bounding function <A>F</A>. This implements Algorithm 4.19.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSMaxClique2" );

#F  KSSizeBound( XX, G, Cl ) 
##
##  <#GAPDoc Label="KSSizeBound">
##  <ManSection>
##  <Func Name="KSSizeBound" Arg="XX, G, Cl"/>
##
##  <Description>
##
##  A bounding function for the MaxClique problem. <A>XX</A> is a
##  complete subgraph of <A>G</A>, and <A>Cl</A> is the set of
##  candidates to extend <A>XX</A>.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSSizeBound" );

#F  KSGenerateRandomGraph( n ) 
##
##  <#GAPDoc Label="KSGenerateRandomGraph">
##  <ManSection>
##  <Func Name="KSGenerateRandomGraph" Arg="n"/>
##
##  <Description>
##
##  Returns a list of edges of a random graph on <A>n</A>
##  vertices. This implements Algorithm 4.20.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSGenerateRandomGraph" );

#F  KSEdgeListToAdjacencyList( Ged, n ) 
##
##  <#GAPDoc Label="KSEdgeListToAdjacencyList">
##  <ManSection>
##  <Func Name="KSEdgeListToAdjacencyList" Arg="Ged, n"/>
##
##  <Description>
##
##  Given the list of edges <A>Ged</A> of a graph with <A>n</A>
##  vertices, returns the adjacency list of such graph.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSEdgeListToAdjacencyList" );

#F  KSGreedyColor( G ) 
##
##  <#GAPDoc Label="KSGreedyColor">
##  <ManSection>
##  <Func Name="KSGreedyColor" Arg="G"/>
##
##  <Description>
##
##  Colors the vertices of a graph <A>G</A> using a greedy
##  strategy. This implements Algorithm 4.16.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSGreedyColor" );

#F  KSSamplingBound( XX, G, Cl ) 
##
##  <#GAPDoc Label="KSSamplingBound">
##  <ManSection>
##  <Func Name="KSSamplingBound" Arg="XX, G, Cl"/>
##
##  <Description>
##
##  A bounding function for the MaxClique problem. <A>XX</A> is a
##  complete subgraph of <A>G</A>, and <A>Cl</A> is the set of
##  candidates to extend <A>XX</A>. This function uses a fixed greedy
##  coloring of the graph <A>G</A>. Implements Algorithm 4.17.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSSamplingBound" );

#F  KSInducedSubgraph( G, L ) 
##
##  <#GAPDoc Label="KSInducedSubgraph">
##  <ManSection>
##  <Func Name="KSInducedSubgraph" Arg="G, L"/>
##
##  <Description>
##
##  Returns the adjacency list of the subgraph of <A>G</A> induced by
##  the vertices in <A>L</A>.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSInducedSubgraph" );

#F  KSGreedyBound( XX, G, Cl ) 
##
##  <#GAPDoc Label="KSGreedyBound">
##  <ManSection>
##  <Func Name="KSGreedyBound" Arg="XX, G, Cl"/>
##
##  <Description>
##
##  A bounding function for the MaxClique problem. <A>XX</A> is a
##  complete subgraph of <A>G</A>, and <A>Cl</A> is the set of
##  candidates to extend <A>XX</A>. This uses a greedy coloring of the
##  subgraph of <A>G</A> induced by <A>L</A>.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSGreedyBound" );

#F  KSGenerateRandomGraph2( n, delta ) 
##
##  <#GAPDoc Label="KSGenerateRandomGraph2">
##  <ManSection>
##  <Func Name="KSGenerateRandomGraph2" Arg="n, delta"/>
##
##  <Description>
##
##  Returns the list of edges of a random graph on <A>n</A> vertices
##  with edge density <A>delta</A>.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSGenerateRandomGraph2" );

#F  KSTSP3( G, F ) 
##
##  <#GAPDoc Label="KSTSP3">
##  <ManSection>
##  <Func Name="KSTSP3" Arg="G, F"/>
##
##  <Description>
##
##  Solves the TSP problem for instance <A>G</A>, using bounding
##  function <A>F</A>, applying the branch and bound technique.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSTSP3" );
