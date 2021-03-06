#F  KSRandomkSubset( k, n ) 
##
##  <#GAPDoc Label="KSRandomkSubset">
##  <ManSection>
##  <Func Name="KSRandomkSubset" Arg="k, n"/>
##
##  <Description>
##
##  Returns a randomly chosen <A>k</A>-subset of the set of integers
##  from 1 to <A>n</A>.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSRandomkSubset" );

#F  KSSelectPartition( n ) 
##
##  <#GAPDoc Label="KSSelectPartition">
##  <ManSection>
##  <Func Name="KSSelectPartition" Arg="n"/>
##
##  <Description>
##
##  Returns a random partition of the set <M>\{1,2,\ldots,2n\}</M>
##  into two subsets of size <A>n</A> each. (Algorithm 5.7)
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSSelectPartition" );

#F  KSCost( G, P ) 
##
##  <#GAPDoc Label="KSCost">
##  <ManSection>
##  <Func Name="KSCost" Arg="G, P"/>
##
##  <Description>
##
##  Returns the cost of the partition <A>P</A> of the vertices of the
##  weighted graph <A>G</A>.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSCost" );

#F  KSGain( G, P, u, v ) 
##
##  <#GAPDoc Label="KSGain">
##  <ManSection>
##  <Func Name="KSGain" Arg="G, P, u, v"/>
##
##  <Description>
##
##  <A>P</A> is a partition in equal parts of the vertices of
##  <A>G</A>. This function calculates the change in the value of the
##  cost function when interchanging the vertex <A>u</A> from the
##  first set in the partition <A>P</A> with the vertex <A>v</A> which
##  is in the second set of the partition.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSGain" );

#F  KSRandomCostMatrix( n, Wmax ) 
##
##  <#GAPDoc Label="KSRandomCostMatrix">
##  <ManSection>
##  <Func Name="KSRandomCostMatrix" Arg="n, Wmax"/>
##
##  <Description>
##
##  Returns a symmetric <A>n</A> by <A>n</A> matrix, such that its
##  entries are random integers from 0 to <A>Wmax</A>, and with zeros
##  in the main diagonal.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSRandomCostMatrix" );

#F  KSAscend( G, P ) 
##
##  <#GAPDoc Label="KSAscend">
##  <ManSection>
##  <Func Name="KSAscend" Arg="G, P"/>
##
##  <Description>
##
##  Given a partition <A>P</A> of the vertices of the weighted graph
##  <A>G</A>, it returns a partition <A>Q</A> with less cost than
##  <A>P</A>, by exchanging one vertex of the partition, if such
##  partition exists. Otherwise, returns the same partition <A>P</A>.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSAscend" );

#F  KSUGP( G, cmax ) 
##
##  <#GAPDoc Label="KSUGP">
##  <ManSection>
##  <Func Name="KSUGP" Arg="G, cmax"/>
##
##  <Description>
##
##  Solves the uniform graph partition for the weighted graph
##  <A>G</A>, by applying a hill-climbing algorithm for atmost
##  <A>cmax</A> iterations.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSUGP" );

#F  KSConstructBlocks( v, other ) 
##
##  <#GAPDoc Label="KSConstructBlocks">
##  <ManSection>
##  <Func Name="KSConstructBlocks" Arg="v, other"/>
##
##  <Description>
##
##  Constructs a list of blocks of length <A>v</A> from the list of
##  lists <A>other</A>. (Algorithm 5.12)
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSConstructBlocks" );

#F  KSRevisedStinsonAlgorithm( v ) 
##
##  <#GAPDoc Label="KSRevisedStinsonAlgorithm">
##  <ManSection>
##  <Func Name="KSRevisedStinsonAlgorithm" Arg="v"/>
##
##  <Description>
##
##  Constructs a Steiner triple system with <A>v</A> points, using a
##  hill-climbing algorithm. Implements Algorithm 5.19.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSRevisedStinsonAlgorithm" );

#F  KSKnapsackSimulatedAnnealing( K, cmax, T0, alpha ) 
##
##  <#GAPDoc Label="KSKnapsackSimulatedAnnealing">
##  <ManSection>
##  <Func Name="KSKnapsackSimulatedAnnealing" Arg="K, cmax, T0, alpha"/>
##
##  <Description>
##
##  Implements Algorithm 5.20. <A>K</A> is the instance of the
##  Knapsack problem to solve. <A>cmax</A> is the number of iterations
##  to be done. <A>T0</A> is the initial "temperature" and
##  <A>alpha</A> is the parameter of the "cooling schedule".
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSKnapsackSimulatedAnnealing" );

#F  KSRandomFeasibleSolutionKnapsack( K ) 
##
##  <#GAPDoc Label="KSRandomFeasibleSolutionKnapsack">
##  <ManSection>
##  <Func Name="KSRandomFeasibleSolutionKnapsack" Arg="K"/>
##
##  <Description>
##
##  Returns a randomly chosen feasible solution to the Knapsack
##  problem instance <A>K</A>.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSRandomFeasibleSolutionKnapsack" );

#F  KSKnapsackTabuSearch( K, cmax, L ) 
##
##  <#GAPDoc Label="KSKnapsackTabuSearch">
##  <ManSection>
##  <Func Name="KSKnapsackTabuSearch" Arg="K, cmax, L"/>
##
##  <Description>
##
##  Searches for an optimal solution to the Knapsack problem instance
##  <A>K</A> using a tabu search list. <A>cmax</A> is the maximum
##  number of iterations, and <A>L</A> the length of iterations a tabu
##  search should be kept.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSKnapsackTabuSearch" );

#F  KSGainTSP( XX, i, j, M ) 
##
##  <#GAPDoc Label="KSGainTSP">
##  <ManSection>
##  <Func Name="KSGainTSP" Arg="XX, i, j, M"/>
##
##  <Description>
##
##  Gain function for the Traveling Salesman Problem.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSGainTSP" );

#F  KSSteepestAscentTwoOpt( XX, M ) 
##
##  <#GAPDoc Label="KSSteepestAscentTwoOpt">
##  <ManSection>
##  <Func Name="KSSteepestAscentTwoOpt" Arg="XX, M"/>
##
##  <Description>
##
##  Given an instance of the TSP problem <A>M</A>, and an initial
##  permutation <M>XX</M>, applies steepest ascent heuristic.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSSteepestAscentTwoOpt" );

#F  KSSelect( popsize, M ) 
##
##  <#GAPDoc Label="KSSelect">
##  <ManSection>
##  <Func Name="KSSelect" Arg="popsize, M"/>
##
##  <Description>
##
##  Returns a population of size <A>popsize</A> for the TSP problem <A>M</A>.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSSelect" );

#F  KSPartiallyMatchedCrossover( n, alpha, beta, j, k ) 
##
##  <#GAPDoc Label="KSPartiallyMatchedCrossover">
##  <ManSection>
##  <Func Name="KSPartiallyMatchedCrossover" Arg="n, alpha, beta, j, k"/>
##
##  <Description>
##
##  One way to obtain two new permutations from permutations
##  <A>alpha</A>, <A>beta</A>.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSPartiallyMatchedCrossover" );
