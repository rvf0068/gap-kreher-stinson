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
##  <Func Name="KSSubsetLexUnrank" Arg="n, r"/>
##
##  <Description> Returns the subset of <M>\{1..<A>n</A>\}</M> whose
##  rank is <A>r</A>. (Algorithm 2.2). The number <M>r</M> has to be
##  greater than <M>0</M> and less than <M>2^n-1</M>.
##  <Example>
##  gap> KSSubsetLexUnrank(4,14);
##  [ 1, 2, 3 ]
##  gap> KSSubsetLexUnrank(4,5);
##  [ 2, 4 ]
##  gap> KSSubsetLexUnrank(4,0);
##  [  ]
##  gap> KSSubsetLexUnrank(4,15);
##  [ 1, 2, 3, 4 ]
##  gap> KSSubsetLexUnrank(4,17);
##  Error, there is no subset of [1 ..4] of rank 17
##  </Example>
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
##  Finds the rank of <A>T</A>, among all <A>k</A>-subsets of
##  <M>\{1,2,\ldots,n\}</M>.  If <A>T</A> is not a <A>k</A>-subset of
##  <M>\{1,2,\ldots,n\}</M>, then an error is produced.
##
##  <Example>
##  gap> KSkSubsetLexRank([1,2,3],3,5);
##  0
##  gap> KSkSubsetLexRank([1,3,4],3,5);
##  3
##  gap> KSkSubsetLexRank([3,4,5],3,5);
##  9
##  gap> KSkSubsetLexRank([1,2,3,4],3,5);
##  Error, the set [ 1, 2, 3, 4 ] is not a 3-subset of [1 .. 5]
##  gap> KSkSubsetLexRank([1,3,6],3,5);
##  Error, the set [ 1, 3, 6 ] is not a 3-subset of [1 .. 5]
##  </Example>
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
##  <Example>
##  gap> KSkSubsetLexUnrank(0,3,5);
##  [ 1, 2, 3 ]
##  gap> KSkSubsetLexUnrank(3,3,5);
##  [ 1, 3, 4 ]
##  gap> KSkSubsetLexUnrank(9,3,5);
##  [ 3, 4, 5 ]
##  gap> KSkSubsetLexUnrank(-1,3,5);
##  Error, there is no 3-subset of [1 .. 5] of rank -1
##  gap> KSkSubsetLexUnrank(10,3,5);
##  Error, there is no 3-subset of [1 .. 5] of rank 10
##  </Example>
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
##  <Example>
##  gap> KSPermLexRank(5,(1,2,3));
##  30
##  gap> KSPermLexRank(5,(1,3)(2,4));
##  60
##  gap> KSPermLexRank(5,(1,2,6));
##  Error, (1,2,6) is not a permutation of [1 .. 5]
##  </Example>
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
##  <A>r</A>. (Algorithm 2.16) The number <M>r</M> must satisfy
##  <M>0\le r\le n!-1</M>.
##  <Example>
##  gap> KSPermLexUnrank(5,30);
##  (1,2,3)
##  gap> KSPermLexUnrank(5,60);
##  (1,3)(2,4)
##  gap> KSPermLexUnrank(5,130);
##  Error, there is no permutation of [1 .. 5] of rank 130
##  </Example>
##  
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSPermLexUnrank" );
