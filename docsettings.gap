# Useful to create GAP documentation of this package

path := Directory("./doc");;
main := "main.xml";;
files := ["../lib/backtracking.gd", "../lib/backtracking.gi","../PackageInfo.g"];;
bookname := "kreher-stinson";;

MakeGAPDocDoc(path, main, files, bookname);;
