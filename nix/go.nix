{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/master";
  outputs = inputs: {
    packages = builtins.mapAttrs (system: pkgs: {

      my-go = pkgs.go.overrideAttrs rec {
        version = "1.24rc1";
        src = pkgs.fetchFromGitHub {
          owner = "golang";
          repo = "go";
          rev = "go${version}";
          hash = "sha256-REPLACE_WITH_ACTUAL_HASH=";
        };
      };

    }) inputs.nixpkgs.legacyPackages;
  };
}