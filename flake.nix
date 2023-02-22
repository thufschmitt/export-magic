{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs, ... }: let
    version = builtins.readFile ./.version;
  in {
    packages.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.runCommand "text" {} ''
      echo "${version}"
    '';
  };
}
