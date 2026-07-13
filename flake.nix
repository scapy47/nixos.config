{
    discription = "System configuration";
    input = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
    output = { self, nixpkgs, ... }: {
        nixosConfigurations.Stella = nixpkgs.lib.nixosSystem {
            modules = [ ./configuration.nix ];
        };
    };
}
