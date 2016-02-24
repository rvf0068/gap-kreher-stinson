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
##  Returns the subset of 1..number whose rank is rank (Algorithm 2.2).
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "KSSubsetLexUnrank" );
