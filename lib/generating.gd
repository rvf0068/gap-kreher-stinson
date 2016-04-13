#F  KSSubsetLexRank( n, T ) 
##
##  <#GAPDoc Label="KSSubsetLexRank">
##  <ManSection>
##  <Func Name="KSSubsetLexRank" Arg="number, subset"/>
##
##  <Description>
##  Returns the rank of <A>subset</A> as a subset of the set of 
##  numbers from 1 to <A>number</A> (Algorithm 2.1).
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
