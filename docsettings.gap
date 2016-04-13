# Useful to create GAP documentation of this package

path := Directory("./doc");;
main := "main.xml";;
files := [
           "../lib/generating.gd",
           "../lib/generating.gi",
           "../lib/backtracking.gd",
           "../lib/backtracking.gi",
           "../lib/heuristic.gd",
           "../lib/heuristic.gi",
           "../PackageInfo.g"];;
bookname := "kreher-stinson";;

MakeGAPDocDoc(path, main, files, bookname);;
