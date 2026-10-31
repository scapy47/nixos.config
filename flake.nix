{
  description = "System configuration";
  inputs = {
    nixpkgs.url = "flake:nixpkgs/nixos-unstable";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      disko,
      ...
    }:
    {
      nixosConfigurations.Stella = nixpkgs.lib.nixosSystem {
        system = builtins.currentSystem or "x86_64-linux";
        modules = [
          disko.nixosModules.disko

          ./system
          ./hosts
        ];
      };
    };
}
