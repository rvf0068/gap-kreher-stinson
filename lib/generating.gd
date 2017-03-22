#F  KSSubsetLexRank( n, T ) 
##
##  <#GAPDoc Label="KSSubsetLexRank">
##  <ManSection>
##  <Func Name="KSSubsetLexRank" Arg="n, T"/>
##
##  <Description> 
##  Returns the rank of <A>T</A> as a subset of the set
##  of numbers from 1 to <A>n</A> (Algorithm 2.1). An error is
##  produced if <A>T</A> is not a subset of the set <M>\{1..n\}</M>.
##  <Example>
##  gap> KSSubsetLexRank(4,[1,2,3]);
##  14
##  gap> KSSubsetLexRank(4,[2,4]);
##  5
##  gap> KSSubsetLexRank(4,[]);
##  0
##  gap> KSSubsetLexRank(4,[1,2,3,4]);
##  15
##  gap> KSSubsetLexRank(4,[1,2,3,4,5]);
##  Error, the set [ 1, 2, 3, 4, 5 ] is not a subset of [1 ..4]
##  </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSSubsetLexRank" );

#F  KSSubsetLexUnrank( n,r ) 
##
##  <#GAPDoc Label="KSSubsetLexUnrank">
##  <ManSection>
##  <Func Name="KSSubsetLexUnrank" Arg="number, rank"/>
##
##  <Description>
##  Returns the subset of <M>\{1..<A>number</A>\}</M> whose rank 
##  is <A>rank</A>. (Algorithm 2.2).
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSSubsetLexUnrank" );

#F  KSkSubsetLexRank( T, k, n ) 
##
##  <#GAPDoc Label="KSkSubsetLexRank">
##  <ManSection>
##  <Func Name="KSkSubsetLexRank" Arg="T, k, n"/>
##
##  <Description>
##
##  Finds the rank of <A>T</A>, among all <A>k</A>-subsets of an
##  <A>n</A>-set.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSkSubsetLexRank" );

#F  KSkSubsetLexUnrank( r, k, n ) 
##
##  <#GAPDoc Label="KSkSubsetLexUnrank">
##  <ManSection>
##  <Func Name="KSkSubsetLexUnrank" Arg="r, k, n"/>
##
##  <Description>
##
##  Given an integer <A>r</A> between 0 and <M>{n \choose k}-1</M>,
##  returns the <A>k</A>-subset of an <A>n</A>-set with rank <A>r</A>.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSkSubsetLexUnrank" );

#F  KSPermLexRank( n, pi ) 
##
##  <#GAPDoc Label="KSPermLexRank">
##  <ManSection>
##  <Func Name="KSPermLexRank" Arg="n, pi"/>
##
##  <Description>
##
##  Given a permutation <A>pi</A> of <M>\{1..<A>n</A>\}</M>, returns
##  the rank of <A>pi</A>. (Algorithm 2.15)
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSPermLexRank" );

#F  KSPermLexUnrank( n, r ) 
##
##  <#GAPDoc Label="KSPermLexUnrank">
##  <ManSection>
##  <Func Name="KSPermLexUnrank" Arg="n, r"/>
##
##  <Description>
##
##  Returns the permutation of <M>\{1..<A>n</A>\}</M> with rank
##  <A>r</A>. (Algorithm 2.16)
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSPermLexUnrank" );
