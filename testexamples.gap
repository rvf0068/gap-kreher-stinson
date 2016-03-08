# Useful to test the examples in the documentation

RequirePackage("kreher-stinson");
path := Directory("./doc");;
main := "main.xml";;
files := [
           "../lib/generating.gd",
           "../lib/generating.gi",
           "../lib/backtracking.gd",
           "../lib/backtracking.gi",
           "../PackageInfo.g"];;

list:=ExtractExamples(path,"main.xml",files,"Subsection");;
#LogTo("examplestest.txt");
RunExamples(list);
#RunExamples(list,rec(compareFunction:="uptowhitespace"));
#RunExamples(list,rec(changeSources:=true));
#RunExamples(list,rec(changeSources:=true, compareFunction:="uptowhitespace"));
#LogTo();
