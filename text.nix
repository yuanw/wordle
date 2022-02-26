{ mkDerivation, array, base, binary, bytestring, containers
     , deepseq, directory, filepath, ghc-prim, QuickCheck, tasty
     , tasty-bench, tasty-hunit, tasty-inspection-testing
     , tasty-quickcheck, template-haskell, transformers, lib
     }:
     mkDerivation {
       pname = "text";
       version = "2.0";
       sha256 = "15pcs9wdd0jjh4k2qis1s8bny14s0x85nys9i25nwr4a6xxpi6fm";
       libraryHaskellDepends = [
         array base binary bytestring deepseq ghc-prim template-haskell
       ];
       testHaskellDepends = [
         base bytestring deepseq directory ghc-prim QuickCheck tasty
         tasty-hunit tasty-inspection-testing tasty-quickcheck
         template-haskell
       ];
       benchmarkHaskellDepends = [
         base bytestring containers deepseq directory filepath tasty-bench
         transformers
       ];
       doCheck = false;
       description = "An efficient packed Unicode text type";
       license = lib.licenses.bsd2;
       # hydraPlatforms = lib.platforms.none;
    }
