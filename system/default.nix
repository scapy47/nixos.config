{ pkgs, ... }:

{
  imports = [
    ./desktop.nix
  ];

  system.stateVersion = "26.11";

  boot.loader.limine.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Stella";
  networking.networkmanager.enable = true;

  users.users.shion = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    nh
  ];

  programs = {
    zsh.enable = true;
    nix-ld.enable = true;
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    package = pkgs.lixPackageSets.stable.lix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
      allowed-users = [ "@wheel" ];
    };
  };
}
