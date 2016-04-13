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
