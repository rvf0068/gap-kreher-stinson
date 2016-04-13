#############################################################################
##
#W    init.g            GAP package 'kreher-stinson'
##

############################################################################
##
#I InfoClass
##
DeclareInfoClass( "InfoKS" );

#############################################################################
##
#D Read .gd files
##
ReadPackage( "kreher-stinson", "lib/generating.gd" );
ReadPackage( "kreher-stinson", "lib/backtracking.gd" );
ReadPackage( "kreher-stinson", "lib/heuristic.gd" );
