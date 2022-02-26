{ mkDerivation, array, base, binary, bytestring, containers
, deepseq, directory, filepath, ghc-prim, lib, QuickCheck, tasty
, tasty-bench, tasty-hunit, tasty-inspection-testing
, tasty-quickcheck, template-haskell, transformers
}:
mkDerivation {
  pname = "text";
  version = "2.0";
  sha256 = "d599787b378a646e8b88497b5b50079a046f17d241472c26815282d678d2ec96";
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
  homepage = "https://github.com/haskell/text";
  description = "An efficient packed Unicode text type";
  license = lib.licenses.bsd2;
}
