SetPackageInfo( rec(
  PackageName := "kreher-stinson",
  Version := "1.0",
  PackageDoc := rec(
      BookName  := "test",
      SixFile   := "doc/manual.six",
      Autoload  := true ),
  Dependencies := rec(
      GAP       := "4.5",
      NeededOtherPackages := [ ["GAPDoc", "1.3"] ],
      SuggestedOtherPackages := [ ] ),
  AvailabilityTest := ReturnTrue ) );
