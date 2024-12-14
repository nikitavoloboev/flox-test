# https://floxcommunitygroup.slack.com/archives/C06NYALM8P8/p1733506171363389?thread_ts=1733501314.009969&cid=C06NYALM8P8
{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/master";
  outputs = inputs: {
    packages = builtins.mapAttrs (system: pkgs: {

      my-pnpm = pkgs.pnpm_9.overrideAttrs rec {
        version = "9.15.0";
        src = pkgs.fetchurl {
          url = "https://registry.npmjs.org/pnpm/-/pnpm-${version}.tgz";
          hash = "sha256-Caj+MaNP2nBjVGgGGfQAL0zO9trf+TJA0k72yDHw/Sg=";
        };
      };

    }) inputs.nixpkgs.legacyPackages;
  };
}
