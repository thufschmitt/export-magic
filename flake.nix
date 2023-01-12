{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs, ... }: let
    version = builtins.head (builtins.match ".*tag: ([0-9\.]*).*" (builtins.readFile ./.version));
  in {
    packages.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.writeText "text-${version}" ''
      This is version ${version}
    '';
  };
}
