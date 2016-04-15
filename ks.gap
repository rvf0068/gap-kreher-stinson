LoadPackage("kreher-stinson");
SetInfoLevel(InfoKS, 2);
Read("temp.gap");

K := KSRandomKnapsackInstance(5,100);
G := KSEdgeListToAdjacencyList(KSGenerateRandomGraph(10),10);
G2 := KSEdgeListToAdjacencyList(KSGenerateRandomGraph2(100,0.2),100);
T := KSRandomTSPInstance(30,50);

cov := [[1,2,3],[1,2],[3,4,6],[1,5,6],[4],[1,3,5],[4,6],[2,5],[2]];
