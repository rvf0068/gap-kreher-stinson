SetPackageInfo( rec(
  PackageName := "kreher-stinson",
  Version := "1.0",
##  <#GAPDoc Label="PKGVERSIONDATA">
##  <!ENTITY VERSION "0.1">
##  <!ENTITY RELEASEDATE "8 April 2016">
##  <#/GAPDoc>

  PackageDoc := rec(
      BookName  := "kreher-stinson",
      SixFile   := "doc/manual.six",
      Autoload  := true ),
  Dependencies := rec(
      GAP       := "4.5",
      NeededOtherPackages := [ ["GAPDoc", "1.3"] ],
      SuggestedOtherPackages := [ ] ),
  AvailabilityTest := ReturnTrue ) );
