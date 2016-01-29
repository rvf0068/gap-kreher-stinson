# after reading this, with, say
# Read("~/Dropbox/gaplocal/pkg/kreher-stinson/docsettings.gap");
# run
# MakeGAPDocDoc(path, main, files, bookname);;

path := Directory("~/Dropbox/gaplocal/pkg/kreher-stinson/doc");;
main := "main.xml";;
files := ["../lib/backtracking.gd", "../lib/backtracking.gi","../PackageInfo.g"];;
bookname := "rvf-grp";;

MakeGAPDocDoc(path, main, files, bookname);;
