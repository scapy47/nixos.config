{
  description = "System configuration";
  inputs = {
    nixpkgs.url = "flake:nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations.Stella = nixpkgs.lib.nixosSystem {
      system = builtins.currentSystem or "x86_64-linux";
      modules = [
        ./system
        ./hosts
      ];
    };
  };
}
