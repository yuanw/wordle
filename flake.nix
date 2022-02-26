{
  description = "virtual environments";

  # TODO: Nixpkgs is switching to use GHC-9.0.2 as the default compiler as of
  # 2022-02-21, but the switch has currently only happened on the
  # haskell-updates branch.  This temporarily makes Termonad use that branch.
  # When https://github.com/NixOS/nixpkgs/pull/160733 is merged into master,
  # switch back to nixos-unstable.
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/haskell-updates";
  inputs.devshell.url = "github:numtide/devshell";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.gitignore = {
    url = "github:hercules-ci/gitignore.nix";
    # Use the same nixpkgs
    inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, devshell, flake-utils, gitignore }:

    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            devshell.overlay
            (final: prev: {
              haskellPackages = prev.haskellPackages.override {
                overrides = hself: hsuper: {
                  #random = hself.callPackage ./random.nix {};
                  hashable = hself.callPackage ./hashable.nix {};
                  text = hself.callPackage ./text1.nix {};
                  wordle = hself.callCabal2nix "wordle"
                    (gitignore.lib.gitignoreSource ./.) { };
                };
              };
              wordle = final.haskell.lib.justStaticExecutables
                final.haskellPackages.wordle;
            })
          ];
        };
        myHaskellEnv = (pkgs.haskellPackages.ghcWithHoogle
          (p: with p; [ wordle cabal-install ormolu hlint hpack brittany ] ++ pkgs.wordle.buildInputs));

      in {
        packages = { wordle = pkgs.wordle; };
        defaultPackage = pkgs.wordle;
        checks = self.packages;
        devShell = pkgs.devshell.mkShell {
          name = "wordle";
          imports = [ (pkgs.devshell.extraModulesDir + "/git/hooks.nix") ];
          git.hooks.enable = true;
          git.hooks.pre-commit.text = "${pkgs.treefmt}/bin/treefmt";
          packages = [ myHaskellEnv pkgs.treefmt pkgs.cabal2nix pkgs.nixfmt ];
        };
      });
}
