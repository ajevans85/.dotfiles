{
  allowUnfree = true;

  packageOverrides = super: let self = super.pkgs; in with self; rec {
    haskellPackages = super.haskellPackages.override {
      overrides = self: super: with haskell.lib; {
        # https://github.com/NixOS/nixpkgs/issues/29724
        foundation = dontCheck super.foundation;
      };
    };
  };

}
